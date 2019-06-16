INSERT INTO ROL (Id_rol, Nombre)
VALUES
	(1,'Administrador'),
	(2,'Cliente'),
	(3,'Cuidador');
	
INSERT INTO ESTADO (Id_estado, Nombre)
VALUES
	(0,'Activado'),
	(1,'Desactivado'),
	(2,'Bloqueado');
	
INSERT INTO USUARIO (Primer_nombre, Primer_apellido, Segundo_apellido, Id_rol, Email_1, Contrasena, Foto_perfil, Id_estado)
VALUES
	('Milton', 'Villegas', ' ', 1, 'miltonv@digipet.com', 'admin', 'milton.png', 0),
	('Fabian', 'Gonzalez', 'Araya', 2, 'fabiang@tec.com', '123456', 'fabian.png', 0),
	('Arturo', 'Cordoba', 'Villalobos', 2, 'arturoc@tec.com', '987654', 'arturo.png', 0),
	('Mélinda', 'Garbutt', 'Montacute', 3, 'nmontacute0@goo.gl', '87c1Dg', 'QuamFringilla.png', 0),
 	('Agnès', 'Szymanowski', 'Dreossi', 3, 'ddreossi1@msu.edu', '04gOmbG', 'NisiVenenatis.jpeg', 0),
 	('Aí', 'Slark', 'Brahmer', 3, 'lbrahmer2@gmail.com', '34xkc', 'AcNulla.tiff', 0),
 	('Cunégonde', 'Songest', 'Mishaw', 3, 'lmishaw3@vk.com', '6213s', 'InHacHabitasse.png', 0),
 	('Loïs', 'Burkin', 'Zorzenoni', 3, 'ezorzenoni4@theatlantic.com', '36tiYF', 'Elementumisque.jpeg', 2),
 	('Lóng', 'Richie', 'Gewer', 3, 'cgewer5@flickr.com', '38k1x', 'Libero.jpeg', 2),
 	('Cunégonde', 'Flecknell', 'Rentalll', 3, 'jrentalll6@meetup.com', '34j80c', 'Mauris.tiff', 2),
 	('Estée', 'Salkeld', 'Kardos-Stowe', 3, 'mkardosstowe7@wordpress.com', '71g0S', 'AnteIpsum.tiff', 2),
 	('Angèle', 'Hearl', 'Cloughton', 3, 'hcloughton8@ftc.gov', '93u1eO', 'Eget.tiff', 2),
 	('Nadège', 'Puckey', 'Zanuciolii', 3, 'azanuciolii9@dion.ne.jp', '545kjR', 'GravidaNisi.tiff', 0),
 	('Dù', 'Brisker', 'Swinley', 3, 'tswinleya@ustream.tv', '31gfoG', 'OrciLuctus.jpeg', 0),
 	('Céline', 'Stanistreet', 'Syddie', 3, 'msyddieb@dyndns.org', '66gffqiZ', 'NullaQuisqueArcu.tiff', 0),
 	('Görel', 'Pllu', 'Buddock', 3, 'nbuddockc@census.gov', '70kfxL', 'Lacus.tiff', 0),
 	('Åsa', 'Ledger', 'Ciepluch', 3, 'kciepluchd@printfriendly.com', '66f6F', 'Eget.gif', 0),
 	('Judicaël', 'Bawles', 'Krzysztofiak', 3, 'kkrzysztofiake@parallels.com', 'sf52qL', 'Venenatisodales.tiff', 0);

	
INSERT INTO PROVINCIA (Id_provincia, Nombre)
VALUES
	(1,'San Jose'),
	(2,'Alajuela'),
	(3,'Cartago'),
	(4,'Heredia'),
	(5,'Guanacaste'),
	(6,'Puntarenas'),
	(7,'Limon');
	
	
INSERT INTO CLIENTE (Id_cliente, Telefono_movil, Id_provincia, Canton, Descripcion, Fecha_Inscripcion)
VALUES
	(2, '83855217', 1, 'Santa Ana', 'Me gustan los videojuegos y el futbol', '2019/6/6'),
	(3, '87546512', 3, 'Tres Rios', 'Me gusta el anime', '2019/5/6');
	
	
INSERT INTO PAGO_X_CLIENTE (Id_cliente, Metodo_pago)
VALUES
	(2, 'Efectivo'),
	(3, 'Efectivo');
	
	
INSERT INTO UNIVERSIDAD (Id_universidad, Nombre)
VALUES
	(1,'Instituto Tecnologico de Costa Rica'),
	(2,'Universidad de Costa Rica'),
	(3,'Universidad Nacional de Costa Rica');
	

