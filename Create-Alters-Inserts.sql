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
	idTag	INT, 
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
	nivelLugar	INT, 
	anio		INT NOT NULL, 
	mes			INT NOT NULL, 
	diaIni		INT, 
	diaFin		INT,
	link		VARCHAR(200), 
	universidad VARCHAR(50) 
)
GO

CREATE TABLE TablaAuxiliar 
(
	idLugar		INT PRIMARY KEY, 
	nombre		VARCHAR(100) NOT NULL, 
	nivelLugar	INT, 
	anio		INT NOT NULL, 
	mes			INT NOT NULL, 
	diaIni		INT, 
	diaFin		INT,
	link		VARCHAR(200), 
	universidad VARCHAR(50),
	usuario VARCHAR(100),
	fecha date,
	tipoLugar varchar(20),
	diaIniCon int,
	diaFinCon int
)
GO
--SELECT * FROM Lugares



CREATE INDEX i_1
ON INVESTIGADOR (idUniversidad);

CREATE INDEX i_2
ON TRABAJO (lugarPublic);

CREATE INDEX i_3
ON TTags (idTag);

CREATE INDEX i_4
ON TAutores (idInvestigador);

CREATE INDEX i_5
ON Referencias (idTrabReferenciado);

CREATE INDEX i_6
ON LUGARES (universidad);




/*      UNIVERSIDAD       */
ALTER TABLE Universidad
	DROP COLUMN nombre;
GO
ALTER TABLE Universidad
	ADD nombre VARCHAR(50) PRIMARY KEY;
GO
ALTER TABLE Universidad
    ADD telefono VARCHAR(30) NOT NULL;
GO
	
/*     INVESTIGADOR     */

ALTER TABLE Investigador
    DROP COLUMN idInvestigador;
GO
ALTER TABLE Investigador
	ADD idInvestigador INT IDENTITY(1,1) PRIMARY KEY;
GO
ALTER TABLE Investigador
	ADD idUniversidad VARCHAR(50) FOREIGN KEY(idUniversidad) 
	REFERENCES Universidad(nombre) NOT NULL;
GO
ALTER TABLE Investigador
	ADD CONSTRAINT CK_nivelInvestig_Investigador CHECK(nivelInvestig IN('EGrado','EMaestria','EDoctor','Doctor'));
GO
ALTER TABLE Investigador
	ADD CONSTRAINT UQ_mail_Investigador UNIQUE(mail);
GO
	
/*      TRABAJO     */
ALTER TABLE Trabajo
    DROP COLUMN descripTrab;
GO
ALTER TABLE Trabajo
    ADD descripTrab VARCHAR(200) NOT NULL;
GO
ALTER Table Trabajo
	ADD CONSTRAINT CK_tipoTrab_Trabajo CHECK(tipoTrab IN('poster','articulo','capitulo','otro'));
GO
ALTER TABLE Trabajo
	ADD CONSTRAINT FK_lugarPublic_Lugares FOREIGN KEY(lugarPublic)
	REFERENCES Lugares(idLugar);
GO
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
	ADD CONSTRAINT PK_letra_idTrab_Trabajo PRIMARY KEY(idTrab,letra);
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
	ADD idTrab INT NOT NULL;
GO
ALTER TABLE TTags
    ADD letra CHAR(1) NOT NULL;
GO 
ALTER TABLE TTags
	ADD CONSTRAINT FK_idTag_TTags FOREIGN KEY(idTag)
	REFERENCES Tags(idtag);
GO
ALTER TABLE TTags
	ADD CONSTRAINT FK_idTrab_letra_TTags FOREIGN KEY(idTrab,letra)
	REFERENCES Trabajo(idTrab,letra);
GO
ALTER TABLE TTags
	ADD CONSTRAINT PK_idTag_idTrab_letra_TTags PRIMARY KEY(idTag,idTrab,letra)
GO
	
/*    TAutores   */
ALTER TABLE TAutores
	DROP COLUMN idTrab;
GO
ALTER TABLE TAutores
	ADD idTrab INT NOT NULL;
GO
ALTER TABLE TAutores
    ADD letra CHAR(1) NOT NULL;
GO 
ALTER TABLE TAutores
	ALTER COLUMN rolinvestig VARCHAR(20);
GO
ALTER TABLE TAutores
	ADD CONSTRAINT CK_rolinvestig_TAutores CHECK(rolinvestig IN('autor-ppal','autor-sec','autor-director'));
GO
ALTER TABLE TAutores
	ADD CONSTRAINT FK_idTrab_letra_TAutores FOREIGN KEY(idTrab,letra)
	REFERENCES Trabajo(idTrab,letra);
GO
ALTER TABLE TAutores
	ADD CONSTRAINT FK_idInvestigador_TAutores FOREIGN KEY(idInvestigador)
	REFERENCES Investigador(idInvestigador);
