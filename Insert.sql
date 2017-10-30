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
--INSERT INTO Universidad VALUES('Montevideo','Universidad de la Empresa','47325467');
--GO
--INSERT INTO Universidad VALUES(NULL,'Montevideo','Universidad de la Empresa','47325467');
--GO
--INSERT INTO Universidad VALUES('Uruguay',NULL,'Universidad Florida','25352535');
--GO
--INSERT INTO Universidad VALUES('Uruguay','Colonia',NULL,'24872717');
--GO
--INSERT INTO Universidad VALUES('Uruguay','Colonia','ORT',NULL);
--GO

-- Lugares DATOS V�LIDOS --
INSERT INTO Lugares VALUES(1,'Pasillos',2,2017,9,27,29,NULL,'ORT','Revistas',NULL,NULL);
GO
INSERT INTO Lugares VALUES(2,'Sal�n Principal',3,2017,10,NULL,NULL,'www.eduk.edu.uy','UDELAR','Congresos','18','19');
GO
INSERT INTO Lugares VALUES(3,'Sal�n de Eventos N�2',2,2017,4,NULL,NULL,'www.teoriadelaimagen.com','UDELAR','Congresos','5','16');
GO
INSERT INTO Lugares VALUES(4,'Bibloteca Principal',1,2015,12,'14','16',NULL,'ORT','Libros',NULL,NULL);
GO
INSERT INTO Lugares VALUES(5,'Sal�n de Eventos N�5',3,2016,5,'1','5',NULL,'UDELAR','Libros',NULL,NULL);
GO
INSERT INTO Lugares VALUES(6,'Sala Com�n N�2',4,2017,12,'13','14','www.infocongress.com.mx','Universidad de la Empresa','Revistas',NULL,NULL);
GO
INSERT INTO Lugares VALUES(7,'Sala Com�n N�4',1,2017,1,'22','29',NULL,'Universidad de la Empresa','Revistas',NULL,NULL);
GO
INSERT INTO Lugares VALUES(8,'Bibloteca Anexo N�1',1,2016,4,NULL,NULL,'www.unicon.edu.uy','Universidad de Canelones','Congresos','15','16');
GO
INSERT INTO Lugares VALUES(9,'Sal�n Secundario',4,2017,3,NULL,NULL,'www.tier.com','ORT','Congresos','1','6');
GO
INSERT INTO Lugares VALUES(10,'Sal�n Comunitario',4,2012,8,NULL,NULL,'www.analytics.edu.uy','Universidad de la Empresa','Congresos','22','23');
GO
INSERT INTO Lugares VALUES(11,'Sheraton',4,2017,5,NULL,NULL,'www.hopper.com','Universidad de la Empresa','Congresos','4','5');
GO
INSERT INTO Lugares VALUES(12,'Centro Comunitario N�1',3,2017,6,'2','9',NULL,'ORT','Revistas',NULL,NULL);
GO
INSERT INTO Lugares VALUES(13,'Bibloteca Segundo Piso',2,2017,9,'1','5',NULL,'Universidad de Canelones','Revistas',NULL,NULL);
GO
INSERT INTO Lugares VALUES(14,'Centro de reuniones',1,2017,8,'4','6','www.ucongress.edu.uy','Universidad Catolica','Revistas',NULL,NULL);
GO
INSERT INTO Lugares VALUES(15,'Sal�n Comunitario N�2',3,2017,1,NULL,NULL,'www.econ.edu.ar','Universidad de Montevideo','Congresos','6','9');
GO
INSERT INTO Lugares VALUES(16,'Hall',1,2015,8,NULL,NULL,NULL,'Universidad de Canelones','Congresos','14','15');
GO
INSERT INTO Lugares VALUES(17,'Centro Comunitario N�3',4,2017,9,'1','3',NULL,'ORT','Revistas',NULL,NULL);
GO
INSERT INTO Lugares VALUES(18,'Sala de Asambleas',1,2017,2,'17','20','www.unicon.edu.uy','Universidad Catolica','Revistas',NULL,NULL);
GO
INSERT INTO Lugares VALUES(19,'Sala General',3,2014,3,'3','6','www.bloc.com.mx','Universidad de Montevideo','Libros',NULL,NULL);
GO
INSERT INTO Lugares VALUES(20,'Sal�n Tercer Nivel',1,2017,1,'1','2','www.congresosuruguay.com.uy','ORT','Revistas',NULL,NULL);
GO
--SELECT * FROM Lugares

