USE BD2Obligatorio
GO

--A

CREATE FUNCTION UltimoTrabajoxUniversidad 
(
	@universidad VARCHAR(50)
)  
RETURNS VARCHAR(100)
AS  
BEGIN   

DECLARE @trabajo VARCHAR(100) = (SELECT TOP 1 CAST(t.idTrab AS VARCHAR(20)) + '-' + t.letra AS idTrab
								FROM		Trabajo		AS	t
								JOIN		TAutores	AS	ta	ON t.idTrab		 = ta.idTrab AND t.letra = ta.letra
								JOIN		Lugares		AS	l	ON t.LugarPublic = l.idLugar
								JOIN		(SELECT	l.idLugar,
											CASE
											WHEN l.TipoLugar = 'Congresos'
											THEN (CAST(CAST(l.anio AS VARCHAR(4)) +
													RIGHT('0' + CAST(l.mes AS VARCHAR(2)), 2) +
													RIGHT('0' + CAST(l.diaIniCon AS VARCHAR(2)), 2) AS DATE)) 
											ELSE (CAST(CAST(l.anio AS VARCHAR(4)) +
													RIGHT('0' + CAST(l.mes AS VARCHAR(2)), 2) +
													RIGHT('0' + CAST(l.diaIni AS VARCHAR(2)), 2) AS DATE)) 
											END AS FechaPublic	
											FROM Lugares AS	l) AS dd	ON l.idLugar = dd.idLugar
								WHERE		l.universidad = @universidad
								ORDER BY	FechaPublic DESC
								)

RETURN @trabajo
END
GO  
--SELECT dbo.UltimoTrabajoxUniversidad('ORT') AS idTrab


--B

CREATE FUNCTION CantidadReferenciasExternas 
(
	@idTrab INT,
	@letra CHAR(1)
)  
RETURNS INT  
AS  
BEGIN   

DECLARE @cantidad INT

SET @cantidad = (SELECT	COUNT(*)	AS CantReferencias
				 FROM	referencias	AS r
				 WHERE @idTrab = r.idTrabReferenciado AND @letra = r.letraReferenciado)

RETURN @cantidad;
END
GO  

--SELECT dbo.CantidadReferenciasExternas(17,'A') AS cantReferencias


--C

CREATE FUNCTION CantidadTrabajosPublicados 
(
	@investigador1 INT,
	@investigador2 INT
)  
RETURNS INT  
AS  
BEGIN   

DECLARE @cantidad INT 
	
SELECT @cantidad = (SELECT DISTINCT COUNT(*) OVER() AS cantTrabajos
					FROM		TAutores			AS ta
					WHERE		@investigador1 = ta.idInvestigador 
					OR			@investigador2 = ta.idInvestigador
					AND			(CAST(idTrab AS VARCHAR(20)) + '-' + letra IN (SELECT CAST(idTrab AS VARCHAR(20)) + '-' + letra AS idTrab
																			   FROM TAutores
																			   WHERE rolinvestig = 'autor-ppal'
																			   AND idInvestigador = @investigador1
																			   GROUP BY CAST(idTrab AS VARCHAR(20)) + '-' + letra)
					OR			CAST(idTrab AS VARCHAR(20)) + '-' + letra IN (SELECT CAST(idTrab AS VARCHAR(20)) + '-' + letra AS idTrab
																			  FROM TAutores
																			  WHERE rolinvestig = 'autor-ppal'
																			  AND idInvestigador = @investigador2
																			  GROUP BY CAST(idTrab AS VARCHAR(20)) + '-' + letra))
					GROUP BY	CAST(ta.idTrab AS VARCHAR(20)) + '-' + ta.letra
					HAVING		COUNT(*) > 1)

RETURN @cantidad
END
GO  
--SELECT dbo.CantidadTrabajosPublicados(4,6) AS cantTrabajos


--D

CREATE PROCEDURE ActualizarTrabajosPublicados
(
	@investigador INT
)  
AS  
BEGIN  

SELECT 	CASE
		WHEN COUNT(ta.idInvestigador) = i.cantTrabPub
		THEN 'La cantidad era correcta'
		ELSE 'La cantidad no era correcta'
		END

FROM	Investigador	AS  i
JOIN	TAutores		AS	ta	ON i.idInvestigador = ta.idInvestigador
WHERE	i.idInvestigador = @investigador

GROUP BY i.idInvestigador,
		 i.cantTrabPub

UPDATE  Investigador
SET		cantTrabPub = (SELECT COUNT(idInvestigador) FROM TAutores WHERE idInvestigador = @investigador)
WHERE	idInvestigador = @investigador

END
GO

--EXEC dbo.ActualizarTrabajosPublicados'1'


