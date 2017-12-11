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
--SELECT * FROM Parte7B