--X-X-X-X- Lugares DATOS INV�LIDOS -X-X-X-X--
--INSERT INTO Lugares VALUES(9,'Pasillos',4,2017,3,6,29,NULL,'UDELAR','Revistas',NULL,NULL);
--GO
--INSERT INTO Lugares VALUES(10,'Sal�n de Eventos N�4',7,2013,6,NULL,NULL,'www.universidad.edu.uy','Unversidad de Solymar','Congresos',10,12);
--GO
--INSERT INTO Lugares VALUES(11,NULL,1,2015,2,NULL,NULL,'www.universidad.edu.uy','Universidad de la Empresa','Congresos',1,10);
--GO
--INSERT INTO Lugares VALUES(12,'Sal�n Alternativo',4,NULL,2,NULL,NULL,NULL,'ORT','Congresos',22,25);
--GO
--INSERT INTO Lugares VALUES(13,'Sal�n de Eventos N�3',1,2017,NULL,10,15,NULL,'ORT','Libros',NULL,NULL);
--GO
--INSERT INTO Lugares VALUES(14,'Bibloteca Anexo N�2',3,2016,12,4,11,'www.universidad.edu.uy','Universidad de la Empresa','Peri�dicos',NULL,NULL);
--GO
--INSERT INTO Lugares VALUES(15,'Sala Com�n N�3',4,2016,3,1,15,'www.universidad.edu.uy','Universidad Florida','Congresos',NULL,NULL);
--GO
--INSERT INTO Lugares VALUES(16,'Sala Com�n N�1',1,2014,6,20,NULL,NULL,NULL,'Libros',NULL,22);
--GO

-- INVESTIGADOR DATOS V�LIDOS --
INSERT INTO Investigador VALUES('Rodrigo Rodriguez','rr@gmail.com','099660508','Ingenier�a','EGrado',4,'UDELAR');
GO
INSERT INTO Investigador VALUES('Marcelo Sosa','sosaM@gmail.com','093664501','Ingenier�a','EGrado',0,'Universidad de Montevideo');
GO
INSERT INTO Investigador VALUES('Juan Perez','jp@gmail.com','098743213','Ingenier�a','EMaestria',6,'ORT');
GO
INSERT INTO Investigador VALUES('Gonzalo Gonzalez','gongonza@hotmail.com','091563487','Medicina','EDoctor',9,'ORT');
GO
INSERT INTO Investigador VALUES('Pablo Sosa','PabloSosa@gmail.com','095663207','Medicina','EMaestria',3,'Universidad Catolica');
GO
INSERT INTO Investigador VALUES('Juan Colo','colorado@gmail.com','094755203','Medicina','EDoctor',6,'ORT');
GO
INSERT INTO Investigador VALUES('Luis Gonzalez','LuisG@gmail.com','091000123','Ingenier�a','EGrado',6,'Universidad de la Empresa');
GO
INSERT INTO Investigador VALUES('Patricio Moreira','pmor34@hotmail.com','094755203','Ingenier�a','Doctor',4,'ORT');
GO
INSERT INTO Investigador VALUES('Alberto Soto','albertsot32@gmail.com','099697589','Medicina','Doctor',6,'Universidad Catolica');
GO
INSERT INTO Investigador VALUES('Joaquin Lasarte','jlas3@gmail.com','095787520','Ingenier�a','EGrado',4,'UDELAR');
GO
INSERT INTO Investigador VALUES('Pedro Torreira','ptorreira@gmail.com','099605879','Medicina','EDoctor',4,'ORT');
GO
INSERT INTO Investigador VALUES('Manuel Maldonado','mm3252@gmail.com','095289647','Medicina','EGrado',3,'UDELAR');
GO
INSERT INTO Investigador VALUES('Matias Beri','mberi3@hotmail.com','099305122','Medicina','Doctor',4,'Universidad Catolica');
GO
INSERT INTO Investigador VALUES('Martin Rivero','mriv342@gmail.com','098945525','Medicina','EMaestria',5,'ORT');
GO
INSERT INTO Investigador VALUES('Leonardo Sereno','lsereno17@gmail.com','099355930','Medicina','EMaestria',4,'Universidad de la Empresa');
GO
--SELECT * FROM Investigador