GO
ALTER TABLE TAutores
	ADD CONSTRAINT PK_idInvestigador_idTrab_letra_TAutores PRIMARY KEY(idInvestigador,idTrab,letra);
GO
	
/*     Referencias    */
ALTER TABLE Referencias
	DROP COLUMN idTrab;
GO
ALTER TABLE Referencias
	ADD idTrab INT NOT NULL;
GO
ALTER TABLE Referencias
    ADD letra CHAR(1) NOT NULL;
GO 
ALTER TABLE Referencias
	DROP COLUMN idTrabReferenciado;
GO
ALTER TABLE Referencias
	ADD idTrabReferenciado INT NOT NULL;
GO
ALTER TABLE Referencias
    ADD letraReferenciado CHAR(1) NOT NULL;
GO 
ALTER TABLE Referencias
	ADD CONSTRAINT CK_idTrab_Referencias CHECK(idTrab <> idTrabReferenciado);
GO
ALTER TABLE Referencias
	ADD CONSTRAINT FK_idTrab_letra_Referencias FOREIGN KEY(idTrab,letra)
	REFERENCES Trabajo(idTrab,letra);
GO
ALTER TABLE Referencias
	ADD CONSTRAINT PK_idTrabReferenciado_letraReferenciado_idTrab_letra_Referencias PRIMARY KEY(idTrab,letra,idTrabReferenciado,letraReferenciado);
GO

/*   Lugares   */
ALTER TABLE Lugares
	ADD TipoLugar VARCHAR(20);
GO
ALTER TABLE Lugares
	ADD diaIniCon INT;
GO
ALTER TABLE Lugares
	ADD diaFinCon INT;
GO
ALTER TABLE Lugares
	ALTER COLUMN nombre VARCHAR(250) NOT NULL;
GO
ALTER TABLE Lugares
	ADD CONSTRAINT UQ_nombre_Lugares UNIQUE(nombre);
GO
ALTER TABLE Lugares
	ADD CONSTRAINT CK_TipoLugar_Lugares CHECK(TipoLugar IN('Congresos','Revistas','Libros'));
GO
ALTER TABLE Lugares
	ADD CONSTRAINT CK_nivelLugar_Lugares CHECK(nivelLugar BETWEEN 1 AND 4);
GO
ALTER TABLE Lugares
	ADD CONSTRAINT FK_universidad_Lugares FOREIGN KEY(universidad) REFERENCES Universidad(nombre);
GO
ALTER TABLE Lugares
	ADD CONSTRAINT CK_diaIni_diaIniCon_Lugares CHECK(diaIni IS NOT NULL AND diaIniCon IS NULL AND TipoLugar IN('Revistas','Libros') OR 
													  diaIniCon IS NOT NULL AND diaIni IS NULL AND TipoLugar = 'Congresos');
GO
ALTER TABLE Lugares
	ADD CONSTRAINT CK_diaFin_diaFinCon_Lugares CHECK(diaFin IS NOT NULL AND diaFinCon IS NULL AND TipoLugar IN('Revistas','Libros') OR 
													  diaFinCon IS NOT NULL AND diaFin IS NULL AND TipoLugar = 'Congresos');
