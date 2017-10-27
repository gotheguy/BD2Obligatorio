USE BD2Obligatorio
GO

BEGIN TRANSACTION

/*      UNIVERSIDAD       */
ALTER TABLE Universidad
	DROP COLUMN nombre;
GO
ALTER TABLE Universidad
	ADD nombre VARCHAR(50) PRIMARY KEY;
GO
ALTER TABLE Universidad
    ADD telefono VARCHAR (30) NOT NULL;
GO
	
/*     INVESTIGADOR     */

ALTER TABLE Investigador
    DROP COLUMN idInvestigador;
GO
ALTER TABLE Investigador
	ADD idInvestigador INT IDENTITY(1,1) PRIMARY KEY;
GO
ALTER TABLE Investigador
	ADD idUniversidad VARCHAR(50) FOREIGN KEY (idUniversidad) 
	REFERENCES Universidad(nombre) NOT NULL;
GO
ALTER TABLE Investigador
	ADD CONSTRAINT CK_nivelInvestig_Investigador CHECK (nivelInvestig IN ('EGrado','EMaestria','EDoctor','Doctor'));
GO
ALTER TABLE Investigador
	ADD CONSTRAINT UQ_mail_Investigador UNIQUE (mail);
GO
	
/*      TRABAJO     */
ALTER TABLE Trabajo
    DROP COLUMN descripTrab;
GO
ALTER TABLE Trabajo
    ADD descripTrab VARCHAR (200) NOT NULL;
GO
ALTER Table Trabajo
	ADD CONSTRAINT CK_tipoTrab_Trabajo CHECK (tipoTrab IN ('poster','articulo','capitulo','otro'));
GO
ALTER TABLE Trabajo
	ADD CONSTRAINT FK_lugarPublic_Lugares FOREIGN KEY (lugarPublic)
	REFERENCES Lugares (idLugar);
GO
--idTrab debe modificarse mas adelante. Su PK es un alfanumerico con condiciones
ALTER TABLE Trabajo
    DROP COLUMN idTrab;
GO
ALTER TABLE Trabajo
    ADD idTrab INT IDENTITY(1,1) NOT NULL;
GO 
ALTER TABLE Trabajo
    ADD letra CHAR(1) NOT NULL;
GO 
ALTER TABLE Trabajo
	ADD CONSTRAINT CK_letra_Trabajo CHECK(letra = LEFT(tipoTrab,1));
GO
ALTER TABLE Trabajo
	ADD CONSTRAINT PK_letra_idTrab_Trabajo PRIMARY KEY (letra,idTrab);
GO

/*    Tags      */
ALTER TABLE Tags
	DROP COLUMN idTag;
GO
ALTER TABLE Tags
	ADD idTag INT IDENTITY(1,2) PRIMARY KEY;
GO
	
/*      TTags     */
ALTER TABLE TTags
	DROP COLUMN idTrab;
GO
ALTER TABLE TTags
	ADD idTrab VARCHAR(20) NOT NULL; --SE TENDR� QUE MODIFICAR idTrab SEG�N CAMBIO EN TABLA TRABAJO
GO
ALTER TABLE TTags
	ADD CONSTRAINT FK_idTag_TTags FOREIGN KEY (idTag)
	REFERENCES Tags (idtag);
GO
ALTER TABLE TTags
	ADD CONSTRAINT FK_idTrab_TTags FOREIGN KEY (idTrab)
	REFERENCES Trabajo (idTrab);
GO
ALTER TABLE TTags
	ADD CONSTRAINT PK_idTag_idTrab_TTags PRIMARY KEY (idTrab,idTag)
GO
	
/*    TAutores   */
ALTER TABLE TAutores
	DROP COLUMN idTrab;
GO
ALTER TABLE TAutores
	ADD idTrab VARCHAR(20) NOT NULL; --SE TENDR� QUE MODIFICAR idTrab SEG�N CAMBIO EN TABLA TRABAJO
GO
ALTER TABLE TAutores
	ALTER COLUMN rolinvestig VARCHAR(20);
GO
ALTER TABLE TAutores
	ADD CONSTRAINT CK_rolinvestig_TAutores CHECK (rolinvestig IN ('autor-ppal','autor-sec','autor-director'));
GO
ALTER TABLE TAutores
	ADD CONSTRAINT FK_idTrab_TAutores FOREIGN KEY (idTrab)
	REFERENCES Trabajo (idTrab);
GO
ALTER TABLE TAutores
	ADD CONSTRAINT FK_idInvestigador_TAutores FOREIGN KEY (idInvestigador)
	REFERENCES Investigador (idInvestigador);
GO
ALTER TABLE TAutores
	ADD CONSTRAINT PK_idTrab_idInvestigador_TAutores PRIMARY KEY (idTrab, idInvestigador); --ATENCI�N CON idTrab SEG�N CAMBIO EN TABLA TRABAJO
GO
	
/*     Referencias    */
ALTER TABLE Referencias
	ALTER COLUMN idTrab VARCHAR(20) NOT NULL; --SE TENDR� QUE MODIFICAR idTrab SEG�N CAMBIO EN TABLA TRABAJO
GO
ALTER TABLE Referencias
	ADD CONSTRAINT CK_idTrab_Referencias CHECK (idTrab <> idTrabReferenciado);
GO
ALTER TABLE Referencias
	ADD CONSTRAINT FK_idTrab_Referencias FOREIGN KEY (idTrab)
	REFERENCES Trabajo (idTrab);
GO
ALTER TABLE Referencias
	ADD CONSTRAINT PK_idTrab_idTrabReferenciado_Referencias PRIMARY KEY (idTrab, idTrabReferenciado); --ATENCI�N CON idTrab SEG�N CAMBIO EN TABLA TRABAJO
GO

/*   Lugares   */
ALTER TABLE Lugares
	ADD TipoLugar VARCHAR (20);
GO
ALTER TABLE Lugares
	ADD diaIniCon INT;
GO
ALTER TABLE Lugares
	ADD diaFinCon INT;
GO
ALTER TABLE Lugares
	ALTER COLUMN nombre VARCHAR (250) NOT NULL;
GO
ALTER TABLE Lugares
	ADD CONSTRAINT UQ_nombre_Lugares UNIQUE (nombre);
GO
ALTER TABLE Lugares
	ADD CONSTRAINT CK_TipoLugar_Lugares CHECK (TipoLugar IN ('Congresos','Revistas','Libros'));
GO
ALTER TABLE Lugares
	ADD CONSTRAINT CK_nivelLugar_Lugares CHECK (nivelLugar BETWEEN 1 AND 4);
GO
ALTER TABLE Lugares
	ADD CONSTRAINT FK_universidad_Lugares FOREIGN KEY (universidad) REFERENCES Universidad (nombre);
GO
ALTER TABLE Lugares
	ADD CONSTRAINT CK_diaIni_diaIniCon_Lugares CHECK (diaIni IS NOT NULL AND diaIniCon IS NULL AND TipoLugar IN ('Revistas','Libros') OR 
													  diaIniCon IS NOT NULL AND diaIni IS NULL AND TipoLugar = 'Congresos');
GO
ALTER TABLE Lugares
	ADD CONSTRAINT CK_diaFin_diaFinCon_Lugares CHECK (diaFin IS NOT NULL AND diaFinCon IS NULL AND TipoLugar IN ('Revistas','Libros') OR 
													  diaFinCon IS NOT NULL AND diaFin IS NULL AND TipoLugar = 'Congresos');
GO


--ROLLBACK TRANSACTION
--COMMIT TRANSACTION