--X-X-X-X- INVESTIGADOR DATOS INV�LIDOS --X-X-X-X-
--INSERT INTO Investigador VALUES(NULL,'joaquinsbo@gmail.com','095474887','Contador','EMaestria',1,'Universidad Catolica');
--GO
--INSERT INTO Investigador VALUES('Jorge Kach','kachrf@gmail.com','26018752','Investigador','EPasant�a',3,'ORT');
--GO
--INSERT INTO Investigador VALUES('Horacio Colo','colorado@gmail.com','26079494','Abogado','EDoctor',2,'ORT');
--GO


-- TRABAJO DATOS V�LIDOS --
INSERT INTO Trabajo VALUES('Reparaci�n de c�lulas da�adas por quimioterapia','articulo','20170927','http://www.csic.es',2,'Se descubri� que las c�lulas sanas da�adas por la quimioterapia pueden recuperarse mediante la prote�na ZATT que restablece las roturas en el ADN provocadas por el tratamiento contra el c�ncer.','A');
GO
INSERT INTO Trabajo VALUES('Reducir la ingesta de az�cares en ni�os es clave para evitar las enfermedades cardiovasculares','articulo','20170322','http://www.universia.es/universidades/universidad-zaragoza/in/10021',1,'Investigaci�n en 400 ni�os de 9 pa�ses europeos para conocer sus h�bitos alimenticios. Concluye que un 39% de los ni�os tienen m�s chances de presentar un estado inflamatorio elevado.','A');
GO
INSERT INTO Trabajo VALUES('Bater�as fabricadas a partir de hongos portobello','otro','20170305',NULL,2,'Un nuevo tipo de bater�a de litio e iones a partir de hongos portobella, materia prima barata, no afecta negativamente al medio ambiente y f�cil de producir.','O');
GO
INSERT INTO Trabajo VALUES('Mirar demasiadas horas de televisi�n puede afectar el rendimiento cognitivo','poster','20151217','https://www.harvard.edu',3,'J�venes que pasan m�s de tres horas frente al televisor en la etapa adulta podr�an llegar a tener problemas de rendimiento cognitivo.','P');
GO
INSERT INTO Trabajo VALUES('La globalizaci�n de las bases de datos','articulo','20151111','http://www.dbaspot.com',20,'Las bases de datos se ingeniaron gracias a la necesidad de las grandes empresas de almacenar ingentes cantidades de informaci�n de una forma r�pida, sencilla y fiable','A');
GO
INSERT INTO Trabajo VALUES('Bases de datos para el mundo empresarial','capitulo','20160802','http://www.revistabyte.es/comparativa-byte-ti',7,'Las bases de datos, a las que tambi�n es posible referirse como bancos de informaci�n, son muy utilizadas por compa��as de distintos tama�o, trabajadores aut�nomos e, incluso, hogares residenciales.','C');
GO
INSERT INTO Trabajo VALUES('Base Mundial de Datos sobre Marcas','capitulo','20140101',NULL,6,'Esta base de datos es un portal de acceso a m�s de 33.330.000 entradas de& 35 colecciones nacionales e internacionales.','C');
GO
INSERT INTO Trabajo VALUES('Sistemas Gestores de Bases de datos y Almacenamiento','otro','20171109','https://www.harvard.edu',10,'Durante d�cadas, las organizaciones se han esforzado por gestionar sus datos con eficacia. Sin embargo, para guardarlos utilizaban almacenes de datos muy fr�giles.','O');
GO
INSERT INTO Trabajo VALUES('Cirug�a ortogn�tica para corregir las deformidades faciales','poster','20121126','https://www.topdoctors.es',9,'Las deformidades faciales se dan cuando crecen de forma anormal los huesos de la cara: la mand�bula, el maxilar superior, los p�mulos, la nariz o el ment�n.','P');
GO
INSERT INTO Trabajo VALUES('�C�mo combatir y frenar el parkinson?','articulo','20170122','https://www.topdoctors.es',9,'La vida de un enfermo, de un paciente con enfermedad de parkinson, es una vida f�cil al principio y normal y complicada cuando la enfermedad progresa.','A');
GO
INSERT INTO Trabajo VALUES('Identifican nuevo mecanismo en el desarrollo de la esquizofrenia','poster','20170201','https://www.medicina21.com',13,'Cient�ficos del Trinity College de Dubl�n (Irlanda) han descubierto que las anomal�as en los vasos sangu�neos del cerebro podr�an tener un papel de importancia en el desarrollo de la esquizofrenia.','P');
GO
INSERT INTO Trabajo VALUES('Bases de datos NoSQL. Elige la opci�n que mejor se adapte a tus necesidades','capitulo','20110904','https://www.genbetadev.com',1,'Son las bases de datos NoSQL m�s vers�tiles. Se pueden utilizar en gran cantidad de proyectos, incluyendo muchos que tradicionalmente funcionar�an sobre bases de datos relacionales.','C');
GO
INSERT INTO Trabajo VALUES('Descubierto el primer f�rmaco que act�a como protector del ri��n','otro','20150103','https://www.medicina21.com',14,'El medicamento permite utilizar con seguridad otros f�rmacos que, sin la cilastatina, har�an da�o al ri��n. "Aumenta as� la seguridad del tratamiento para el c�ncer"','O');
GO
INSERT INTO Trabajo VALUES('Migraci�n de una base de datos de SQL Server a una Base de datos SQL en la nube','articulo','20171130','https://docs.microsoft.com',7,'En este art�culo se describen los dos principales m�todos para migrar una base de datos de SQL Server 2005 o posterior a Azure SQL Database.','A');
GO
INSERT INTO Trabajo VALUES('Consideraciones para el uso de cifrado en las bases de datos','poster','20161123','https://revista.seguridad.unam.mx',6,'El cifrado de datos es una alternativa muy usada para el cumplimiento del requisito de confidencialidad de la informaci�n en las bases de datos.','P');
GO
INSERT INTO Trabajo VALUES('Como crear un backup de la base de datos de PrestaShop','otro','20100515','https://www.hostinet.com',7,'Hoy en d�a disponer de varios backups de la base de datos de PrestaShop, ya sea en un pendrive, un disco duro port�til o cualquier otro dispositivo de almacenamiento �es muy importante!.','O');
GO
INSERT INTO Trabajo VALUES('Inteligencia artificial para ayudar a tomar la mejor decisi�n en el tratamiento de pacientes','articulo','20150508','http://noticiasdelaciencia.com',4,'La t�cnica est� basada en la aplicaci�n de servicios web sem�nticos que utilizan inteligencia artificial para que las m�quinas puedan localizar y acceder a los sistemas de ayuda.','A');
GO
INSERT INTO Trabajo VALUES('Bacterias depredadoras contra los pat�genos de la fibrosis qu�stica pulmonar','capitulo','20130131','http://noticiasdelaciencia.com',13,'Las nuevas herramientas de secuenciaci�n gen�tica (next-generation sequencing o NGS) est�n permitiendo constatar una enorme complejidad en el microbioma pulmonar.','C');
GO
INSERT INTO Trabajo VALUES('C�ncer de tiroides','otro','20170121','http://www.intramed.net',19,'El c�ncer de tiroides es el c�ncer endocrino m�s frecuente y su incidencia aument� considerablemente en todo el mundo en las �ltimas d�cadas.','O');
GO
INSERT INTO Trabajo VALUES('F�bricas de ADN','poster','20110904',NULL,18,'A medida que es m�s y m�s barato crear trozos grandes de material gen�tico desde el principio, los cient�ficos podr�n obtener creaciones biol�gicas cada vez m�s complejas.','P');
GO
--SELECT * FROM Trabajo


