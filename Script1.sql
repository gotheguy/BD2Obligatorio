/* Creacion de la BD */
IF EXISTS(SELECT * FROM SysDataBases WHERE name='BD2Obligatorio')
BEGIN
	DROP DATABASE BD2Obligatorio
END
GO

CREATE DATABASE BD2Obligatorio
GO

USE BD2Obligatorio
GO
/* Creacion de tablas */

BEGIN TRANSACTION

CREATE TABLE Universidad 
(
	nombre	VARCHAR(100), 
	pais	VARCHAR(50) NOT NULL, 
	ciudad	VARCHAR(50) NOT NULL 
)
GO
--SELECT * FROM Universidad

CREATE TABLE Investigador 
(
	idInvestigador	INT, 
	nombre			VARCHAR(100) NOT NULL, 
	mail			VARCHAR(200), 
	telefono		VARCHAR(20),
	carrera			VARCHAR(50), 
	nivelInvestig	VARCHAR(20) NOT NULL, 
	cantTrabPub		INT 
)
GO
--SELECT * FROM Investigador

CREATE TABLE Trabajo 
(
	idTrab		INT NOT NULL, 
	nomTrab		VARCHAR(100) NOT NULL, 
	descripTrab VARCHAR(10) NOT NULL, 
	tipoTrab	VARCHAR(20) NOT NULL, 
	fechaInicio DATE NOT NULL, 
	linkTrab	VARCHAR(200),
    lugarPublic INT
)
GO
--SELECT * FROM Trabajo

CREATE TABLE Tags 
(
	idtag	INT, 
	palabra VARCHAR(50)
)
GO
--SELECT * FROM Tags

CREATE TABLE TTags
(
	idTrab	VARCHAR(10) NOT NULL, 
	idTag	INT NOT NULL
)
GO
--SELECT * FROM TTags	

CREATE TABLE TAutores 
(
	idTrab			VARCHAR(10) NOT NULL,
	idInvestigador	INT NOT NULL, 
	rolinvestig		VARCHAR(3)
)
GO
--SELECT * FROM TAutores
	
CREATE TABLE Referencias 
(
	idTrab				VARCHAR(10) NOT NULL,
	idTrabReferenciado	VARCHAR(10) NOT NULL
)
GO
--SELECT * FROM Referencias
	
CREATE TABLE Lugares 
(
	idLugar		INT PRIMARY KEY, 
	nombre		VARCHAR(100) NOT NULL, 
	nivelLugar	INT , 
	anio		INT NOT NULL, 
	mes			INT NOT NULL, 
	diaIni		INT, 
	diaFin		INT, 
	link		VARCHAR(200), 
	universidad VARCHAR(50) 
)
GO
--SELECT * FROM Lugares


	
--COMMIT TRANSACTION
--ROLLBACK TRANSACTION


--SELECT * FROM INFORMATION_SCHEMA.COLUMNS