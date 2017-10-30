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

-- Lugares DATOS VÁLIDOS --
INSERT INTO Lugares VALUES(1,'Pasillos',2,2017,9,27,29,NULL,'ORT','Revistas',NULL,NULL);
GO
INSERT INTO Lugares VALUES(2,'Salón Principal',3,2017,10,NULL,NULL,'www.eduk.edu.uy','UDELAR','Congresos','18','19');
GO
INSERT INTO Lugares VALUES(3,'Salón de Eventos Nº2',2,2017,4,NULL,NULL,'www.teoriadelaimagen.com','UDELAR','Congresos','5','16');
GO
INSERT INTO Lugares VALUES(4,'Bibloteca Principal',1,2015,12,'14','16',NULL,'ORT','Libros',NULL,NULL);
GO
INSERT INTO Lugares VALUES(5,'Salón de Eventos Nº5',3,2016,5,'1','5',NULL,'UDELAR','Libros',NULL,NULL);
GO
INSERT INTO Lugares VALUES(6,'Sala Común N°2',4,2017,12,'13','14','www.infocongress.com.mx','Universidad de la Empresa','Revistas',NULL,NULL);
GO
INSERT INTO Lugares VALUES(7,'Sala Común N°4',1,2017,1,'22','29',NULL,'Universidad de la Empresa','Revistas',NULL,NULL);
GO
INSERT INTO Lugares VALUES(8,'Bibloteca Anexo N°1',1,2016,4,NULL,NULL,'www.unicon.edu.uy','Universidad de Canelones','Congresos','15','16');
GO
INSERT INTO Lugares VALUES(9,'Salón Secundario',4,2017,3,NULL,NULL,'www.tier.com','ORT','Congresos','1','6');
GO
INSERT INTO Lugares VALUES(10,'Salón Comunitario',4,2012,8,NULL,NULL,'www.analytics.edu.uy','Universidad de la Empresa','Congresos','22','23');
GO
INSERT INTO Lugares VALUES(11,'Sheraton',4,2017,5,NULL,NULL,'www.hopper.com','Universidad de la Empresa','Congresos','4','5');
GO
INSERT INTO Lugares VALUES(12,'Centro Comunitario N°1',3,2017,6,'2','9',NULL,'ORT','Revistas',NULL,NULL);
GO
INSERT INTO Lugares VALUES(13,'Bibloteca Segundo Piso',2,2017,9,'1','5',NULL,'Universidad de Canelones','Revistas',NULL,NULL);
GO
INSERT INTO Lugares VALUES(14,'Centro de reuniones',1,2017,8,'4','6','www.ucongress.edu.uy','Universidad Catolica','Revistas',NULL,NULL);
GO
INSERT INTO Lugares VALUES(15,'Salón Comunitario N°2',3,2017,1,NULL,NULL,'www.econ.edu.ar','Universidad de Montevideo','Congresos','6','9');
GO
INSERT INTO Lugares VALUES(16,'Hall',1,2015,8,NULL,NULL,NULL,'Universidad de Canelones','Congresos','14','15');
GO
INSERT INTO Lugares VALUES(17,'Centro Comunitario N°3',4,2017,9,'1','3',NULL,'ORT','Revistas',NULL,NULL);
GO
INSERT INTO Lugares VALUES(18,'Sala de Asambleas',1,2017,2,'17','20','www.unicon.edu.uy','Universidad Catolica','Revistas',NULL,NULL);
GO
INSERT INTO Lugares VALUES(19,'Sala General',3,2014,3,'3','6','www.bloc.com.mx','Universidad de Montevideo','Libros',NULL,NULL);
GO
INSERT INTO Lugares VALUES(20,'Salón Tercer Nivel',1,2017,1,'1','2','www.congresosuruguay.com.uy','ORT','Revistas',NULL,NULL);
GO
--SELECT * FROM Lugares