--X-X-X-X- TRABAJO DATOS INV�LIDOS --X-X-X-X-
--INSERT INTO Trabajo VALUES(NULL,'poster','20170927',NULL,3,'Se descubri� que las c�lulas sanas da�adas por la quimioterapia pueden recuperarse mediante la prote�na ZATT que restablece las roturas en el ADN provocadas por el tratamiento contra el c�ncer.','P');
--GO
--INSERT INTO Trabajo VALUES('Bater�as fabricadas a partir de hongos portobello',NULL,'20160815',NULL,2,'Un nuevo tipo de bater�a de litio e iones a partir de hongos portobella, materia prima barata, no afecta negativamente al medio ambiente y f�cil de producir.','O');
--GO
--INSERT INTO Trabajo VALUES('Reducir la ingesta de az�cares en ni�os es clave para evitar las enfermedades cardiovasculares','articulo','20150202','http://www.universia.es/universidades/universidad-zaragoza/in/10021',1,NULL,'A');
--GO
--INSERT INTO Trabajo VALUES('Mirar demasiadas horas de televisi�n puede afectar el rendimiento cognitivo','poster',NULL,NULL,4,'J�venes que pasan m�s de tres horas frente al televisor en la etapa adulta podr�an llegar a tener problemas de rendimiento cognitivo.','P');
--GO
--INSERT INTO Trabajo VALUES('Reparaci�n de c�lulas da�adas por quimioterapia','nota','20170107','http://www.csic.es',1,'Se descubri� que las c�lulas sanas da�adas por la quimioterapia pueden recuperarse mediante la prote�na ZATT que restablece las roturas en el ADN provocadas por el tratamiento contra el c�ncer.','A');
--GO
--INSERT INTO Trabajo VALUES('Bater�as fabricadas a partir de hongos portobello','otro','20170305',NULL,2,'Un nuevo tipo de bater�a de litio e iones a partir de hongos portobella, materia prima barata, no afecta negativamente al medio ambiente y f�cil de producir.',NULL);
--GO


