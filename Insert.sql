USE BD2Obligatorio
GO

BEGIN TRANSACTION

-- UNIVERSIDAD DATOS VÁLIDOS --
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

--X-X-X-X- UNIVERSIDAD DATOS INVÁLIDOS --X-X-X-X-
INSERT INTO Universidad VALUES('Universidad Catolica','Uruguay','Salto','47325467');
GO
INSERT INTO Universidad VALUES('Uruguay','Salto','Universidad Florida');
GO
INSERT INTO Universidad VALUES('Uruguay','','UDELAR','20109201');
GO
INSERT INTO Universidad VALUES('','Colonia','Universidad Catolica','24872717');
GO

-- Lugares DATOS VÁLIDOS --
INSERT INTO Lugares VALUES(5,'Pasillos',2,2017,09,27,29,NULL,'ORT','Revistas',NULL,NULL);
GO
INSERT INTO Lugares VALUES(2,'Salón Principal',3,2017,10,NULL,NULL,'www.universidad.edu.uy','UDELAR','Congresos','20171018','20171018');
GO
INSERT INTO Lugares VALUES(3,'Salón de Eventos Nº2',2,2017,4,NULL,NULL,'www.universidad.edu.uy','UDELAR','Congresos','20170401','20170401');
GO
INSERT INTO Lugares VALUES(4,'Bibloteca Principal',1,2015,12,'20151227','20160103',NULL,'ORT','Libros',NULL,NULL);
GO
--SELECT * FROM Lugares

--X-X-X-X- Lugares DATOS INVÁLIDOS -X-X-X-X--
INSERT INTO Lugares VALUES('Pasillos',2,2017,09,27,29,'','ORT','Revistas','','');
GO
INSERT INTO Lugares VALUES(1,'Salón Principal',2,2016,06,02,29,'','Unversidad de Solymar','Congresos','','');
GO

-- INVESTIGADOR DATOS VÁLIDOS --
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

--X-X-X-X- INVESTIGADOR DATOS INVÁLIDOS --X-X-X-X-
INSERT INTO Investigador VALUES('UDELAR','Jorge Kach','colorado@gmail.com','26018752','Investigador','EDoctor',1);
GO
INSERT INTO Investigador VALUES('Horacio Colo','colorado@gmail.com','26079494','Abogado','EDoctor',2,'ORT');
GO
INSERT INTO Investigador VALUES('Pablo Sosa','PabloSosa@gmail.com','095663207','Contador','EMaestria',0,'Universidad Catolica');
GO


SET IDENTITY_INSERT Trabajo ON
-- TRABAJO DATOS VÁLIDOS --
INSERT INTO Trabajo VALUES('Reparación de células dañadas por quimioterapia','articulo','20170927','http://www.csic.es',2,'Se descubrió que las células sanas dañadas por la quimioterapia pueden recuperarse mediante la proteína ZATT que restablece las roturas en el ADN provocadas por el tratamiento contra el cáncer.','A');
GO
INSERT INTO Trabajo VALUES('Reducir la ingesta de azúcares en niños es clave para evitar las enfermedades cardiovasculares','articulo','20170322','http://www.universia.es/universidades/universidad-zaragoza/in/10021',1,'Investigación en 400 niños de 9 países europeos para conocer sus hábitos alimenticios. Concluye que un 39% de los niños tienen más chances de presentar un estado inflamatorio elevado.','A');
GO
INSERT INTO Trabajo VALUES('Baterías fabricadas a partir de hongos portobello','otro','20170305',NULL,2,'O74M1','Un nuevo tipo de batería de litio e iones a partir de hongos portobella, materia prima barata, no afecta negativamente al medio ambiente y fácil de producir.','O');
GO
INSERT INTO Trabajo VALUES('Mirar demasiadas horas de televisión puede afectar el rendimiento cognitivo','poster','20151217','https://www.harvard.edu/',3,'P911AH3','Jóvenes que pasan más de tres horas frente al televisor en la etapa adulta podrían llegar a tener problemas de rendimiento cognitivo. Se agravaría todavía más si se combina con la falta de actividad física.','P');
GO
--SELECT * FROM Trabajo
---drop table trabajo




--X-X-X-X- TRABAJO DATOS INVÁLIDOS --X-X-X-X-
INSERT INTO Trabajo VALUES('Reparación de células dañadas por quimioterapia','articulo','27/09/2017','http://www.csic.es',2,'A1234','Se descubrió que las células sanas dañadas por la quimioterapia pueden recuperarse mediante la proteína ZATT que restablece las roturas en el ADN provocadas por el tratamiento contra el cáncer.');
GO

-- Tags DATOS VÁLIDOS --
INSERT INTO Tags VALUES('Ingesta niños azúcar enfermedad cardiovascular');
GO
INSERT INTO Tags VALUES('Batería hongos portobello medio ambiente');
GO
INSERT INTO Tags VALUES('Células dañadas quimioterapia cáncer proteína ZATT');
GO
--SELECT * FROM Tags

--X-X-X-X- Tags DATOS INVÁLIDOS --X-X-X-X-
INSERT INTO Tags VALUES('Ingesta niños azúcar enfermedad cardiovascular',3);
GO
INSERT INTO Tags VALUES(4);
GO

-- TTags DATOS VÁLIDOS --
INSERT INTO TTags VALUES(5,'O74M1');
GO
INSERT INTO TTags VALUES(3,'A979');
GO
INSERT INTO TTags VALUES(1,'A1234');
GO

--X-X-X-X- TTags DATOS INVÁLIDOS --X-X-X-X-
INSERT INTO TTags VALUES(2,'O74M1');
GO
INSERT INTO TTags VALUES(2,'O74');
GO
INSERT INTO TTags VALUES('B825FS4');
GO

-- TAutores DATOS VÁLIDOS --
INSERT INTO TAutores VALUES(3,'autor-director','A1234');
GO
INSERT INTO TAutores VALUES(3,'autor-director','O74M1');
GO
INSERT INTO TAutores VALUES(1,'autor-sec','A1234');
GO
INSERT INTO TAutores VALUES(2,'autor-ppal','A979');
GO

--X-X-X-X- TAutores DATOS INVÁLIDOS -X-X-X-X-
INSERT INTO TAutores VALUES('autor-director','A1234');
GO
INSERT INTO TAutores VALUES(1,'autor-ppal','Akl123L79');
GO
INSERT INTO TAutores VALUES(3,'','A979');
GO

-- Referencias DATOS VÁLIDOS --
INSERT INTO Referencias VALUES('A979','O74M1');
GO
INSERT INTO Referencias VALUES('A979','A1234');
GO
INSERT INTO Referencias VALUES('P911AH3','A1234');
GO

--X-X-X-X- Referencias DATOS INVÁLIDOS -X-X-X-X-
INSERT INTO Referencias VALUES('A979','A979');
GO
INSERT INTO Referencias VALUES('A1234','');
GO
INSERT INTO Referencias VALUES('','O74M1');
GO

--COMMIT TRANSACTION
--ROLLBACK TRANSACTION