--X-X-X-X- Lugares DATOS INVÁLIDOS -X-X-X-X--
--INSERT INTO Lugares VALUES(9,'Pasillos',4,2017,3,6,29,NULL,'UDELAR','Revistas',NULL,NULL);
--GO
--INSERT INTO Lugares VALUES(10,'Salón de Eventos Nº4',7,2013,6,NULL,NULL,'www.universidad.edu.uy','Unversidad de Solymar','Congresos',10,12);
--GO
--INSERT INTO Lugares VALUES(11,NULL,1,2015,2,NULL,NULL,'www.universidad.edu.uy','Universidad de la Empresa','Congresos',1,10);
--GO
--INSERT INTO Lugares VALUES(12,'Salón Alternativo',4,NULL,2,NULL,NULL,NULL,'ORT','Congresos',22,25);
--GO
--INSERT INTO Lugares VALUES(13,'Salón de Eventos Nº3',1,2017,NULL,10,15,NULL,'ORT','Libros',NULL,NULL);
--GO
--INSERT INTO Lugares VALUES(14,'Bibloteca Anexo N°2',3,2016,12,4,11,'www.universidad.edu.uy','Universidad de la Empresa','Periódicos',NULL,NULL);
--GO
--INSERT INTO Lugares VALUES(15,'Sala Común N°3',4,2016,3,1,15,'www.universidad.edu.uy','Universidad Florida','Congresos',NULL,NULL);
--GO
--INSERT INTO Lugares VALUES(16,'Sala Común N°1',1,2014,6,20,NULL,NULL,NULL,'Libros',NULL,22);
--GO

-- INVESTIGADOR DATOS VÁLIDOS --
INSERT INTO Investigador VALUES('Rodrigo Rodriguez','rr@gmail.com','099660508','Ingeniería','EGrado',4,'UDELAR');
GO
INSERT INTO Investigador VALUES('Marcelo Sosa','sosaM@gmail.com','093664501','Ingeniería','EGrado',0,'Universidad de Montevideo');
GO
INSERT INTO Investigador VALUES('Juan Perez','jp@gmail.com','098743213','Ingeniería','EMaestria',6,'ORT');
GO
INSERT INTO Investigador VALUES('Gonzalo Gonzalez','gongonza@hotmail.com','091563487','Medicina','EDoctor',9,'ORT');
GO
INSERT INTO Investigador VALUES('Pablo Sosa','PabloSosa@gmail.com','095663207','Medicina','EMaestria',3,'Universidad Catolica');
GO
INSERT INTO Investigador VALUES('Juan Colo','colorado@gmail.com','094755203','Medicina','EDoctor',6,'ORT');
GO
INSERT INTO Investigador VALUES('Luis Gonzalez','LuisG@gmail.com','091000123','Ingeniería','EGrado',6,'Universidad de la Empresa');
GO
INSERT INTO Investigador VALUES('Patricio Moreira','pmor34@hotmail.com','094755203','Ingeniería','Doctor',4,'ORT');
GO
INSERT INTO Investigador VALUES('Alberto Soto','albertsot32@gmail.com','099697589','Medicina','Doctor',6,'Universidad Catolica');
GO
INSERT INTO Investigador VALUES('Joaquin Lasarte','jlas3@gmail.com','095787520','Ingeniería','EGrado',4,'UDELAR');
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

--X-X-X-X- INVESTIGADOR DATOS INVÁLIDOS --X-X-X-X-
--INSERT INTO Investigador VALUES(NULL,'joaquinsbo@gmail.com','095474887','Contador','EMaestria',1,'Universidad Catolica');
--GO
--INSERT INTO Investigador VALUES('Jorge Kach','kachrf@gmail.com','26018752','Investigador','EPasantía',3,'ORT');
--GO
--INSERT INTO Investigador VALUES('Horacio Colo','colorado@gmail.com','26079494','Abogado','EDoctor',2,'ORT');
--GO


