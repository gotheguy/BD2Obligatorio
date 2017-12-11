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
--		BEGIN
--		IF (@cantidad >0)
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
--	END
  END
END