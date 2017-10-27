USE BD2Obligatorio
GO

BEGIN TRANSACTION

-- UNIVERSIDAD DATOS V�LIDOS --
INSERT INTO Universidad VALUES('Uruguay','Montevideo','ORT','29021505');
GO
INSERT INTO Universidad VALUES('Uruguay','Montevideo','Universidad de Montevideo','27074461');
GO
INSERT INTO Universidad VALUES('Uruguay','Montevideo','UDELAR','24009201');
GO
INSERT INTO Universidad VALUES('Uruguay','Montevideo','Universidad Catolica','24872717');
GO
INSERT INTO Universidad VALUES('Uruguay','Canelones','Universidad de Canelones','26820989');
GO
INSERT INTO Universidad VALUES('Uruguay','Colonia','Universidad de la Empresa','45221400');
GO
--SELECT * FROM Universidad

--X-X-X-X- UNIVERSIDAD DATOS INV�LIDOS --X-X-X-X-
INSERT INTO Universidad VALUES('Universidad Catolica','Uruguay','Salto','47325467');
GO
INSERT INTO Universidad VALUES('Uruguay','Salto','Universidad Florida');
GO
INSERT INTO Universidad VALUES('Uruguay','','UDELAR','20109201');
GO
INSERT INTO Universidad VALUES('','Colonia','Universidad Catolica','24872717');
GO

-- Lugares DATOS V�LIDOS --
INSERT INTO Lugares VALUES(5,'Pasillos',2,2017,09,27,29,NULL,'ORT','Revistas',NULL,NULL);
GO
INSERT INTO Lugares VALUES(2,'Sal�n Principal',3,2017,10,NULL,NULL,'www.universidad.edu.uy','UDELAR','Congresos','20171018','20171018');
GO
INSERT INTO Lugares VALUES(3,'Sal�n de Eventos N�2',2,2017,4,NULL,NULL,'www.universidad.edu.uy','UDELAR','Congresos','20170401','20170401');
GO
INSERT INTO Lugares VALUES(4,'Bibloteca Principal',1,2015,12,'20151227','20160103',NULL,'ORT','Libros',NULL,NULL);
GO
--SELECT * FROM Lugares

--X-X-X-X- Lugares DATOS INV�LIDOS -X-X-X-X--
INSERT INTO Lugares VALUES('Pasillos',2,2017,09,27,29,'','ORT','Revistas','','');
GO
INSERT INTO Lugares VALUES(1,'Sal�n Principal',2,2016,06,02,29,'','Unversidad de Solymar','Congresos','','');
GO

-- INVESTIGADOR DATOS V�LIDOS --
INSERT INTO Investigador VALUES('Rodrigo Rodriguez','rr@gmail.com','099660508','Investigador','EGrado',2,'UDELAR');
GO
INSERT INTO Investigador VALUES('Marcelo Sosa','sosaM@gmail.com','093664501','Investigador','EGrado',0,'Universidad de Montevideo');
GO
INSERT INTO Investigador VALUES('Juan Perez','jp@gmail.com','098743213','Contador','EMaestria',5,'ORT');
GO
INSERT INTO Investigador VALUES('Gonzalo Gonzalez','gongonza@gmail.com','091563487','Investigador','EDoctor',1,'ORT');
GO
INSERT INTO Investigador VALUES('Pablo Sosa','PabloSosa@gmail.com','095663207','Contador','EMaestria',0,'Universidad Catolica');
GO
INSERT INTO Investigador VALUES('Juan Colo','colorado@gmail.com','094755203','Investigador','EDoctor',1,'ORT');
GO
INSERT INTO Investigador VALUES('Luis Gonzalez','LuisG@gmail.com','091000123','Investigador','EGrado',2,'Universidad de la Empresa');
GO
--SELECT * FROM Investigador

--X-X-X-X- INVESTIGADOR DATOS INV�LIDOS --X-X-X-X-
INSERT INTO Investigador VALUES('UDELAR','Jorge Kach','colorado@gmail.com','26018752','Investigador','EDoctor',1);
GO
INSERT INTO Investigador VALUES('Horacio Colo','colorado@gmail.com','26079494','Abogado','EDoctor',2,'ORT');
GO
INSERT INTO Investigador VALUES('Pablo Sosa','PabloSosa@gmail.com','095663207','Contador','EMaestria',0,'Universidad Catolica');
GO