-- TRABAJO DATOS VÁLIDOS --
INSERT INTO Trabajo VALUES('Reparación de células dañadas por quimioterapia','articulo','20170927','http://www.csic.es',2,'Se descubrió que las células sanas dañadas por la quimioterapia pueden recuperarse mediante la proteína ZATT que restablece las roturas en el ADN provocadas por el tratamiento contra el cáncer.','A');
GO
INSERT INTO Trabajo VALUES('Reducir la ingesta de azúcares en niños es clave para evitar las enfermedades cardiovasculares','articulo','20170322','http://www.universia.es/universidades/universidad-zaragoza/in/10021',1,'Investigación en 400 niños de 9 países europeos para conocer sus hábitos alimenticios. Concluye que un 39% de los niños tienen más chances de presentar un estado inflamatorio elevado.','A');
GO
INSERT INTO Trabajo VALUES('Baterías fabricadas a partir de hongos portobello','otro','20170305',NULL,2,'Un nuevo tipo de batería de litio e iones a partir de hongos portobella, materia prima barata, no afecta negativamente al medio ambiente y fácil de producir.','O');
GO
INSERT INTO Trabajo VALUES('Mirar demasiadas horas de televisión puede afectar el rendimiento cognitivo','poster','20151217','https://www.harvard.edu',3,'Jóvenes que pasan más de tres horas frente al televisor en la etapa adulta podrían llegar a tener problemas de rendimiento cognitivo.','P');
GO
INSERT INTO Trabajo VALUES('La globalización de las bases de datos','articulo','20151111','http://www.dbaspot.com',20,'Las bases de datos se ingeniaron gracias a la necesidad de las grandes empresas de almacenar ingentes cantidades de información de una forma rápida, sencilla y fiable','A');
GO
INSERT INTO Trabajo VALUES('Bases de datos para el mundo empresarial','capitulo','20160802','http://www.revistabyte.es/comparativa-byte-ti',7,'Las bases de datos, a las que también es posible referirse como bancos de información, son muy utilizadas por compañías de distintos tamaño, trabajadores autónomos e, incluso, hogares residenciales.','C');
GO
INSERT INTO Trabajo VALUES('Base Mundial de Datos sobre Marcas','capitulo','20140101',NULL,6,'Esta base de datos es un portal de acceso a más de 33.330.000 entradas de& 35 colecciones nacionales e internacionales.','C');
GO
INSERT INTO Trabajo VALUES('Sistemas Gestores de Bases de datos y Almacenamiento','otro','20171109','https://www.harvard.edu',10,'Durante décadas, las organizaciones se han esforzado por gestionar sus datos con eficacia. Sin embargo, para guardarlos utilizaban almacenes de datos muy frágiles.','O');
GO
INSERT INTO Trabajo VALUES('Cirugía ortognática para corregir las deformidades faciales','poster','20121126','https://www.topdoctors.es',9,'Las deformidades faciales se dan cuando crecen de forma anormal los huesos de la cara: la mandíbula, el maxilar superior, los pómulos, la nariz o el mentón.','P');
GO
INSERT INTO Trabajo VALUES('¿Cómo combatir y frenar el parkinson?','articulo','20170122','https://www.topdoctors.es',9,'La vida de un enfermo, de un paciente con enfermedad de parkinson, es una vida fácil al principio y normal y complicada cuando la enfermedad progresa.','A');
GO
INSERT INTO Trabajo VALUES('Identifican nuevo mecanismo en el desarrollo de la esquizofrenia','poster','20170201','https://www.medicina21.com',13,'Científicos del Trinity College de Dublín (Irlanda) han descubierto que las anomalías en los vasos sanguíneos del cerebro podrían tener un papel de importancia en el desarrollo de la esquizofrenia.','P');
GO
INSERT INTO Trabajo VALUES('Bases de datos NoSQL. Elige la opción que mejor se adapte a tus necesidades','capitulo','20110904','https://www.genbetadev.com',1,'Son las bases de datos NoSQL más versátiles. Se pueden utilizar en gran cantidad de proyectos, incluyendo muchos que tradicionalmente funcionarían sobre bases de datos relacionales.','C');
GO
INSERT INTO Trabajo VALUES('Descubierto el primer fármaco que actúa como protector del riñón','otro','20150103','https://www.medicina21.com',14,'El medicamento permite utilizar con seguridad otros fármacos que, sin la cilastatina, harían daño al riñón. "Aumenta así la seguridad del tratamiento para el cáncer"','O');
GO
INSERT INTO Trabajo VALUES('Migración de una base de datos de SQL Server a una Base de datos SQL en la nube','articulo','20171130','https://docs.microsoft.com',7,'En este artículo se describen los dos principales métodos para migrar una base de datos de SQL Server 2005 o posterior a Azure SQL Database.','A');
GO
INSERT INTO Trabajo VALUES('Consideraciones para el uso de cifrado en las bases de datos','poster','20161123','https://revista.seguridad.unam.mx',6,'El cifrado de datos es una alternativa muy usada para el cumplimiento del requisito de confidencialidad de la información en las bases de datos.','P');
GO
INSERT INTO Trabajo VALUES('Como crear un backup de la base de datos de PrestaShop','otro','20100515','https://www.hostinet.com',7,'Hoy en día disponer de varios backups de la base de datos de PrestaShop, ya sea en un pendrive, un disco duro portátil o cualquier otro dispositivo de almacenamiento ¡es muy importante!.','O');
GO
INSERT INTO Trabajo VALUES('Inteligencia artificial para ayudar a tomar la mejor decisión en el tratamiento de pacientes','articulo','20150508','http://noticiasdelaciencia.com',4,'La técnica está basada en la aplicación de servicios web semánticos que utilizan inteligencia artificial para que las máquinas puedan localizar y acceder a los sistemas de ayuda.','A');
GO
INSERT INTO Trabajo VALUES('Bacterias depredadoras contra los patógenos de la fibrosis quística pulmonar','capitulo','20130131','http://noticiasdelaciencia.com',13,'Las nuevas herramientas de secuenciación genética (next-generation sequencing o NGS) están permitiendo constatar una enorme complejidad en el microbioma pulmonar.','C');
GO
INSERT INTO Trabajo VALUES('Cáncer de tiroides','otro','20170121','http://www.intramed.net',19,'El cáncer de tiroides es el cáncer endocrino más frecuente y su incidencia aumentó considerablemente en todo el mundo en las últimas décadas.','O');
GO
INSERT INTO Trabajo VALUES('Fábricas de ADN','poster','20110904',NULL,18,'A medida que es más y más barato crear trozos grandes de material genético desde el principio, los científicos podrán obtener creaciones biológicas cada vez más complejas.','P');
GO
INSERT INTO Trabajo VALUES('Combustible de algas','poster','20030424','https://www.culturacolectiva.com',4,'Entre las ventajas a diferencia del maíz, las algas no necesitan un área extensa para crecer y pueden hacerlo en lugares inapropiados para la actividad agrícola, como los desiertos','P');
GO
INSERT INTO Trabajo VALUES('Agua en Marte','articulo','20170316','https://www.culturacolectiva.com',3,'La NASA confirmó el hallazgo de evidencia directa sobre la posible existencia de agua líquida en la superficie de Marte. Todo indica que lo más probable es que sea de la atmósfera.','A');
GO
INSERT INTO Trabajo VALUES('Ardi','articulo','20170224','https://www.exploracion.com',3,'Presentado como el antepasado más antiguo del ser humano. Fue catalogada como un Ardipithecus ramidus, una especie de homínido que vivió hace 4.4 millones en lo que hoy es conocido como Etiopía','A');
GO
INSERT INTO Trabajo VALUES('Drones','otro','19980913','https://www.culturacolectiva.com',4,'En las peliculas se planteaba la hipervigilancia digital como solución a la criminalidad, y 18 años después, este panorama ya no es ciencia ficción.','O');
GO
INSERT INTO Trabajo VALUES('Mariposas salvadoras','otro','20071202','https://www.medicina21.com',11,'Recientemente los entomólogos descubrieron que seguir el rastro de las mariposas comunes puede mostrar cambios climáticos, específicamente aquellas consideradas como especies “basura”.','O');
GO
INSERT INTO Trabajo VALUES('Grafeno','articulo','20171030','https://www.culturacolectiva.com',4,'Este material, gracias a su transparencia, flexibilidad y buena conducción de la electricidad, puede crear móviles flexibles, ordenadores que se podrán enrollar como si fueran de papel.','A');
GO
INSERT INTO Trabajo VALUES('Inventar la rueda','poster','20170108','https://www.listas.20minutos.es',12,'Una bicicleta eléctrica cabe en una rueda. Ese es el concepto de Rool´in, una rueda que se acopla a cualquier tipo de bicicleta para transformarla en eléctrica.','P');
GO
INSERT INTO Trabajo VALUES('Realidad virtual inalámbrica','articulo','20150312','https://www.vr.com',11,'Evitar el cableado que conecta los cascos más potentes a consolas u ordenadores. Project Santa Cruz(VR de Facebook) quiere lograr que las experiencias de realidad virtual sean más espectaculares.','A');
GO
--SELECT * FROM Trabajo