--E

CREATE FUNCTION CantTrabajosXPalabraClave
(
	@a�o1 INT,
	@a�o2 INT,
	@palabra VARCHAR(100)
)
RETURNS INT  
AS  
BEGIN   

DECLARE @cantidad INT 

SELECT @cantidad =	(SELECT COUNT(1)	AS	CantTrabajosPublicados
					FROM	Trabajo		AS	t
					JOIN	Lugares		AS	l	ON l.idLugar = t.LugarPublic
					WHERE	(l.TipoLugar = 'Libros' OR l.TipoLugar = 'Revistas') 
					AND		l.anio >= @a�o1 AND l.anio <= @a�o2
					AND		(t.nomTrab LIKE '%' + @palabra + '%' OR t.descripTrab LIKE '%' + @palabra + '%'))
				
RETURN @cantidad
END
GO

--SELECT dbo.CantTrabajosXPalabraClave(2015,2017,'Base') AS	CantTrabajos


--F

CREATE FUNCTION NuevoIdTipoTrabajo
(
	@tipoTrab VARCHAR(20)
)
RETURNS	VARCHAR(20)
AS
BEGIN

DECLARE @id VARCHAR(20)

SELECT @id = (SELECT	(SELECT CAST(MAX(idTrab + 1) AS VARCHAR(20)) FROM Trabajo) + '-' + LEFT(@tipoTrab,1) AS nuevoId) 

RETURN @id
END
GO  

--SELECT dbo.NuevoIdTipoTrabajo('Ensayo')	AS	nuevoId


--G

CREATE PROCEDURE CongresoUltimoArticulo
(
	@universidad VARCHAR(100)
)  
AS  
BEGIN  

DECLARE	@rowcount INT 

IF OBJECT_ID('tempdb.dbo.#tmp') IS NOT NULL
DROP TABLE #tmp

SELECT TOP 1	l.*,
				CASE
				WHEN l.TipoLugar = 'Congresos'
				THEN (CAST(CAST(l.anio AS VARCHAR(4)) +
						RIGHT('0' + CAST(l.mes AS VARCHAR(2)), 2) +
						RIGHT('0' + CAST(l.diaIniCon AS VARCHAR(2)), 2) AS DATE)) 
				ELSE (CAST(CAST(l.anio AS VARCHAR(4)) +
						RIGHT('0' + CAST(l.mes AS VARCHAR(2)), 2) +
						RIGHT('0' + CAST(l.diaIni AS VARCHAR(2)), 2) AS DATE)) 
				END AS FechaPublic

INTO		#tmp	

FROM		Trabajo		AS	t 
JOIN		Lugares		AS	l	ON	t.lugarPublic = l.idLugar

WHERE		l.TipoLugar = 'Congresos'
AND			l.universidad = @universidad
AND			t.tipoTrab = 'articulo'

ORDER BY	FechaPublic DESC

SET @rowcount = @@ROWCOUNT

IF @rowcount > 0
BEGIN	
	SELECT tmp.*,('Existe un art�culo publicado en ' + @universidad) AS Mensaje FROM #tmp AS tmp
END
ELSE 
BEGIN
	SELECT ('No existe un art�culo publicado en ' + @universidad) AS Mensaje
END


END
GO
--EXEC dbo.CongresoUltimoArticulo'UDELAR'



--H

CREATE FUNCTION CantidadInvestigadoresxTipoTrab 
(
	@tipoTrab VARCHAR(20)
)  
RETURNS INT  
AS  
BEGIN   

DECLARE @cantidad INT

SELECT @cantidad =	(SELECT DISTINCT	COUNT(i.idInvestigador) OVER()	AS	cantInvestigadores
					FROM		Investigador	AS	i 
					JOIN		TAutores		AS	ta	ON i.idInvestigador = ta.idInvestigador
					JOIN		Trabajo			AS	t	ON t.idTrab = ta.idTrab AND t.letra = ta.letra
					WHERE		t.tipoTrab = @tipoTrab
					GROUP BY	i.idInvestigador
					HAVING		COUNT(*) > 5
					AND			COUNT(*) >= ALL (SELECT DISTINCT COUNT(ta.idInvestigador)
												FROM		Investigador	AS	i 
												JOIN		TAutores		AS	ta	ON i.idInvestigador = ta.idInvestigador
												JOIN		Trabajo			AS	t	ON t.idTrab = ta.idTrab AND t.letra = ta.letra
												WHERE		t.tipoTrab = @tipoTrab
												GROUP BY	i.idInvestigador))

RETURN @cantidad
END

GO  
--SELECT dbo.CantidadInvestigadoresxTipoTrab('Poster')	AS	CantInvestigadores