INSERT INTO CUIDADOR (Id_cuidador, Carne, Telefono_movil, Id_universidad, Canton, Opcion_provincias, Descripcion, Fecha_Inscripcion)
VALUES
	(4,'03639362','76915363',1,'Acosta',false,'Avulsion of unspecified eye, initial encounter','2019/01/05'),
	(5,'57570007','81449714',2,'Alajuelita',false,'Burn of first deg mult sites of right ankle and foot','2019/04/10'),
	(6,'17477531','55097196',3,'Alvarado',true,'Disp fx of med cuneiform of l foot, subs for fx w nonunion','2019/03/08'),
	(7,'44076010','66445572',1,'Aserri',true,'Chronic embolism thrombosis of deep vein of r low extrem','2019/04/12'),
	(8,'07813317','89528557',2,'Atenas',true,'Parkinsons disease','2019/05/11'),
	(9,'21695624','99147992',3,'Barva',false,'Maternal care for unstable lie, fetus 5','2019/01/03'),
	(10,'01850074','54076307',1,'Belen',true,'Unspecified physeal fx phalanx of unspecified toe','2018/09/21'),
	(11,'52138200','08734887',2,'Cartago',true,'Disp fx of epiphy (separation) (upper) of r femur, sequela','2019/04/29'),
	(12,'51769411','66031775',3,'Curridabat',true,'Other specified disorders of adult personality behavior','2018/09/08'),
	(13,'59883821','25465498',1,'Desamparados',false,'Coma scale, eyes open, to pain, at hospital admission','2018/11/27'),
	(14,'10202751','23291508',2,'Escazu',false,'Open bite of right ear, sequela','2018/09/26'),
	(15,'49676572','59305243',3,'Flores',false,'Motorcycle rider injuredoth unsp transport accidents','2019/03/29'),
	(16,'06151341','92425250',1,'Grecia',false,'Sprain of right coracohumeral (ligament), initial encounter','2018/07/03'),
	(17,'61703341','94602679',2,'Heredia',false,'Acquired stenosis of nasolacrimal duct','2019/04/03'),
	(18,'44224000','33861177',3,'Limon',false,'Systemic sclerosis lung involvement','2018/12/04');


INSERT INTO PROVINCIA_X_CUIDADOR (Id_cuidador, Id_provincia)
VALUES
	(4,1),
	(5,1),
	(6,3),
	(6,1),
	(6,2),
	(7,1),
	(7,3),
	(8,2),
	(8,4),
	(9,4),
	(10,4),
	(10,2),
	(11,3),
	(11,1),
	(11,2),
	(12,1),
	(12,3),
	(13,1),
	(14,1),
	(15,4),
	(16,2),
	(17,4),
	(18,7);
	

INSERT INTO DISPONIBILIDAD_X_CUIDADOR (Id_cuidador, Fecha_hora_inicio, Fecha_hora_final)
VALUES
	(9,'2019/6/15 13:00:00', '2019/6/15 14:00:00'),
	(15,'2019/6/15 13:00:00', '2019/6/15 14:00:00'),
	(17,'2019/6/15 13:00:00', '2019/6/15 14:00:00'),
	(8,'2019/6/15 13:00:00', '2019/6/15 14:00:00'),
	(10,'2019/6/15 13:00:00', '2019/6/15 14:00:00');


INSERT INTO BADGE (Id_badge, Nombre)
VALUES
	(1,'50 Caminatas'),
	(2,'100 Caminatas'),
	(3,'500 Caminatas'),
	(4,'Buen Servicio');
	
/*
INSERT INTO BADGE_X_CUIDADOR(Id_cuidador, Id_badge)
VALUES
*/	

/*
INSERT INTO DENUNCIA (Id_denuncia, Id_cliente, Id_cuidador, Descripcion)
VALUES
*/


INSERT INTO TAMANO (Id_tamano, Nombre)
VALUES
	(1,'S'),
	(2,'M'),
	(3,'L'),
	(4,'XL');


INSERT INTO MASCOTA (Id_cliente, Nombre, Raza, Edad, Id_tamano, Descripcion, Fecha_inscripcion)
VALUES
	(2, 'Cookie', 'Pastor Aleman', 8, 4, 'Perro Bravo', '2019/6/6'),
	(3, 'Scooby', 'Gran Danes', 7, 4, 'Perro Juegueton', '2019/5/6');
	
INSERT INTO FOTO_X_MASCOTA (Id_mascota, Foto)
VALUES
	(1, 'fotocookie1.png'),
	(1, 'fotocookie2.png'),
	(2, 'fotoscooby1.png'),
	(2, 'fotoscooby2.png'),
	(2, 'fotoscooby3.png');

	
INSERT INTO SERVICIO (Id_servicio, Nombre, Precio)
VALUES
	(1,'Caminata', 30);
	
/*
INSERT INTO SOLICITUD (Hora_Inicio, Hora_Final, Duracion, Estado_solicitud, Precio_unitario, Id_cliente, Id_mascota, Id_servicio)
VALUES
*/

/*
INSERT INTO SOLICITUD_X_CUIDADOR (Id_solicitud, Id_cuidador, Calificacion, Metodo_pago, Direccion, Descripcion)
VALUES
*/

/*
INSERT INTO REPORTE (Cantidad_caca, Cantidad_orines, Cantidad_juegos, Distancia, Detalles, Id_solicitud)
VALUES
*/

/*
INSERT INTO FOTO_X_REPORTE (Id_reporte, Foto)
VALUES
*/

/*
SELECT * FROM ROL;
SELECT * FROM ESTADO;
SELECT * FROM USUARIO;
SELECT * FROM PROVINCIA;
SELECT * FROM CLIENTE;
SELECT * FROM PAGO_X_CLIENTE;
SELECT * FROM UNIVERSIDAD;
SELECT * FROM CUIDADOR;
SELECT * FROM PROVINCIA_X_CUIDADOR;
SELECT * FROM DISPONIBILIDAD_X_CUIDADOR;
SELECT * FROM BADGE;
SELECT * FROM BADGE_X_CUIDADOR;
SELECT * FROM DENUNCIA;
SELECT * FROM TAMANO;
SELECT * FROM MASCOTA;
SELECT * FROM FOTO_X_MASCOTA;
SELECT * FROM SERVICIO;
SELECT * FROM SOLICITUD;
SELECT * FROM SOLICITUD_X_CUIDADOR;
SELECT * FROM REPORTE;
SELECT * FROM FOTO_X_REPORTE;
*/