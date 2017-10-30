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

SELECT DISTINCT		u.*,l.link

FROM		Universidad		AS	u
JOIN		Lugares			AS	l	ON u.nombre	= l.universidad

WHERE		TipoLugar = 'Congresos'
AND			nivelLugar = 4
	
GROUP BY	u.ciudad,
			u.nombre,
			u.pais,
			u.telefono,
			l.link

--HAVING		COUNT(1) = 1


--D

SELECT DISTINCT		ta.idInvestigador, MAX(tr.fechaInicio)

FROM		TAutores		AS	ta,
			Trabajo			AS	tr

WHERE		ta.idTrab=tr.idTrab 
AND			ta.rolinvestig='autor-ppal'
GROUP BY	ta.idInvestigador