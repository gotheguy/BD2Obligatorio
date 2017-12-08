CREATE VIEW PARTE7A AS(
SELECT		L.idLugar,L.universidad,  COUNT(DISTINCT(t.idTrab)) AS 'Cantidad Trabajos Publicados'
FROM		LUGARES AS L
JOIN		Investigador	 AS i	ON i.idUniversidad != l.universidad
JOIN		TAutores		 AS ta	ON ta.idInvestigador = i.idInvestigador
JOIN		Trabajo			 AS	t	ON t.lugarPublic = l.idLugar AND T.idTrab=TA.idTrab
WHERE L.TipoLugar='Congresos'
GROUP BY L.idLugar,L.universidad
)