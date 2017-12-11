USE BD2Obligatorio
GO

CREATE VIEW PARTE7A AS(
SELECT		L.idLugar,L.universidad,  COUNT(DISTINCT(t.idTrab)) AS 'Cantidad Trabajos Publicados'
FROM		LUGARES			 AS l
JOIN		Investigador	 AS i	ON i.idUniversidad <> l.universidad
JOIN		TAutores		 AS ta	ON ta.idInvestigador = i.idInvestigador
JOIN		Trabajo			 AS	t	ON t.lugarPublic = l.idLugar AND t.idTrab=ta.idTrab AND t.letra = ta.letra
WHERE L.TipoLugar='Congresos'
GROUP BY L.idLugar,L.universidad
)
GO
--SELECT * FROM PARTE7A


CREATE VIEW PARTE7B AS(
SELECT I.idInvestigador, t.tipoTrab,
	(SELECT MIN(T.fechaInicio) 
	FROM TRABAJO T, TAutores TA WHERE I.idInvestigador = TA.idInvestigador
	AND T.idTrab = TA.idTrab) AS 'FECHA PRIMER TRABAJO',
	(SELECT MAX(T.fechaInicio) 
	FROM TRABAJO T, TAutores TA WHERE I.idInvestigador = TA.idInvestigador
	AND T.idTrab = TA.idTrab) AS 'FECHA ULTIMO TRABAJO'
FROM		Investigador I
LEFT JOIN	TAutores	 TA		ON i.idinvestigador = ta.idInvestigador 
LEFT JOIN	Trabajo		 T		ON ta.idTrab = t.idTrab and ta.letra = t.letra
GROUP BY I.idInvestigador, t.tipoTrab, TA.letra
)
GO
--SELECT * FROM Parte7B

--A

SELECT		CAST(t.idTrab AS VARCHAR(20)) + '-' + t.letra AS idTrab,
			t.nomTrab,
			COUNT(ta.idInvestigador)	AS	cantAutores,
			l.idLugar,
			l.nombre

FROM		Trabajo		AS	t
JOIN		TAutores	AS	ta	ON t.idTrab		 = ta.idTrab
JOIN		Lugares		AS	l	ON t.LugarPublic = l.idLugar

GROUP BY	CAST(t.idTrab AS VARCHAR(20)) + '-' + t.letra,
			t.nomTrab,
			l.idLugar,
			l.nombre	

HAVING		COUNT(ta.idInvestigador) > 3


--B

SELECT DISTINCT	ta.palabra

FROM		Trabajo	AS	t
JOIN		TTags	AS	tt	ON	t.idTrab	  = tt.idTrab
JOIN		Tags	AS	ta	ON	tt.idTag	  = ta.idTag

WHERE		(t.nomTrab LIKE '%base%'
OR			t.descripTrab LIKE '%base%')
AND			tt.idTrab IN (SELECT t.idTrab
						  FROM	 Trabajo AS t
						  JOIN	 Lugares AS	l ON t.LugarPublic = l.idLugar
						  WHERE	 l.TipoLugar = 'Revistas'
						  AND	 l.anio = YEAR(GETDATE())
						  GROUP BY t.idTrab)

GROUP BY	ta.palabra

ORDER BY	ta.palabra ASC


--C

SELECT				u.*,
					l.link

FROM		Universidad		AS	u,
			Lugares			AS	l

WHERE	    u.nombre	= l.universidad
AND			anio BETWEEN YEAR(GETDATE())-5 AND YEAR(GETDATE())
AND			u.nombre = (SELECT l2.universidad
						FROM Lugares l2
						WHERE l2.TipoLugar = 'Congresos'
						AND	l2.nivelLugar = 4
						GROUP BY l2.universidad
						HAVING COUNT(*) > 2)

AND l.idLugar IN (SELECT T.lugarPublic
				  FROM trabajo T
				  GROUP BY T.lugarPublic
				  HAVING COUNT (*) > 20)

GROUP BY	u.ciudad,
			u.nombre,
			u.pais,
			u.telefono,
			l.link


--D

SELECT DISTINCT		ta.idInvestigador, 
					MAX(tr.fechaInicio)	AS UltimaFecha

FROM		TAutores		AS	ta,
			Trabajo			AS	tr

WHERE		ta.idTrab=tr.idTrab 
AND			ta.rolinvestig='autor-ppal'
GROUP BY	ta.idInvestigador


--E

SELECT		i.idInvestigador,
			i.nombre,
			i.idUniversidad,
			COUNT(t.lugarPublic) AS trabajosPublicados,
			l.nivelLugar

FROM		Investigador AS i
JOIN		TAutores	 AS ta	ON i.idInvestigador = ta.idInvestigador
JOIN		Trabajo		 AS t	ON ta.idTrab = t.idTrab AND ta.letra = t.letra
JOIN		Lugares		 AS	l	ON t.lugarPublic = l.idLugar

WHERE		i.carrera = 'Ingeniería'
AND			l.anio BETWEEN YEAR(GETDATE())-5 AND YEAR(GETDATE())

GROUP BY	i.idInvestigador,
			i.nombre,
			i.idUniversidad,
			l.nivelLugar

ORDER BY	i.idInvestigador



--F

SELECT		i.idInvestigador,
			COUNT(t.lugarPublic) AS trabajosPublicados

FROM		Investigador AS i
JOIN		TAutores	 AS ta	ON i.idInvestigador = ta.idInvestigador
JOIN		Trabajo		 AS t	ON ta.idTrab = t.idTrab AND ta.letra = t.letra
LEFT JOIN	Lugares		 AS	l	ON t.lugarPublic = l.idLugar

WHERE		l.universidad	= 'ORT'
AND			l.tipoLugar		= 'Congresos'
AND			l.nivelLugar	= 4
AND			YEAR(T.fechaInicio) = YEAR(GETDATE())

GROUP BY	i.idInvestigador



--G

SELECT DISTINCT	l.universidad,
				t.nomTrab,
				t.tipoTrab,
				t.fechaInicio,
				t.linkTrab,
				t.lugarPublic,
				t.descripTrab,
				dbo.UltimoTrabajoxUniversidad(l.universidad) AS UltimoTrabajo

FROM			Trabajo		AS	t
JOIN			Lugares		AS	l	ON	l.idLugar = t.lugarPublic

WHERE			CAST(t.idTrab AS VARCHAR(20)) + '-' + t.letra =  dbo.UltimoTrabajoxUniversidad(l.universidad)


--H

DELETE
FROM	Tags 
WHERE	idTag NOT IN(SELECT idTag FROM TTags)