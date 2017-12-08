CREATE VIEW PARTE7B AS(
SELECT I.idInvestigador, TA.idTrab,TA.letra, 
	(SELECT MIN(T.fechaInicio) 
	FROM TRABAJO T, TAutores TA WHERE I.idInvestigador = TA.idInvestigador
	AND T.idTrab = TA.idTrab) AS 'FECHA PRIMER TRABAJO',
	(SELECT MAX(T.fechaInicio) 
	FROM TRABAJO T, TAutores TA WHERE I.idInvestigador = TA.idInvestigador
	AND T.idTrab = TA.idTrab) AS 'FECHA ULTIMO TRABAJO'
FROM Investigador I, TAutores TA, Trabajo T
WHERE I.idInvestigador = TA.idInvestigador
AND T.idTrab = TA.idTrab
GROUP BY I.idInvestigador, TA.idTrab, TA.letra
)