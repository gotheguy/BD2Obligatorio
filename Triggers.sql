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

IF (@palabraClaveInsert IS NOT NULL AND @palabraClaveInsert LIKE '%'+@palabraClaveReferencia+'%')
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