-- Tags DATOS V�LIDOS --
INSERT INTO Tags VALUES('C�lulas');
GO
INSERT INTO Tags VALUES('Quimioterapia');
GO
INSERT INTO Tags VALUES('ZATT');
GO
INSERT INTO Tags VALUES('Ingesta');
GO
INSERT INTO Tags VALUES('Hongos');
GO
INSERT INTO Tags VALUES('Portobello');
GO
INSERT INTO Tags VALUES('Ambiente');
GO
INSERT INTO Tags VALUES('Televisi�n');
GO
INSERT INTO Tags VALUES('Rendimiento cognitivo');
GO
INSERT INTO Tags VALUES('Globalizaci�n');
GO
INSERT INTO Tags VALUES('Informaci�n');
GO
INSERT INTO Tags VALUES('Bases de datos');
GO
INSERT INTO Tags VALUES('Compa��as');
GO
INSERT INTO Tags VALUES('Empresarial');
GO
INSERT INTO Tags VALUES('Base mundial');
GO
INSERT INTO Tags VALUES('Portal de acceso');
GO
INSERT INTO Tags VALUES('Sistemas gestores');
GO
INSERT INTO Tags VALUES('Almacenes de datos');
GO
INSERT INTO Tags VALUES('Cirug�a ortogn�tica');
GO
INSERT INTO Tags VALUES('Deformidades faciales');
GO
INSERT INTO Tags VALUES('Parkinson');
GO
INSERT INTO Tags VALUES('Esquizofrenia');
GO
INSERT INTO Tags VALUES('NoSQL');
GO
INSERT INTO Tags VALUES('Ri��n');
GO
INSERT INTO Tags VALUES('Medicamento');
GO
INSERT INTO Tags VALUES('SQL Server');
GO
INSERT INTO Tags VALUES('Azure');
GO
INSERT INTO Tags VALUES('Cifrado');
GO
INSERT INTO Tags VALUES('PrestaShop');
GO
INSERT INTO Tags VALUES('Backup');
GO
INSERT INTO Tags VALUES('Inteligencia artificial');
GO
INSERT INTO Tags VALUES('fibrosis qu�stica pulmonar');
GO
INSERT INTO Tags VALUES('NGS');
GO
INSERT INTO Tags VALUES('Tiroides');
GO
INSERT INTO Tags VALUES('ADN');
GO
--SELECT * FROM Tags


