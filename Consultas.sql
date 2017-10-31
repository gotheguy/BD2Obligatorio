USE BD2Obligatorio
GO

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

--SELECT DISTINCT		u.*,
--					l.link

--FROM		Universidad		AS	u
--JOIN		Lugares			AS	l	ON u.nombre	= l.universidad

--WHERE		TipoLugar = 'Congresos'
--AND			nivelLugar = 4
--AND			u.nombre = (SELECT universidad
--						FROM Lugares 
--						WHERE TipoLugar = 'Congresos'
--						AND	nivelLugar = 4
--						GROUP BY universidad
--						HAVING COUNT(*) >= 2)	
--AND			anio BETWEEN YEAR(GETDATE())-5 AND YEAR(GETDATE())

--GROUP BY	u.ciudad,
--			u.nombre,
--			u.pais,
--			u.telefono,
--			l.link

--HAVING		COUNT(tipoLugar) = 1


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
AND			anio BETWEEN YEAR(GETDATE())-5 AND YEAR(GETDATE())

GROUP BY	i.idInvestigador,
			i.nombre,
			i.idUniversidad,
			l.nivelLugar

ORDER BY	i.idInvestigador



--F

--SELECT		i.idInvestigador,
--			COUNT(t.lugarPublic) AS trabajosPublicados

--FROM		Investigador AS i
--JOIN		TAutores	 AS ta	ON i.idInvestigador = ta.idInvestigador
--JOIN		Trabajo		 AS t	ON ta.idTrab = t.idTrab AND ta.letra = t.letra
--JOIN		Lugares		 AS	l	ON t.lugarPublic = l.idLugar

--WHERE		l.universidad	= 'ORT'
--AND			l.tipoLugar		= 'Congresos'
--AND			l.nivelLugar	= 4

--GROUP BY	i.idInvestigador


--H

DELETE
FROM Tags 
WHERE idTag NOT IN(SELECT idTag FROM TTags)