--X-X-X-X- TRABAJO DATOS INVÁLIDOS --X-X-X-X-
--INSERT INTO Trabajo VALUES(NULL,'poster','20170927',NULL,3,'Se descubrió que las células sanas dañadas por la quimioterapia pueden recuperarse mediante la proteína ZATT que restablece las roturas en el ADN provocadas por el tratamiento contra el cáncer.','P');
--GO
--INSERT INTO Trabajo VALUES('Baterías fabricadas a partir de hongos portobello',NULL,'20160815',NULL,2,'Un nuevo tipo de batería de litio e iones a partir de hongos portobella, materia prima barata, no afecta negativamente al medio ambiente y fácil de producir.','O');
--GO
--INSERT INTO Trabajo VALUES('Reducir la ingesta de azúcares en niños es clave para evitar las enfermedades cardiovasculares','articulo','20150202','http://www.universia.es/universidades/universidad-zaragoza/in/10021',1,NULL,'A');
--GO
--INSERT INTO Trabajo VALUES('Mirar demasiadas horas de televisión puede afectar el rendimiento cognitivo','poster',NULL,NULL,4,'Jóvenes que pasan más de tres horas frente al televisor en la etapa adulta podrían llegar a tener problemas de rendimiento cognitivo.','P');
--GO
--INSERT INTO Trabajo VALUES('Reparación de células dañadas por quimioterapia','nota','20170107','http://www.csic.es',1,'Se descubrió que las células sanas dañadas por la quimioterapia pueden recuperarse mediante la proteína ZATT que restablece las roturas en el ADN provocadas por el tratamiento contra el cáncer.','A');
--GO
--INSERT INTO Trabajo VALUES('Baterías fabricadas a partir de hongos portobello','otro','20170305',NULL,2,'Un nuevo tipo de batería de litio e iones a partir de hongos portobella, materia prima barata, no afecta negativamente al medio ambiente y fácil de producir.',NULL);
--GO
--INSERT INTO Trabajo VALUES('Auto piloto automático','otro','20130707','https://www.culturacolectiva.com',1,'Ford ha dicho que 2021.NuTonomy avisa de que sus taxis sin piloto circularán por Singapur en 2018. Volkswagen habla de 2019.Y Elon Musk, cree que su Tesla totalmente autónomo estará listo para 2018.','P');
--GO