-- TTags DATOS V�LIDOS --
INSERT INTO TTags (idTag,idTrab,letra) VALUES(1,1,'A');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(3,1,'A');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(5,1,'A');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(7,2,'A');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(9,3,'O');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(11,3,'O');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(13,3,'O');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(15,4,'P');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(17,4,'P');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(19,5,'A');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(21,5,'A');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(23,6,'C');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(23,7,'C');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(23,8,'O');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(23,12,'C');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(23,14,'A');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(23,15,'P');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(23,16,'O');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(25,6,'C');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(27,6,'C');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(29,7,'C');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(31,8,'O');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(33,8,'O');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(35,8,'O');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(37,9,'P');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(39,9,'P');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(41,10,'A');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(43,11,'P');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(45,12,'C');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(47,13,'O');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(49,13,'O');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(51,14,'A');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(53,14,'A');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(55,15,'P');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(57,16,'O');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(59,16,'O');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(61,17,'A');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(63,18,'C');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(65,18,'C');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(67,19,'O');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(69,20,'P');
GO
--SELECT * FROM TTags

--X-X-X-X- TTags DATOS INV�LIDOS --X-X-X-X-
--INSERT INTO TTags VALUES(NULL,3,'O');
--GO
--INSERT INTO TTags VALUES(7,NULL,'P');
--GO
--INSERT INTO TTags VALUES(9,2,NULL);
--GO

