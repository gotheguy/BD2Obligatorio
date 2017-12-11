USE BD2Obligatorio
GO


CREATE TRIGGER Parte5A ON Trabajo
INSTEAD OF INSERT
AS 
DECLARE @nomTrab VARCHAR(100),
		@tipoTrab VARCHAR(50),
		@fechaIinicio DATE,
		@linkTrab VARCHAR(100),
		@lugarPublic INT,
		@descripTrab VARCHAR(200),
		@idTrab INT,
		@letra CHAR(1)
FOR EACH ROW
BEGIN

	SELECT @nomTrab = i.nomTrab, @tipoTrab = i.tipoTrab, @fechaIinicio = ISNULL(i.fechaInicio,CAST(YEAR(GETDATE()) AS VARCHAR(10)) + '0101'), 
	@linkTrab = i.linkTrab, @lugarPublic = i.lugarPublic, @descripTrab = i.descripTrab, @idTrab = i.idTrab, @letra = i.letra
	FROM inserted I



END
GO




CREATE TRIGGER Parte5B
    ON TRABAJO
    INSTEAD OF DELETE
AS
BEGIN
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

END
GO

CREATE TRIGGER Parte5C
ON referencias
INSTEAD OF INSERT
AS
DECLARE 
@palabraClaveInsert varchar(50),
@palabraClaveReferencia varchar(50);
BEGIN
	select @palabraClaveInsert = t.palabra  
	from inserted i, Trabajo tra, TTags tt, tags t
	where i.idTrab=tra.idTrab 
	AND tra.idTrab = tt.idTrab 
	AND tt.idTag = t.idTag;

	select @palabraClaveReferencia = t.palabra
	from trabajo tra, TTags tt, Tags t, inserted i
	where i.idTrabReferenciado = tra.idTrab
	AND tra.idTrab = tt.idTrab
	AND t.idTag = tt.idTag;

IF ((@palabraClaveInsert IS NOT NULL)AND(CHARINDEX(@palabraClaveInsert,@palabraClaveReferencia, 0) > 0))

		BEGIN
			PRINT('Los trabajos comparten como mínimo una misma palabra clave')
			ROLLBACK
		END;
ELSE
	BEGIN
		INSERT INTO Referencias SELECT I.idTrab,I.letra,I.idTrabReferenciado,I.letraReferenciado 
		FROM inserted I;
	END
END;
GO


CREATE TRIGGER Parte5D
ON lugares
INSTEAD OF INSERT, UPDATE
AS
DECLARE
	@idlugar int,
	@nombre varchar(250),
	@nivelLugar int,
	@anio int,
	@mes int,
	@diaIni int,
	@diaFin int,
	@link varchar(200),
	@universidad varchar(50),
	@tipoLugar varchar(20),
	@diaIniCon int,
	@diaFinCon int,
	@cantidad int
BEGIN
	SELECT @idlugar=i.idLugar, @nombre=i.nombre, @nivelLugar=i.nivelLugar,@anio=i.anio,
	@mes=i.mes, @diaIni=i.diaIni, @diaFin=i.diaFin, @link=i.link, @universidad=i.universidad, @tipoLugar = i.TipoLugar,
	@diaIniCon=i.diaIniCon,@diaFinCon=i.diaFinCon
	FROM inserted I

	SELECT @cantidad = COUNT (T.lugarPublic) FROM inserted I, trabajo t
	WHERE I.idLugar = t.lugarPublic

	IF (@cantidad >0)
		BEGIN
			UPDATE Lugares set nombre=@nombre,
							   nivelLugar=@nivelLugar,
							   anio=@anio,
							   mes=@mes,
							   diaIni=@diaIni,
							   diaFin=@diaFin,
							   link=@link,
							   universidad=@universidad,
							   TipoLugar=@tipoLugar,
							   diaIniCon=@diaIniCon,
							   diaFinCon=@diaFinCon
			WHERE @idlugar = Lugares.idLugar;
			
			INSERT INTO DBO.TablaAuxiliar SELECT 
							   idLugar=@idlugar,
							   nombre=@nombre,
							   nivelLugar=@nivelLugar,
							   anio=@anio,
							   mes=@mes,
							   diaIni=@diaIni,
							   diaFin=@diaFin,
							   link=@link,
							   universidad=@universidad,
							   usuario = CURRENT_USER,
							   FECHA = GETDATE(),
							   TipoLugar=@tipoLugar,
							   diaIniCon=@diaIniCon,
							   diaFinCon=@diaFinCon;
	END
	ELSE
		BEGIN
			INSERT INTO Lugares SELECT
							   idLugar=@idlugar, 
							   nombre=@nombre,
							   nivelLugar=@nivelLugar,
							   anio=@anio,
							   mes=@mes,
							   diaIni=@diaIni,
							   diaFin=@diaFin,
							   link=@link,
							   universidad=@universidad,
							   TipoLugar=@tipoLugar,
							   diaIniCon=@diaIniCon,
							   diaFinCon=@diaFinCon;
			
			INSERT INTO DBO.TablaAuxiliar SELECT 
							   idLugar=@idlugar,
							   nombre=@nombre,
							   nivelLugar=@nivelLugar,
							   anio=@anio,
							   mes=@mes,
							   diaIni=@diaIni,
							   diaFin=@diaFin,
							   link=@link,
							   universidad=@universidad,
							   usuario = CURRENT_USER,
							   fecha = GETDATE(),
							   TipoLugar=@tipoLugar,
							   diaIniCon=@diaIniCon,
							   diaFinCon=@diaFinCon;

  END
END
GO