-- Tags DATOS VÁLIDOS --
INSERT INTO Tags VALUES('Células');
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
INSERT INTO Tags VALUES('Televisión');
GO
INSERT INTO Tags VALUES('Rendimiento cognitivo');
GO
INSERT INTO Tags VALUES('Globalización');
GO
INSERT INTO Tags VALUES('Información');
GO
INSERT INTO Tags VALUES('Bases de datos');
GO
INSERT INTO Tags VALUES('Compañías');
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
INSERT INTO Tags VALUES('Cirugía ortognática');
GO
INSERT INTO Tags VALUES('Deformidades faciales');
GO
INSERT INTO Tags VALUES('Parkinson');
GO
INSERT INTO Tags VALUES('Esquizofrenia');
GO
INSERT INTO Tags VALUES('NoSQL');
GO
INSERT INTO Tags VALUES('Riñón');
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
INSERT INTO Tags VALUES('fibrosis quística pulmonar');
GO
INSERT INTO Tags VALUES('NGS');
GO
INSERT INTO Tags VALUES('Tiroides');
GO
INSERT INTO Tags VALUES('ADN');
GO
--SELECT * FROM Tags


-- TTags DATOS VÁLIDOS --
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

--X-X-X-X- TTags DATOS INVÁLIDOS --X-X-X-X-
--INSERT INTO TTags VALUES(NULL,3,'O');
--GO
--INSERT INTO TTags VALUES(7,NULL,'P');
--GO
--INSERT INTO TTags VALUES(9,2,NULL);
--GO

-- TAutores DATOS VÁLIDOS --
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

--X-X-X-X- TAutores DATOS INVÁLIDOS -X-X-X-X-
--INSERT INTO TAutores VALUES(NULL,'autor-director',4,'P');
--GO
--INSERT INTO TAutores VALUES(5,'autor-ppal',NULL,'O');
--GO
--INSERT INTO TAutores VALUES(6,'autor-sec',1,NULL);
--GO
--INSERT INTO TAutores VALUES(7,'autor-ter',1,'A');
--GO

-- Referencias DATOS VÁLIDOS --
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


--X-X-X-X- Referencias DATOS INVÁLIDOS -X-X-X-X-
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