-- TAutores DATOS V�LIDOS --
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(1,'autor-director',5,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(1,'autor-sec',7,'C');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(1,'autor-director',16,'O');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(1,'autor-ppal',8,'O');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(3,'autor-ppal',5,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(3,'autor-director',8,'O');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(3,'autor-sec',12,'C');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(3,'autor-sec',14,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(3,'autor-ppal',16,'O');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(3,'autor-sec',15,'P');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(4,'autor-ppal',20,'P');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(4,'autor-director',19,'O');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(4,'autor-ppal',18,'C');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(4,'autor-ppal',17,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(4,'autor-ppal',3,'O');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(4,'autor-ppal',5,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(4,'autor-sec',2,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(4,'autor-sec',11,'P');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(4,'autor-sec',1,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(5,'autor-ppal',2,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(5,'autor-sec',3,'O');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(5,'autor-sec',4,'P');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(6,'autor-ppal',13,'O');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(6,'autor-director',1,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(6,'autor-director',3,'O');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(6,'autor-ppal',4,'P');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(6,'autor-ppal',9,'P');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(6,'autor-ppal',2,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(7,'autor-sec',5,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(7,'autor-director',6,'C');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(7,'autor-ppal',7,'C');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(7,'autor-sec',8,'O');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(7,'autor-ppal',12,'C');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(7,'autor-director',14,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(8,'autor-ppal',14,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(8,'autor-ppal',15,'P');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(8,'autor-sec',16,'O');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(8,'autor-director',6,'C');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(9,'autor-ppal',1,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(9,'autor-director',2,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(9,'autor-sec',3,'O');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(9,'autor-director',4,'P');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(9,'autor-sec',18,'C');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(9,'autor-sec',19,'O');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(10,'autor-director',7,'C');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(10,'autor-director',12,'C');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(10,'autor-director',15,'P');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(10,'autor-sec',6,'C');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(11,'autor-director',9,'P');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(11,'autor-sec',10,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(11,'autor-ppal',11,'P');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(11,'autor-ppal',18,'C');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(12,'autor-sec',9,'P');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(12,'autor-ppal',10,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(12,'autor-director',11,'P');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(13,'autor-director',10,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(13,'autor-sec',11,'P');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(13,'autor-director',18,'C');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(13,'autor-ppal',19,'O');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(14,'autor-sec',13,'O');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(14,'autor-director',17,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(14,'autor-sec',18,'C');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(14,'autor-sec',19,'O');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(14,'autor-director',20,'P');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(15,'autor-director',13,'O');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(15,'autor-sec',17,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(15,'autor-sec',19,'O');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(15,'autor-sec',20,'P');
GO
--SELECT * FROM TAutores

--X-X-X-X- TAutores DATOS INV�LIDOS -X-X-X-X-
--INSERT INTO TAutores VALUES(NULL,'autor-director',4,'P');
--GO
--INSERT INTO TAutores VALUES(5,'autor-ppal',NULL,'O');
--GO
--INSERT INTO TAutores VALUES(6,'autor-sec',1,NULL);
--GO
--INSERT INTO TAutores VALUES(7,'autor-ter',1,'A');
--GO

-- Referencias DATOS V�LIDOS --
INSERT INTO Referencias (idTrab,letra,idTrabReferenciado,letraReferenciado) VALUES(5,'A',16,'O');
GO
INSERT INTO Referencias (idTrab,letra,idTrabReferenciado,letraReferenciado) VALUES(6,'C',8,'O');
GO
INSERT INTO Referencias (idTrab,letra,idTrabReferenciado,letraReferenciado) VALUES(7,'C',15,'P');
GO
INSERT INTO Referencias (idTrab,letra,idTrabReferenciado,letraReferenciado) VALUES(8,'O',5,'A');
GO
INSERT INTO Referencias (idTrab,letra,idTrabReferenciado,letraReferenciado) VALUES(12,'C',14,'A');
GO
INSERT INTO Referencias (idTrab,letra,idTrabReferenciado,letraReferenciado) VALUES(16,'O',7,'C');
GO
INSERT INTO Referencias (idTrab,letra,idTrabReferenciado,letraReferenciado) VALUES(1,'A',13,'O');
GO
INSERT INTO Referencias (idTrab,letra,idTrabReferenciado,letraReferenciado) VALUES(2,'A',9,'P');
GO
INSERT INTO Referencias (idTrab,letra,idTrabReferenciado,letraReferenciado) VALUES(3,'O',20,'P');
GO
INSERT INTO Referencias (idTrab,letra,idTrabReferenciado,letraReferenciado) VALUES(4,'P',17,'A');
GO
INSERT INTO Referencias (idTrab,letra,idTrabReferenciado,letraReferenciado) VALUES(11,'P',18,'C');
GO
INSERT INTO Referencias (idTrab,letra,idTrabReferenciado,letraReferenciado) VALUES(19,'O',3,'O');
GO
--SELECT * FROM Referencias


--X-X-X-X- Referencias DATOS INV�LIDOS -X-X-X-X-
--INSERT INTO Referencias VALUES(1,'A',1,'A');
--GO
--INSERT INTO Referencias VALUES(NULL,'O',2,'A');
--GO
--INSERT INTO Referencias VALUES(2,NULL,4,'P');
--GO
--INSERT INTO Referencias VALUES(3,'O',NULL,'A');
--GO
--INSERT INTO Referencias VALUES(1,'A',4,NULL);
--GO


--COMMIT TRANSACTION
--ROLLBACK TRANSACTION