GO



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
INSERT INTO Universidad VALUES('Uruguay','Paysandu','Universitario Paysandu','25829939');
GO
INSERT INTO Universidad VALUES('Uruguay','Rivera','University College Rivera','72449009');
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
INSERT INTO Lugares VALUES(2,'Salón Principal',3,2016,10,NULL,NULL,'www.eduk.edu.uy','UDELAR','Congresos','18','19');
GO
INSERT INTO Lugares VALUES(3,'Salón de Eventos Nº2',2,2015,4,NULL,NULL,'www.teoriadelaimagen.com','UDELAR','Congresos','5','16');
GO
INSERT INTO Lugares VALUES(4,'Bibloteca Principal',1,2015,12,'14','16',NULL,'ORT','Libros',NULL,NULL);
GO
INSERT INTO Lugares VALUES(5,'Salón de Eventos Nº5',3,2016,5,'1','5',NULL,'UDELAR','Libros',NULL,NULL);
GO
INSERT INTO Lugares VALUES(6,'Sala Común N°2',4,2017,12,'13','14','www.infocongress.com.mx','Universidad de la Empresa','Revistas',NULL,NULL);
GO
INSERT INTO Lugares VALUES(7,'Sala Común N°4',1,2015,1,'22','29',NULL,'Universidad de la Empresa','Revistas',NULL,NULL);
GO
INSERT INTO Lugares VALUES(8,'Bibloteca Anexo N°1',1,2016,4,NULL,NULL,'www.unicon.edu.uy','Universidad de Canelones','Congresos','15','16');
GO
INSERT INTO Lugares VALUES(9,'Salón Secundario',4,2017,3,NULL,NULL,'www.tier.com','ORT','Congresos','1','6');
GO
INSERT INTO Lugares VALUES(10,'Salón Comunitario',4,2014,8,NULL,NULL,'www.analytics.edu.uy','Universidad de la Empresa','Congresos','22','23');
GO
INSERT INTO Lugares VALUES(11,'Sheraton',4,2017,5,NULL,NULL,'www.hopper.com','Universidad de la Empresa','Congresos','4','5');
GO
INSERT INTO Lugares VALUES(12,'Centro Comunitario N°1',3,2016,6,'2','9',NULL,'ORT','Revistas',NULL,NULL);
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
INSERT INTO Lugares VALUES(21,'Sala Congreso 1',4,2017,3,NULL,NULL,'www.congresosUDE.com.uy','Universidad de la Empresa','Congresos','1','20');
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
GO --1
INSERT INTO Investigador VALUES('Marcelo Sosa','sosaM@gmail.com','093664501','Ingeniería','EGrado',0,'Universidad de Montevideo');
GO --2
INSERT INTO Investigador VALUES('Juan Perez','jp@gmail.com','098743213','Ingeniería','EMaestria',6,'ORT');
GO --3
INSERT INTO Investigador VALUES('Gonzalo Gonzalez','gongonza@hotmail.com','091563487','Medicina','EDoctor',10,'ORT');
GO --4
INSERT INTO Investigador VALUES('Pablo Sosa','PabloSosa@gmail.com','095663207','Medicina','EMaestria',3,'Universidad Catolica');
GO --5
INSERT INTO Investigador VALUES('Juan Colo','colorado@gmail.com','094755203','Medicina','EDoctor',7,'ORT');
GO --6
INSERT INTO Investigador VALUES('Luis Gonzalez','LuisG@gmail.com','091000123','Ingeniería','EGrado',6,'Universidad de la Empresa');
GO --7
INSERT INTO Investigador VALUES('Patricio Moreira','pmor34@hotmail.com','094755203','Ingeniería','Doctor',4,'ORT');
GO --8
INSERT INTO Investigador VALUES('Alberto Soto','albertsot32@gmail.com','099697589','Medicina','Doctor',6,'Universidad Catolica');
GO --9
INSERT INTO Investigador VALUES('Joaquin Lasarte','jlas3@gmail.com','095787520','Ingeniería','EGrado',2,'UDELAR');
GO --10
INSERT INTO Investigador VALUES('Pedro Torreira','ptorreira@gmail.com','099605879','Medicina','EDoctor',4,'ORT');
GO --11
INSERT INTO Investigador VALUES('Manuel Maldonado','mm3252@gmail.com','095289647','Medicina','EGrado',1,'UDELAR');
GO --12
INSERT INTO Investigador VALUES('Matias Beri','mberi3@hotmail.com','099305122','Medicina','Doctor',4,'Universidad Catolica');
GO --13
INSERT INTO Investigador VALUES('Martin Rivero','mriv342@gmail.com','098945525','Medicina','EMaestria',5,'ORT');
GO --14
INSERT INTO Investigador VALUES('Leonardo Sereno','lsereno17@gmail.com','099355930','Medicina','EMaestria',4,'Universidad de la Empresa');
GO --15
INSERT INTO Investigador VALUES('Eduardo Sereno','edusereno09@gmail.com','099355931','Ingeniería','EGrado',0,'ORT');
GO --16
--SELECT * FROM Investigador

--X-X-X-X- INVESTIGADOR DATOS INVÁLIDOS --X-X-X-X-
--INSERT INTO Investigador VALUES(NULL,'joaquinsbo@gmail.com','095474887','Contador','EMaestria',1,'Universidad Catolica');
--GO
--INSERT INTO Investigador VALUES('Jorge Kach','kachrf@gmail.com','26018752','Investigador','EPasantía',3,'ORT');
--GO
--INSERT INTO Investigador VALUES('Horacio Colo','colorado@gmail.com','26079494','Abogado','EDoctor',2,'ORT');
--GO