SET IDENTITY_INSERT Trabajo ON
-- TRABAJO DATOS V�LIDOS --
INSERT INTO Trabajo VALUES('Reparaci�n de c�lulas da�adas por quimioterapia','articulo','20170927','http://www.csic.es',2,'Se descubri� que las c�lulas sanas da�adas por la quimioterapia pueden recuperarse mediante la prote�na ZATT que restablece las roturas en el ADN provocadas por el tratamiento contra el c�ncer.','A');
GO
INSERT INTO Trabajo VALUES('Reducir la ingesta de az�cares en ni�os es clave para evitar las enfermedades cardiovasculares','articulo','20170322','http://www.universia.es/universidades/universidad-zaragoza/in/10021',1,'Investigaci�n en 400 ni�os de 9 pa�ses europeos para conocer sus h�bitos alimenticios. Concluye que un 39% de los ni�os tienen m�s chances de presentar un estado inflamatorio elevado.','A');
GO
INSERT INTO Trabajo VALUES('Bater�as fabricadas a partir de hongos portobello','otro','20170305',NULL,2,'O74M1','Un nuevo tipo de bater�a de litio e iones a partir de hongos portobella, materia prima barata, no afecta negativamente al medio ambiente y f�cil de producir.','O');
GO
INSERT INTO Trabajo VALUES('Mirar demasiadas horas de televisi�n puede afectar el rendimiento cognitivo','poster','20151217','https://www.harvard.edu/',3,'P911AH3','J�venes que pasan m�s de tres horas frente al televisor en la etapa adulta podr�an llegar a tener problemas de rendimiento cognitivo. Se agravar�a todav�a m�s si se combina con la falta de actividad f�sica.','P');
GO
--SELECT * FROM Trabajo
---drop table trabajo




--X-X-X-X- TRABAJO DATOS INV�LIDOS --X-X-X-X-
INSERT INTO Trabajo VALUES('Reparaci�n de c�lulas da�adas por quimioterapia','articulo','27/09/2017','http://www.csic.es',2,'A1234','Se descubri� que las c�lulas sanas da�adas por la quimioterapia pueden recuperarse mediante la prote�na ZATT que restablece las roturas en el ADN provocadas por el tratamiento contra el c�ncer.');
GO

-- Tags DATOS V�LIDOS --
INSERT INTO Tags VALUES('Ingesta ni�os az�car enfermedad cardiovascular');
GO
INSERT INTO Tags VALUES('Bater�a hongos portobello medio ambiente');
GO
INSERT INTO Tags VALUES('C�lulas da�adas quimioterapia c�ncer prote�na ZATT');
GO
--SELECT * FROM Tags

--X-X-X-X- Tags DATOS INV�LIDOS --X-X-X-X-
INSERT INTO Tags VALUES('Ingesta ni�os az�car enfermedad cardiovascular',3);
GO
INSERT INTO Tags VALUES(4);
GO

-- TTags DATOS V�LIDOS --
INSERT INTO TTags VALUES(5,'O74M1');
GO
INSERT INTO TTags VALUES(3,'A979');
GO
INSERT INTO TTags VALUES(1,'A1234');
GO

--X-X-X-X- TTags DATOS INV�LIDOS --X-X-X-X-
INSERT INTO TTags VALUES(2,'O74M1');
GO
INSERT INTO TTags VALUES(2,'O74');
GO
INSERT INTO TTags VALUES('B825FS4');
GO

-- TAutores DATOS V�LIDOS --
INSERT INTO TAutores VALUES(3,'autor-director','A1234');
GO
INSERT INTO TAutores VALUES(3,'autor-director','O74M1');
GO
INSERT INTO TAutores VALUES(1,'autor-sec','A1234');
GO
INSERT INTO TAutores VALUES(2,'autor-ppal','A979');
GO

--X-X-X-X- TAutores DATOS INV�LIDOS -X-X-X-X-
INSERT INTO TAutores VALUES('autor-director','A1234');
GO
INSERT INTO TAutores VALUES(1,'autor-ppal','Akl123L79');
GO
INSERT INTO TAutores VALUES(3,'','A979');
GO

-- Referencias DATOS V�LIDOS --
INSERT INTO Referencias VALUES('A979','O74M1');
GO
INSERT INTO Referencias VALUES('A979','A1234');
GO
INSERT INTO Referencias VALUES('P911AH3','A1234');
GO

--X-X-X-X- Referencias DATOS INV�LIDOS -X-X-X-X-
INSERT INTO Referencias VALUES('A979','A979');
GO
INSERT INTO Referencias VALUES('A1234','');
GO
INSERT INTO Referencias VALUES('','O74M1');
GO

--COMMIT TRANSACTION
--ROLLBACK TRANSACTION