/* Creacion de la BD */
CREATE DATABASE obligatorioOriginal
GO
USE obligatorioOriginal
GO
/* Creacion de tablas */

BEGIN TRANSACTION
GO

create table Universidad (
	nombre varchar(100), 
	pais varchar(50) not null, 
	ciudad varchar(50) not null 
	)
GO
--SELECT * FROM Universidad

create table Investigador (
	idInvestigador int, 
	nombre varchar(100) not null, 
	mail varchar(200), 
	telefono varchar(20),
	carrera varchar(50), 
	nivelInvestig varchar(20) not null, 
	cantTrabPub int )
GO
--SELECT * FROM Investigador

create Table Trabajo (
		idTrab int not null, 
		nomTrab varchar(100) not null, 
		descripTrab varchar(10) not null, 
		tipoTrab varchar(20) not null, 
		fechaInicio date not null, 
		linkTrab varchar(200),
        lugarPublic int)
GO
--SELECT * FROM Trabajo

create table Tags (
	idtag int, 
	palabra varchar(50))
GO
--SELECT * FROM Tags

create Table TTags (
	idTrab Varchar(10) not null, 
	idTag int not null
	)
GO
--SELECT * FROM TTags	

create Table TAutores (
	idTrab varchar(10) not null,
	idInvestigador int not null, 
	rolinvestig varchar(3))
GO
--SELECT * FROM TAutores
	
create Table Referencias (
	idTrab varchar(10) not null,
	idTrabReferenciado varchar(10) not null
	)
GO
--SELECT * FROM Referencias
	
create Table Lugares (
	idLugar int primary key, 
	nombre varchar(100) not null, 
	nivelLugar int , 
	anio int not null, 
	mes int not null, 
	diaIni int, 
	diaFin int, 
	link varchar(200), 
	universidad varchar(50) )
GO
--SELECT * FROM Lugares


	
--COMMIT TRANSACTION
--ROLLBACK TRANSACTION


SELECT * FROM INFORMATION_SCHEMA.COLUMNS