-- TRABAJO DATOS VÁLIDOS --
INSERT INTO Trabajo VALUES('Reparación de células dañadas por quimioterapia','articulo','20160927','http://www.csic.es',2,'Se descubrió que las células sanas dañadas por la quimioterapia pueden recuperarse mediante la proteína ZATT que restablece las roturas en el ADN provocadas por el tratamiento contra el cáncer.','A');
GO --1
INSERT INTO Trabajo VALUES('Reducir la ingesta de azúcares en niños es clave para evitar las enfermedades cardiovasculares','articulo','20170322','http://www.universia.es/universidades/universidad-zaragoza/in/10021',1,'Investigación en 400 niños de 9 países europeos para conocer sus hábitos alimenticios. Concluye que un 39% de los niños tienen más chances de presentar un estado inflamatorio elevado.','A');
GO --2
INSERT INTO Trabajo VALUES('Baterías fabricadas a partir de hongos portobello','otro','20160305',NULL,2,'Un nuevo tipo de batería de litio e iones a partir de hongos portobella, materia prima barata, no afecta negativamente al medio ambiente y fácil de producir.','O');
GO --3
INSERT INTO Trabajo VALUES('Mirar demasiadas horas de televisión puede afectar el rendimiento cognitivo','poster','20170306','https://www.harvard.edu',9,'Jóvenes que pasan más de tres horas frente al televisor en la etapa adulta podrían llegar a tener problemas de rendimiento cognitivo.','P');
GO --4
INSERT INTO Trabajo VALUES('La globalización de las bases de datos','articulo','20140422','http://www.dbaspot.com',10,'Las bases de datos se ingeniaron gracias a la necesidad de las grandes empresas de almacenar ingentes cantidades de información de una forma rápida, sencilla y fiable','A');
GO --5
INSERT INTO Trabajo VALUES('Bases de datos para el mundo empresarial','capitulo','20140802','http://www.revistabyte.es/comparativa-byte-ti',7,'Las bases de datos, a las que también es posible referirse como bancos de información, son muy utilizadas por compañías de distintos tamaño, trabajadores autónomos e, incluso, hogares residenciales.','C');
GO --6
INSERT INTO Trabajo VALUES('Base Mundial de Datos sobre Marcas','capitulo','20140101',NULL,6,'Esta base de datos es un portal de acceso a más de 33.330.000 entradas de& 35 colecciones nacionales e internacionales.','C');
GO --7
INSERT INTO Trabajo VALUES('Sistemas Gestores de Bases de datos y Almacenamiento','otro','20140201','https://www.harvard.edu',10,'Durante décadas, las organizaciones se han esforzado por gestionar sus datos con eficacia. Sin embargo, para guardarlos utilizaban almacenes de datos muy frágiles.','O');
GO --8
INSERT INTO Trabajo VALUES('Cirugía ortognática para corregir las deformidades faciales','poster','20161126','https://www.topdoctors.es',9,'Las deformidades faciales se dan cuando crecen de forma anormal los huesos de la cara: la mandíbula, el maxilar superior, los pómulos, la nariz o el mentón.','P');
GO --9
INSERT INTO Trabajo VALUES('¿Cómo combatir y frenar el parkinson?','articulo','20170122','https://www.topdoctors.es',9,'La vida de un enfermo, de un paciente con enfermedad de parkinson, es una vida fácil al principio y normal y complicada cuando la enfermedad progresa.','A');
GO --10
INSERT INTO Trabajo VALUES('Identifican nuevo mecanismo en el desarrollo de la esquizofrenia','poster','20170201','https://www.medicina21.com',13,'Científicos del Trinity College de Dublín (Irlanda) han descubierto que las anomalías en los vasos sanguíneos del cerebro podrían tener un papel de importancia en el desarrollo de la esquizofrenia.','P');
GO --11
INSERT INTO Trabajo VALUES('Bases de datos NoSQL. Elige la opción que mejor se adapte a tus necesidades','capitulo','20110904','https://www.genbetadev.com',1,'Son las bases de datos NoSQL más versátiles. Se pueden utilizar en gran cantidad de proyectos, incluyendo muchos que tradicionalmente funcionarían sobre bases de datos relacionales.','C');
GO --12
INSERT INTO Trabajo VALUES('Descubierto el primer fármaco que actúa como protector del riñón','otro','20150103','https://www.medicina21.com',14,'El medicamento permite utilizar con seguridad otros fármacos que, sin la cilastatina, harían daño al riñón. "Aumenta así la seguridad del tratamiento para el cáncer"','O');
GO --13
INSERT INTO Trabajo VALUES('Migración de una base de datos de SQL Server a una Base de datos SQL en la nube','articulo','20171130','https://docs.microsoft.com',7,'En este artículo se describen los dos principales métodos para migrar una base de datos de SQL Server 2005 o posterior a Azure SQL Database.','A');
GO --14
INSERT INTO Trabajo VALUES('Consideraciones para el uso de cifrado en las bases de datos','poster','20161123','https://revista.seguridad.unam.mx',6,'El cifrado de datos es una alternativa muy usada para el cumplimiento del requisito de confidencialidad de la información en las bases de datos.','P');
GO --15
INSERT INTO Trabajo VALUES('Como crear un backup de la base de datos de PrestaShop','otro','20160515','https://www.hostinet.com',9,'Hoy en día disponer de varios backups de la base de datos de PrestaShop, ya sea en un pendrive, un disco duro portátil o cualquier otro dispositivo de almacenamiento ¡es muy importante!.','O');
GO --16
INSERT INTO Trabajo VALUES('Inteligencia artificial para ayudar a tomar la mejor decisión en el tratamiento de pacientes','articulo','20150508','http://noticiasdelaciencia.com',4,'La técnica está basada en la aplicación de servicios web semánticos que utilizan inteligencia artificial para que las máquinas puedan localizar y acceder a los sistemas de ayuda.','A');
GO --17
INSERT INTO Trabajo VALUES('Bacterias depredadoras contra los patógenos de la fibrosis quística pulmonar','capitulo','20130131','http://noticiasdelaciencia.com',9,'Las nuevas herramientas de secuenciación genética (next-generation sequencing o NGS) están permitiendo constatar una enorme complejidad en el microbioma pulmonar.','C');
GO --18
INSERT INTO Trabajo VALUES('Cáncer de tiroides','otro','20170121','http://www.intramed.net',9,'El cáncer de tiroides es el cáncer endocrino más frecuente y su incidencia aumentó considerablemente en todo el mundo en las últimas décadas.','O');
GO --19
INSERT INTO Trabajo VALUES('Fábricas de ADN','poster','20110904',NULL,18,'A medida que es más y más barato crear trozos grandes de material genético desde el principio, los científicos podrán obtener creaciones biológicas cada vez más complejas.','P');
GO --20
INSERT INTO Trabajo VALUES('Combustible de algas','poster','20030424','https://www.culturacolectiva.com',4,'Entre las ventajas a diferencia del maíz, las algas no necesitan un área extensa para crecer y pueden hacerlo en lugares inapropiados para la actividad agrícola, como los desiertos','P');
GO --21
INSERT INTO Trabajo VALUES('Agua en Marte','articulo','20170316','https://www.culturacolectiva.com',3,'La NASA confirmó el hallazgo de evidencia directa sobre la posible existencia de agua líquida en la superficie de Marte. Todo indica que lo más probable es que sea de la atmósfera.','A');
GO --22
INSERT INTO Trabajo VALUES('Ardi','articulo','20170224','https://www.exploracion.com',3,'Presentado como el antepasado más antiguo del ser humano. Fue catalogada como un Ardipithecus ramidus, una especie de homínido que vivió hace 4.4 millones en lo que hoy es conocido como Etiopía','A');
GO --23
INSERT INTO Trabajo VALUES('Drones','otro','19980913','https://www.culturacolectiva.com',9,'En las peliculas se planteaba la hipervigilancia digital como solución a la criminalidad, y 18 años después, este panorama ya no es ciencia ficción.','O');
GO --24
INSERT INTO Trabajo VALUES('Mariposas salvadoras','otro','20071202','https://www.medicina21.com',9,'Recientemente los entomólogos descubrieron que seguir el rastro de las mariposas comunes puede mostrar cambios climáticos, específicamente aquellas consideradas como especies “basura”.','O');
GO --25
INSERT INTO Trabajo VALUES('Grafeno','articulo','20171030','https://www.culturacolectiva.com',4,'Este material, gracias a su transparencia, flexibilidad y buena conducción de la electricidad, puede crear móviles flexibles, ordenadores que se podrán enrollar como si fueran de papel.','A');
GO --26
INSERT INTO Trabajo VALUES('Inventar la rueda','poster','20170108','https://www.listas.20minutos.es',12,'Una bicicleta eléctrica cabe en una rueda. Ese es el concepto de Rool´in, una rueda que se acopla a cualquier tipo de bicicleta para transformarla en eléctrica.','P');
GO --27
INSERT INTO Trabajo VALUES('Realidad virtual inalámbrica','articulo','20170504','https://www.vr.com',11,'Evitar el cableado que conecta los cascos más potentes a consolas u ordenadores. Project Santa Cruz(VR de Facebook) quiere lograr que las experiencias de realidad virtual sean más espectaculares.','A');
GO --28
INSERT INTO Trabajo VALUES('Inteligencia Artifical detecta pinturas falsas','articulo','20170102','https://www.artInteligence.com',9,'El sistema permite determinar si una obra de arte es plagiada, con solo analizar un trazo. La técnica está basada en un modelo de Inteligencia Artificial','A');
GO --29
INSERT INTO Trabajo VALUES('El cerebro de los músicos procesa mejor el habla','otro','20170305','https://www.artInteligence.com',11,'Beneficio potencial de la formación musical en el procesamiento del habla. Antes los mecanismos cerebrales que respaldan estas posibles ventajas no estaban claros.','O');
GO --30
INSERT INTO Trabajo VALUES('Mesa de disección virtual','poster','20170504','https://www.claeh.com',11,'La Facultad de Medicina del Claeh incorporó una herramienta educativa que les facilita a los estudiantes el aprendizaje de anatomía humana','P');
GO --31
INSERT INTO Trabajo VALUES('Sistema para evitar accidentes en drones','otro','20170304','https://www.amazon-drones.com',9,'La idea es que el aparato de Amazon se autodestruya en un lugar seguro alejado de la población','O');
GO --32
INSERT INTO Trabajo VALUES('El último cielo','poster','20170304','https://www.planetario.uy',10,'La actividad será el viernes 8 de diciembre y pondrá en funcionamiento al proyector más antiguo del mundo','P');
GO --33
INSERT INTO Trabajo VALUES('Acabar con las noticias falsas en internet','poster','20170124','https://www.cromo.com.uy',11,'Fundador de Alibaba cree posible acabar con las noticias falsas en internet. El empresario chino aseguró que todo lo que se hace en el ciberespacio deja un rastro','P');
GO --34
INSERT INTO Trabajo VALUES('Robots que ya están entre nosotros','articulo','20161224','https://www.cromo.com.uy',21,'¿Los robots cambiarán la manera en la cual vivimos porque realizarán muchísimas actividades por nosotros? ¿Es posible que algún día ellos nos dominen?','A');
GO --35
INSERT INTO Trabajo VALUES('Mejorar el rendimiento del móvil ante una actualización','otro','20170228','https://www.ios.uy',21,'Lo que algunos creen que es obsolescencia programada no es otra cosa que cambios en el software','O');
GO --36
INSERT INTO Trabajo VALUES('Servicio de robot-taxis','articulo','20170228','https://www.ios.uy',21,'Los vehículos comenzarán a circular en 2020, durante los Juegos Olímpicos de Tokio','A');
GO --37
INSERT INTO Trabajo VALUES('Tinta para impresora 3D con bacterias vivas','articulo','20160722','https://www.udecromo.uy',21,'Los avances en impresión 3D y el metabolismo tan variado que ofrecen las bacterias, capaces de degradar muchos compuestos y sintetizar otros, han permitido crear una nueva tinta con microorganismos','A');
GO --38
INSERT INTO Trabajo VALUES('Aumento del nivel del mar puede sumergir 13.000 sitios históricos','articulo','20161116','https://www.ambUDE.uy',21,'Investigadores predicen que estas locaciones podrían quedar bajo agua antes de finales de siglo si el mar sigue creciendo de la forma prevista','A');
GO --39
INSERT INTO Trabajo VALUES('Satélite que mide la contaminación del planeta','otro','20151018','https://www.ambUDE.uy',21,'El Sentinel-5P recogerá los datos sobre los diferentes gases que se encuentran en la atmósfera','O');
GO --40
INSERT INTO Trabajo VALUES('Avances en el estudio de la materia oscura','otro','20140911','https://www.ambUDE.uy',21,'Un satélite chino ha detectado "señales inesperadas y misteriosas" en su medición de rayos cósmicos de alta energía, algo que, podría llevar a arrojar luz sobre la materia oscura','O');
GO --41
INSERT INTO Trabajo VALUES('Los recuerdos a largo plazo','poster','20160621','https://www.ambUDE.uy',21,'Identifica los cambios de contexto y los utiliza para fragmentar el curso de los acontecimientos en unidades de memoria','P');
GO --42
INSERT INTO Trabajo VALUES('Una mutación en la evolución animal explica el origen de los órganos humanos','articulo','20161021','https://www.ciencia.com',21,'Un error en el proceso evolutivo que se produjo hace más de 700 millones de años podría explicar el origen de órganos en humanos y en otros vertebrados','A');
GO --43
INSERT INTO Trabajo VALUES('Así cambia nuestro cerebro a lo largo de la vida','poster','20151213','https://www.ciencia.com',21,'Existen diferencias entre la evolución en los hombres y las mujeres','P');
GO --44
INSERT INTO Trabajo VALUES('Identidad del yeti','poster','20110113','https://www.ciencia.com',21,'Los resultados de ADN demuestran que pertenece a una especie de oso que habita en la región del Tíbet y las laderas del Himalaya','P');
GO --45
INSERT INTO Trabajo VALUES('El Big Bang nunca ocurrió','otro','20160727','https://www.ciencia.com',21,'"Creo que el Big Bang nunca ocurrió", sostiene Julian Cesar Silva Neves, investigador del Instituto de Matemática, Estadística y Computación Científica de la Universidad Estatal de Campinas en Brasil.','O');
GO --46
INSERT INTO Trabajo VALUES('Primer trasplante de cabeza','articulo','20170301','https://www.ambUDE.uy',21,'El cirujano chino Ren Xiaoping, que junto a su colega italiano Sergio Canavero se prepara para practicar en China el primer trasplante de cabeza del mundo','A');
GO --47
INSERT INTO Trabajo VALUES('Defensores de que la Tierra es plana celebraron su primera conferencia','otro','20170215','https://www.ambUDE.uy',21,'Cuestionan la idea de que el mundo es esférico y argumentan que la NASA falsifica las imágenes digitales','O');
GO --48
INSERT INTO Trabajo VALUES('Alteración genética de animales podría afectar la agricultura','articulo','20170210','https://www.ambUDE.uy',21,'La domesticación de animales iniciada por los humanos a finales de la última edad de hielo alteró su microbioma','A');
GO --49
INSERT INTO Trabajo VALUES('7 años y enseña neurociencia por internet','otro','20160606','https://www.ambUDE.uy',21,'Amoy Antunet Shepherd tiene 7 años y, aunque todavía va a la escuela primaria, ha comenzado a dar clases de neurociencia a través de internet.','O');
GO --50
INSERT INTO Trabajo VALUES('Profecías sobre el final de la humanidad','otro','20160826','https://www.ambUDE.uy',21,'El científico británico Stephen Hawking predijo el fin de la humanidad en más de una ocasión. Estas son cinco de sus "profecías" con diferentes y horribles desenlaces.','O');
GO --51
INSERT INTO Trabajo VALUES('La luz azul ayuda a la relajación luego de una discusión','poster','20160901','https://www.ambUDE.uy',21,'La luz blanca convencional, acelera el proceso de relajación después de un proceso de estrés psicosocial agudo.','P');
GO --52
INSERT INTO Trabajo VALUES('SMS cumple 25 años','poster','20170101','https://www.tecnoUDE.uy',21,'Los mensajes de texto tuvieron su tiempo de gloria; todo comenzó con un mensaje navideño','P');
GO --53
INSERT INTO Trabajo VALUES('Adicción al móvil puede provocar depresión o insomnio','otro','20140412','https://www.tecnoUDE.uy',21,'Los jóvenes dependientes de las nuevas tecnologías presentan índices significativamente superiores en estos trastornos','O');
GO --54
INSERT INTO Trabajo VALUES('Así es como las máquinas aprenden a traducir idiomas sin intervención humana','otro','20160422','https://www.tecnoUDE.uy',21,'Dos investigaciones mostraron métodos de aprendizaje automático para conseguir que los sistemas de puedan traducir idiomas por sí mismos','O');
GO --55
INSERT INTO Trabajo VALUES('Fortis, el traje que otorga "habilidades sobrehumanas" a los soldados','articulo','20151022','https://www.tecnoUDE.uy',21,'El Ejército de Estados Unidos está desarrollando un traje futurista que utiliza inteligencia artificial para otorgar a los combatientes "habilidades sobrehumanas','A');
GO --56
INSERT INTO Trabajo VALUES('El mineral que haría a internet mil veces más rápida','articulo','20160505','https://www.tecnoUDE.uy',21,'Investigan el potencial de la perovskita como componente para los sistemas de telecomunicaciones de nueva generación','A');
GO --57
INSERT INTO Trabajo VALUES('Aviones sin piloto','articulo','20131205','https://www.tecnoUDE.uy',21,'Airbus pretende desarrollar aviones autónomos que permitan que únicamente un piloto los opere, según dijo a Bloomber el director de tecnología del constructor aeronáutico europeo, Paul Eremenko.','A');
GO --58
INSERT INTO Trabajo VALUES('Una foto pone en duda el viaje del Apolo 17','poster','20161130','https://www.tecnoUDE.uy',21,'Casi 50 años después de que el hombre pisara la Luna, la veracidad de otro viaje espacial está bajo la lupa una vez más.','P');
GO --59
INSERT INTO Trabajo VALUES('La NASA muestra imagen del agujero coronal en el Sol','poster','20161110','https://www.tecnoUDE.uy',21,'Casi 50 años después de que el hombre pisara la Luna, la veracidad de otro viaje espacial está bajo la lupa una vez más.','P');
GO --60
INSERT INTO Trabajo VALUES('Papel Aluminio aumenta nivel wifi','poster','20170110','https://www.tecnoUDE.uy',1,'Poner papel aluminio en las antenas del router aumenta los nivel de wifi y el alcance del mismo.','P');
GO --61
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
INSERT INTO Tags VALUES('Agua');
GO
INSERT INTO Tags VALUES('Marte');
GO
INSERT INTO Tags VALUES('Algas');
GO
INSERT INTO Tags VALUES('Drones');
GO
INSERT INTO Tags VALUES('Mariposas');
GO
INSERT INTO Tags VALUES('Grafeno');
GO
INSERT INTO Tags VALUES('Rueda');
GO
INSERT INTO Tags VALUES('Realidad virtual');
GO
INSERT INTO Tags VALUES('Inteligencia Artifical pinturas falsas');
GO
INSERT INTO Tags VALUES('Cerebro musicos habla');
GO
INSERT INTO Tags VALUES('Disección virtual');
GO
INSERT INTO Tags VALUES('sistema evitar accidentes drones');
GO
INSERT INTO Tags VALUES('planetario proyector antiguo uruguay');
GO
INSERT INTO Tags VALUES('noticias falsas internet');
GO
INSERT INTO Tags VALUES('robots nosotros actividades');
GO
INSERT INTO Tags VALUES('mejorar movil actualizacion software');
GO
INSERT INTO Tags VALUES('robot taxis');
GO
INSERT INTO Tags VALUES('impresora 3D tinta bacterias');
GO
INSERT INTO Tags VALUES('aumento nivel mar contaminación');
GO
INSERT INTO Tags VALUES('avances estudio materia oscura');
GO
INSERT INTO Tags VALUES('recuerdos cerebro largo plazo');
GO
INSERT INTO Tags VALUES('origen humano organos estructura');
GO
INSERT INTO Tags VALUES('cerebro vida cambios');
GO
INSERT INTO Tags VALUES('identidad yeti');
GO
INSERT INTO Tags VALUES('big bang');
GO
INSERT INTO Tags VALUES('transplante cabeza');
GO
INSERT INTO Tags VALUES('tierra plana');
GO
INSERT INTO Tags VALUES('genetica animal agricultura daño');
GO
INSERT INTO Tags VALUES('niña enseña internet neurociencia');
GO
INSERT INTO Tags VALUES('profecia final humanidad');
GO
INSERT INTO Tags VALUES('relajacion luz azul');
GO
INSERT INTO Tags VALUES('SMS');
GO
INSERT INTO Tags VALUES('adiccion movil depresion insomnio');
GO
INSERT INTO Tags VALUES('maquinas traducir idiomas');
GO
INSERT INTO Tags VALUES('fortis soldados habilidades sobrehumano');
GO
INSERT INTO Tags VALUES('mineral internet rapido');
GO
INSERT INTO Tags VALUES('avion sin piloto');
GO
INSERT INTO Tags VALUES('foto apolo 17');
GO
INSERT INTO Tags VALUES('agujero coronal sol');
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
INSERT INTO TTags (idTag,idTrab,letra) VALUES(71,41,'O');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(73,42,'P');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(75,43,'A');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(77,44,'P');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(79,46,'O');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(81,47,'A');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(83,48,'O');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(85,49,'A');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(87,50,'O');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(89,51,'O');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(91,52,'P');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(93,53,'P');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(95,54,'O');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(97,55,'O');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(99,56,'A');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(101,57,'A');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(103,58,'A');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(105,59,'P');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(107,60,'P');
GO
INSERT INTO TTags (idTag,idTrab,letra) VALUES(109,61,'P');
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
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(1,'autor-ppal',41,'O');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(1,'autor-sec',54,'O');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(1,'autor-director',55,'O');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(1,'autor-ppal',51,'O');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(1,'autor-director',50,'O');
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
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(3,'autor-director',17,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(3,'autor-sec',38,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(3,'autor-sec',37,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(3,'autor-ppal',57,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(3,'autor-ppal',58,'A');
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
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(4,'autor-ppal',44,'P');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(4,'autor-director',58,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(4,'autor-ppal',49,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(4,'autor-ppal',39,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(4,'autor-ppal',37,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(4,'autor-director',61,'P');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(4,'autor-sec',60,'P');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(4,'autor-sec',59,'P');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(4,'autor-ppal',52,'P');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(5,'autor-ppal',2,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(5,'autor-sec',3,'O');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(5,'autor-sec',4,'P');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(6,'autor-ppal',18,'C');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(6,'autor-director',1,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(6,'autor-director',3,'O');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(6,'autor-ppal',4,'P');
GO 
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(6,'autor-ppal',11,'P');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(6,'autor-ppal',2,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(6,'autor-ppal',44,'P');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(6,'autor-sec',15,'P');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(6,'autor-sec',21,'P');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(6,'autor-sec',20,'P');
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
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(7,'autor-ppal',18,'C');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(8,'autor-ppal',14,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(8,'autor-ppal',15,'P');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(8,'autor-sec',16,'O');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(8,'autor-director',6,'C');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(8,'autor-sec',44,'P');
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
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(9,'autor-sec',43,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(9,'autor-sec',35,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(9,'autor-director',29,'A');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(9,'autor-ppal',28,'A');
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
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(11,'autor-director',46,'O');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(11,'autor-sec',53,'P');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(11,'autor-sec',44,'P');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(11,'autor-director',45,'P');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(11,'autor-ppal',42,'P');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(11,'autor-director',34,'P');
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
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(15,'autor-sec',30,'O');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(15,'autor-ppal',32,'O');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(15,'autor-sec',36,'O');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(15,'autor-ppal',16,'O');
GO
INSERT INTO TAutores (idInvestigador,rolinvestig,idTrab,letra) VALUES(15,'autor-ppal',8,'O');
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
INSERT INTO Referencias (idTrab,letra,idTrabReferenciado,letraReferenciado) VALUES(20,'P',13,'O');
GO
INSERT INTO Referencias (idTrab,letra,idTrabReferenciado,letraReferenciado) VALUES(11,'P',13,'O');
GO
INSERT INTO Referencias (idTrab,letra,idTrabReferenciado,letraReferenciado) VALUES(57,'A',17,'A');
GO
INSERT INTO Referencias (idTrab,letra,idTrabReferenciado,letraReferenciado) VALUES(46,'O',18,'C');
GO
INSERT INTO Referencias (idTrab,letra,idTrabReferenciado,letraReferenciado) VALUES(3,'O',17,'A');
GO
INSERT INTO Referencias (idTrab,letra,idTrabReferenciado,letraReferenciado) VALUES(12,'C',17,'A');
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