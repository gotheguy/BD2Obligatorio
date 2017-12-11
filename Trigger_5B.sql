CREATE TRIGGER Parte5B
    ON TRABAJO
    INSTEAD OF DELETE
AS
    DELETE FROM TTAGS
    WHERE idTrab = (SELECT D.idTrab 
				   FROM deleted D 
				   WHERE YEAR(D.fechaInicio) NOT BETWEEN YEAR(GETDATE()) AND YEAR(GETDATE()-2)
				   AND D.lugarPublic=NULL)

    DELETE FROM Referencias
    WHERE idTrab = (SELECT D.idTrab 
				   FROM deleted D 
				   WHERE YEAR(D.fechaInicio) NOT BETWEEN YEAR(GETDATE()) AND YEAR(GETDATE()-2)
				   AND D.lugarPublic=NULL)

    DELETE FROM TAutores
    WHERE idTrab = (SELECT D.idTrab 
				   FROM deleted D 
				   WHERE YEAR(D.fechaInicio) NOT BETWEEN YEAR(GETDATE()) AND YEAR(GETDATE()-2)
				   AND D.lugarPublic=NULL)

	DELETE FROM Trabajo
    WHERE idTrab = (SELECT D.idTrab 
				   FROM deleted D 
				   WHERE YEAR(D.fechaInicio) NOT BETWEEN YEAR(GETDATE()) AND YEAR(GETDATE()-2)
				   AND D.lugarPublic=NULL)