USE BD2Obligatorio
GO

--A

ALTER FUNCTION UltimoTrabajoxUniversidad 
(
	@universidad VARCHAR(50)
)  
RETURNS TABLE  
AS  
RETURN   

SELECT TOP 1 CAST(t.idTrab AS VARCHAR(20)) + '-' + t.letra AS idTrab,
			t.nomTrab,
			t.tipoTrab,
			t.descripTrab,
			t.fechaInicio,
			t.linkTrab,
			t.lugarPublic,
			dd.FechaPublic
--select *
FROM		Trabajo		AS	t
JOIN		TAutores	AS	ta	ON t.idTrab		 = ta.idTrab
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

GROUP BY	CAST(t.idTrab AS VARCHAR(20)) + '-' + t.letra,
			t.nomTrab,
			t.tipoTrab,
			t.descripTrab,
			t.fechaInicio,
			t.linkTrab,
			t.lugarPublic,
			dd.FechaPublic

GO  

--SELECT * FROM dbo.UltimoTrabajoxUniversidad('ORT')


--B

ALTER FUNCTION CantidadReferenciasExternas 
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
				 WHERE @idTrab = r.idTrab AND @letra = r.letra)

RETURN @cantidad;
END
GO  

--SELECT dbo.CantidadReferenciasExternas(1,'A') AS cantReferencias



--c

ALTER FUNCTION CantidadTrabajosPublicados 
(
	@investigador1 INT,
	@investigador2 INT
)  
RETURNS INT  
AS  
BEGIN   

DECLARE @cantidad INT
DECLARE @investigador1 INT = 5
DECLARE @investigador2 INT = 6

SELECT		CAST(ta.idTrab AS VARCHAR) + '-' + ta.letra,
			ta.idInvestigador,
			ta.rolinvestig

FROM		TAutores	AS	ta	
WHERE		@investigador1 = ta.idInvestigador OR @investigador2 = ta.idInvestigador
AND			(@investigador1 IN (SELECT idInvestigador
							   FROM TAutores
							   WHERE rolinvestig = 'autor-ppal'
							   AND idInvestigador = @investigador1
							   GROUP BY idInvestigador)
OR			@investigador2 IN (SELECT idInvestigador
							   FROM TAutores
							   WHERE rolinvestig = 'autor-ppal'
							   AND idInvestigador = @investigador2
							   GROUP BY idInvestigador))

GROUP BY	CAST(ta.idTrab AS VARCHAR) + '-' + ta.letra,
			ta.idInvestigador,
			ta.rolinvestig
HAVING		COUNT(ta.idInvestigador) > 1


RETURN @cantidad;
END
GO  

select * from tautores where rolinvestig = 'autor-ppal' order by idTrab

--SELECT dbo.CantidadTrabajosPublicados(5,6) AS cantTrabajos