BEGIN TRANSACTION

/*      UNIVERSIDAD       */

ALTER TABLE Universidad
	ALTER COLUMN nombre INTEGERNOT NULL
GO
ALTER TABLE Universidad
	ADD CONSTRAINT nombre_Pk PRIMARY KEY (nombre);
GO
ALTER TABLE Universidad
    ADD telefono VARCHAR(20);
GO
	
/*     INVESTIGADOR     */

ALTER TABLE Investigador
    DROP COLUMN idInvestigador;
GO
ALTER TABLE Investigador
	ADD  idInvestigador int IDENTITY(1,1) PRIMARY KEY;
GO
ALTER TABLE Investigador
	ADD CONSTRAINT CK_nivelInvestig CHECK (nivelInvestig IN ('EGrado','EMaestria','EDoctor','Doctor'));
GO
ALTER TABLE Investigador
	ADD CONSTRAINT mail_UQ UNIQUE (mail);
GO
	
/*      TRABAJO     */
ALTER TABLE Trabajo
    DROP COLUMN descripTrab;
GO
ALTER TABLE Trabajo
    ADD descripTrab VARCHAR(200)NOT NULL;
GO
ALTER Table Trabajo
	ADD CONSTRAINT CK_tipoTrab CHECK (tipoTrab IN ('poster','articulo','capitulo','otro'));
GO
ALTER TABLE Trabajo
	ADD CONSTRAINT lugarPublic_Fk_Lugares FOREIGN KEY (lugarPublic)
	REFERENCES Lugares (idLugar);
GO

/*    Tags      */
ALTER TABLE Tags
	DROP COLUMN idTag;
GO
ALTER TABLE Tags
	ADD  idTag int IDENTITY(1,2) PRIMARY KEY;
GO
	
/*      TTags     */
ALTER TABLE TTags
	ADD CONSTRAINT idTag_Fk_Tags FOREIGN KEY (idTag)
	REFERENCES Tags (idtag);
GO
ALTER TABLE TTags
	ADD CONSTRAINT idTrab_Fk_Trabajo FOREIGN KEY (idTrab)
	REFERENCES Trabajo (idTrab);
GO
	
/*    TAutores   */
ALTER TABLE TAutores
    DROP COLUMN rolinvestig;
GO
ALTER TABLE TAutores
	ADD  rolinvestig VARCHAR (20);
GO
ALTER TABLE TAutores
	ADD CONSTRAINT CK_rolinvestig CHECK (rolinvestig IN ('autor-ppal','autor-sec','autor-director'));
GO
ALTER TABLE TAutores
	ADD CONSTRAINT idInvestigador_Fk_Investigador FOREIGN KEY (idInvestigador)
	REFERENCES Investigador (idInvestigador);
GO
	
/*     Referencias    */
ALTER TABLE Referencias
	ADD CONSTRAINT CK_idTrab CHECK (idTrab <> idTrabReferenciado);
GO

/*   Lugares   */
ALTER TABLE Lugares
	ADD TipoLugar VARCHAR(20);
GO
ALTER TABLE Lugares
    DROP COLUMN nombre;
GO
ALTER TABLE Lugares
	ADD  nombre VARCHAR(250);
GO
ALTER TABLE Lugares
	ADD CONSTRAINT nombre_UQ Unique (nombre);
GO
ALTER TABLE Lugares
	ADD CONSTRAINT CK_TipoLugar CHECK (TipoLugar IN ('Congresos','Revistas','Libros'));
GO
ALTER TABLE Lugares
	ADD CONSTRAINT CK_nivelLugar CHECK (niveLugar BETWEEN 1 AND 4);
GO


--ROLLBACK TRANSACTION
--COMMIT TRANSACTION