USE BD2Obligatorio
GO

--A

SELECT		t.idTrab,
			t.nomTrab,
			COUNT(ta.idTrab)	AS	cantAutores,
			l.idLugar,
			l.nombre

FROM		Trabajo		AS	t
JOIN		TAutores	AS	ta	ON t.idTrab		 = ta.idTrab
JOIN		Lugares		AS	l	ON t.LugarPublic = l.idLugar

GROUP BY	t.idTrab,
			t.nomTrab,
			l.idLugar,
			l.nombre

HAVING		COUNT(ta.idTrab) > 3


--B

SELECT DISTINCT	ta.palabra

FROM		Trabajo	AS	t
JOIN		TTags	AS	tt	ON	t.idTrab	  = tt.idTrab
JOIN		Tags	AS	ta	ON	tt.idTag	  = ta.idTag

WHERE		ta.palabra LIKE '%BASE DE DATOS%'
AND			tt.idTrab IN (SELECT t.idTrab
						  FROM	 Trabajo AS t
						  JOIN	 Lugares AS	l ON t.LugarPublic = l.idLugar
						  WHERE	 l.TipoLugar = 'Revistas'
						  AND	 YEAR(l.anio) = YEAR(GETDATE())
						  GROUP BY t.idTrab)

ORDER BY	ta.palabra ASC