/*SELECT * FROM USUARIO;
SELECT * FROM CLIENTE;
SELECT * FROM CUIDADOR;
SELECT * FROM PROVINCIA_X_CUIDADOR;
*/


/*Procedimiento para registrar un cliente*/
DROP PROCEDURE IF EXISTS REGISTRAR_CLIENTE;
DELIMITER //
CREATE PROCEDURE REGISTRAR_CLIENTE
	(IN Pnombre			VARCHAR(30),
	IN Papellido		VARCHAR(30),
	IN Sapellido		VARCHAR(30),
	IN	Iprovincia		VARCHAR(30),
	IN Ccanton			VARCHAR(30),
	IN Correo1			VARCHAR(30),
	IN Correo2			VARCHAR(30),
	IN Telefono			VARCHAR(10),
	IN Foto				VARCHAR(30),
	IN Ccontrasena		VARCHAR(8),
	IN Ddescripcion	VARCHAR(300),
	IN Fecha				DATE)
BEGIN
	INSERT INTO USUARIO (Primer_nombre, Primer_apellido, Segundo_apellido, Id_rol, Email_1, Contrasena, Foto_perfil, Id_estado)
	VALUES
		(Pnombre, Papellido, Sapellido, 2, Correo1, Ccontrasena, Foto, 0);

	SELECT @id_usuario := Id_usuario FROM USUARIO WHERE Email_1 = Correo1;
	SELECT @id_province := Id_provincia FROM PROVINCIA WHERE Nombre = Iprovincia;
	
	INSERT INTO CLIENTE (Id_cliente, Telefono_movil, Id_provincia, Canton, Email_2, Descripcion, Fecha_Inscripcion)
	VALUES
		(@id_usuario, Telefono, @id_province, Ccanton, Correo2, Ddescripcion, Fecha);
END //
DELIMITER;

CALL REGISTRAR_CLIENTE 
('Gustavo', 'Segura', 'Umana', 'Alajuela', 'Alajuela', 'correo1', 'correo2', '123', 'foto', 'contrena', 'descrip', '2019/5/5');
/*SELECT * FROM USUARIO;
SELECT * FROM CLIENTE;
*/


/*Procedimiento para insertar el metodo de pago de un cliente*/
DROP PROCEDURE IF EXISTS INSERTAR_PAGO_CLIENTE;
DELIMITER //
CREATE PROCEDURE INSERTAR_PAGO_CLIENTE
	(IN Icliente		INT,
	IN Pago				VARCHAR(30))
BEGIN
	INSERT INTO PAGO_X_CLIENTE (Id_cliente, Metodo_pago)
	VALUES
		(Icliente, Pago);
END //
DELIMITER;
/*
SELECT * FROM CLIENTE;*/
CALL INSERTAR_PAGO_CLIENTE (19, 'Efectivo');
/*SELECT * FROM PAGO_X_CLIENTE;
*/

/*Procedimiento para registrar un mascota*/
DROP PROCEDURE IF EXISTS REGISTRAR_MASCOTA;
DELIMITER //
CREATE PROCEDURE REGISTRAR_MASCOTA
	(IN Icliente		INT,
	IN Mnombre			VARCHAR(30),
	IN Rraza				VARCHAR(30),
	IN Eedad				INT,
	IN Ttamano			VARCHAR(2),
	IN Ddescripcion	VARCHAR(300),
	IN Fecha				DATE)
BEGIN
	SELECT @id_tam := Id_tamano FROM TAMANO WHERE Nombre = Ttamano;
	INSERT INTO MASCOTA (Id_cliente, Nombre, Raza, Edad, Id_tamano, Descripcion, Fecha_inscripcion)
	VALUES
		(Icliente, Mnombre, Rraza, Eedad, @id_tam, Ddescripcion, Fecha);
END //
DELIMITER;

/*
(2, 'Tara', 'Labrador', 8, 'L', 'Perro traidor', '2019/6/16');
SELECT * FROM MASCOTA;
CALL REGISTRAR_MASCOTA
SELECT @id_masc := Id_mascota FROM MASCOTA WHERE Id_cliente = 2 AND Nombre = 'Tara';
*/

/*Procedimiento para insertar foto de mascota*/
DROP PROCEDURE IF EXISTS INSERTAR_FOTO_MASCOTA;
DELIMITER //
CREATE PROCEDURE INSERTAR_FOTO_MASCOTA
	(IN Imascota		INT,
	IN Foto_masc		VARCHAR(30))
BEGIN
	INSERT INTO FOTO_X_MASCOTA (Id_mascota, Foto)
	VALUES
		(Imascota, Foto_masc);
END //
DELIMITER;
/*
CALL INSERTAR_FOTO_MASCOTA (2, 'fotoscooby4.png');
SELECT * FROM FOTO_X_MASCOTA;
*/

/*Procedimiento para registrar un cuidador*/
DROP PROCEDURE IF EXISTS REGISTRAR_CUIDADOR;
DELIMITER //
CREATE PROCEDURE REGISTRAR_CUIDADOR
	(IN Pnombre			VARCHAR(30),
	IN Papellido		VARCHAR(30),
	IN Sapellido		VARCHAR(30),
	IN Ccanton			VARCHAR(30),
	IN Iuniversidad	VARCHAR(50),
	IN Ccarne			VARCHAR(10),
	IN Correo1			VARCHAR(30),
	IN Correo2			VARCHAR(30),
	IN Telefono			VARCHAR(10),
	IN Foto				VARCHAR(30),
	IN Ccontrasena		VARCHAR(8),
	IN Ddescripcion	VARCHAR(300),
	IN Op_provincia	BOOLEAN,
	IN Fecha				DATE)
BEGIN
	INSERT INTO USUARIO (Primer_nombre, Primer_apellido, Segundo_apellido, Id_rol, Email_1, Contrasena, Foto_perfil, Id_estado)
	VALUES
		(Pnombre, Papellido, Sapellido, 3, Correo1, Ccontrasena, Foto, 0);
		
	SELECT @id_user := Id_usuario FROM USUARIO WHERE Email_1 = Correo1;
	SELECT @id_univer := Id_universidad FROM UNIVERSIDAD WHERE Nombre = Iuniversidad;

		
	INSERT INTO CUIDADOR (Id_cuidador, Carne, Telefono_movil, Id_universidad, Canton, Opcion_provincias, Email_2, Descripcion, Fecha_Inscripcion)
	VALUES
		(@Id_user, CCarne, Telefono, @id_univer, CCanton, Op_provincia, Correo2, Ddescripcion, Fecha);
END //
DELIMITER;
/*
CALL REGISTRAR_CUIDADOR
('Andres', 'Ramirez', 'Quiros', 'Alajuela', 'Alajuela', 'Instituto Tecnologico de Costa Rica', '2016', 'correo10', 'correo2', '123', 'foto', 'contra', 'descrip', 1, '2019/5/5');
SELECT * FROM USUARIO;
SELECT * FROM CUIDADOR;
SELECT @id_cuidador := Id_usuario FROM USUARIO WHERE Email_1 = 'correo10';
*/



/*Procedimiento para insertar una provincia de un cuidador*/
DROP PROCEDURE IF EXISTS INSERTAR_PROVINCIA_CUIDADOR;
DELIMITER //
CREATE PROCEDURE INSERTAR_PROVINCIA_CUIDADOR
	(IN Icuidador		INT,
	IN Iprovincia		VARCHAR(30))
BEGIN
	SELECT @id_provincia := Id_provincia FROM PROVINCIA WHERE Nombre = Iprovincia;
	INSERT INTO PROVINCIA_X_CUIDADOR (Id_cuidador, Id_provincia)
	VALUES
		(Icuidador,@id_provincia);
END //
DELIMITER;
/*
SELECT * FROM CUIDADOR;
SELECT * FROM PROVINCIA_X_CUIDADOR;
CALL INSERTAR_PROVINCIA_CUIDADOR (7, 'Alajuela');
SELECT * FROM PROVINCIA_X_CUIDADOR;
*/
	
/*Procedimiento para insertar una disponibilidad para un cuidador*/
DROP PROCEDURE IF EXISTS INSERTAR_DISPONIBILIDAD;
DELIMITER //
CREATE PROCEDURE INSERTAR_DISPONIBILIDAD
	(IN IDcuidador INT,
	IN Horainicial DATETIME,
	IN Horafinal 	DATETIME)
BEGIN

	SELECT @cont := COUNT(1) FROM DISPONIBILIDAD_X_CUIDADOR WHERE (Id_cuidador = IDcuidador) AND (NOT(Horafinal < Fecha_hora_inicio OR Horainicial > Fecha_hora_final)); 
	
	IF @cont >= 1 THEN
		SELECT @h_max :=  MAX(Fecha_hora_final) FROM DISPONIBILIDAD_X_CUIDADOR WHERE (Id_cuidador = IDcuidador) AND (NOT(Horafinal < Fecha_hora_inicio OR Horainicial > Fecha_hora_final));
		SELECT @minimo := MIN(Fecha_hora_inicio) FROM DISPONIBILIDAD_X_CUIDADOR WHERE (Id_cuidador = IDcuidador)  AND (NOT(Horafinal < Fecha_hora_inicio OR Horainicial > Fecha_hora_final));
		
		SELECT @max2 := IF(@h_max>Horafinal, @h_max, Horafinal);
		SELECT @min2 := IF(@minimo>Horainicial, Horainicial, @minimo);
		
		DELETE FROM DISPONIBILIDAD_X_CUIDADOR WHERE Id_cuidador = 9 AND (NOT(Horafinal < Horainicial OR Horainicial > Fecha_hora_final));
		INSERT INTO DISPONIBILIDAD_X_CUIDADOR (Id_cuidador, Fecha_hora_inicio, Fecha_hora_final) VALUES ( IDcuidador,@min2, @max2 );
	ELSE
		INSERT INTO DISPONIBILIDAD_X_CUIDADOR (Id_cuidador, Fecha_hora_inicio, Fecha_hora_final) VALUES ( IDcuidador,Horainicial, Horafinal);
	END IF;
END //
DELIMITER;
/*
SELECT * FROM USUARIO;
SELECT * FROM DISPONIBILIDAD_X_CUIDADOR;*/
CALL INSERTAR_DISPONIBILIDAD(9, '2019/6/15 7:30:00','2019/6/15 8:30:00');
CALL INSERTAR_DISPONIBILIDAD(9,'2019/6/15 13:30:00','2019/6/15 15:30:00');
CALL INSERTAR_DISPONIBILIDAD(9, '2019/6/15 8:00:00','2019/6/15 14:00:00');
CALL INSERTAR_DISPONIBILIDAD(9, '2019/6/15 8:00:00','2019/6/15 14:00:00');

/*Procedimiento para insertar un badge de un cuidador*/
DROP PROCEDURE IF EXISTS INSERTAR_BADGE_CUIDADOR;
DELIMITER //
CREATE PROCEDURE INSERTAR_BADGE_CUIDADOR
	(IN Icuidador		INT,
	IN Ibadge			INT)
BEGIN
	INSERT INTO BADGE_X_CUIDADOR (Id_cuidador, Id_badge)
	VALUES
		(Icuidador,Ibadge);
END //
DELIMITER;
/*
SELECT * FROM BADGE;
SELECT * FROM BADGE_X_CUIDADOR;
CALL INSERTAR_BADGE_CUIDADOR(4,1);
*/
/*Procedimiento para insertar una denuncia*/
DROP PROCEDURE IF EXISTS INSERTAR_DENUNCIA;
DELIMITER //
CREATE PROCEDURE INSERTAR_DENUNCIA
	(IN Icliente		INT,
	IN Icuidador		INT,
	IN Ddescripcion	VARCHAR(300))
BEGIN
	INSERT INTO DENUNCIA (Id_cliente, Id_cuidador, Descripcion)
	VALUES
		(Icliente,Icuidador,Ddescripcion);
END //
DELIMITER;
/*
SELECT * FROM CLIENTE;
SELECT * FROM CUIDADOR;
CALL INSERTAR_DENUNCIA(2,5,'Cuidador sospechoso');
SELECT * FROM DENUNCIA;
*/

/*Procedimiento para insertar una solicitud*/
DROP PROCEDURE IF EXISTS INSERTAR_SOLICITUD;
DELIMITER //
CREATE PROCEDURE INSERTAR_SOLICITUD
	(IN FHora_inicio	DATETIME,
	IN FHora_final		DATETIME,
	IN Dduracion		INT,
	IN Esolicitud		VARCHAR(10),
	IN Precio			DECIMAL,
	IN Icliente			INT,
	IN Imascota			INT,
	IN Iservicio		INT)
BEGIN
	INSERT INTO SOLICITUD (Hora_Inicio, Hora_Final, Duracion, Estado_solicitud, Precio_unitario, Id_cliente, Id_mascota, Id_servicio)
	VALUES
		(FHora_inicio,FHora_final,Dduracion,Esolicitud,Precio,Icliente,Imascota,Iservicio);
END //
DELIMITER;
/*
SELECT * FROM CLIENTE;
SELECT * FROM MASCOTA;
SELECT * FROM SERVICIO;*/
CALL INSERTAR_SOLICITUD ('2019/6/16 13:00:00', '2019/6/16 14:00:00', 1, 'Pendiente', 120.0, 2, 1, 1); 
CALL INSERTAR_SOLICITUD ('2019/6/16 13:30:00', '2019/6/16 14:30:00', 1, 'Pendiente', 120.0, 2, 1, 1);
CALL INSERTAR_SOLICITUD ('2019/6/16 12:30:00', '2019/6/16 15:00:00', 1, 'Pendiente', 120.0, 2, 1, 1); 
CALL INSERTAR_SOLICITUD ('2019/6/16 13:00:00', '2019/6/16 14:00:00', 1, 'Pendiente', 120.0, 2, 1, 1); 
CALL INSERTAR_SOLICITUD ('2019/6/16 13:00:00', '2019/6/16 14:00:00', 1, 'Pendiente', 120.0, 2, 1, 1); 
SELECT * FROM SOLICITUD;


INSERT INTO SOLICITUD_X_CUIDADOR (Id_solicitud, Id_cuidador, Calificacion, Metodo_pago, Direccion, Descripcion)
VALUES
	(1, 9, 4.0, 'Efectivo', 'Dir', 'Descrip'),
	(2, 9, 4.0, 'Efectivo', 'Dir', 'Descrip'),
	(3, 9, 4.0, 'Efectivo', 'Dir', 'Descrip'),
	(4, 10, 4.0, 'Efectivo', 'Dir', 'Descrip');
/*
SELECT * FROM SOLICITUD;
SELECT * FROM SOLICITUD_X_CUIDADOR;
*/
/*Procedimiento para asignar una solicitud a un cuidador*/
DROP PROCEDURE IF EXISTS ASIGNAR_SOLICITUD_CUIDADOR
DELIMITER //
CREATE PROCEDURE ASIGNAR_SOLICITUD_CUIDADOR 
	(IN Idprovincia		INT,
	IN S_hora_inicial		DATETIME,
	IN S_hora_final		DATETIME,
	IN Isolicitud			INT,
	IN Calif					DECIMAL,
	IN Pago					VARCHAR(30),
	IN Dir					VARCHAR(300),
	IN Descrip				VARCHAR(300))
BEGIN
	SELECT @id_user := Id_usuario 
	FROM USUARIO INNER JOIN CUIDADOR ON CUIDADOR.Id_cuidador = USUARIO.Id_usuario
					 INNER JOIN PROVINCIA_X_CUIDADOR ON PROVINCIA_X_CUIDADOR.Id_cuidador = CUIDADOR.Id_cuidador
					 INNER JOIN DISPONIBILIDAD_X_CUIDADOR ON DISPONIBILIDAD_X_CUIDADOR.Id_cuidador = CUIDADOR.Id_cuidador
					 WHERE (Id_rol = 3 AND Id_estado != 2)
					 	AND ((CUIDADOR.Opcion_provincias = 0 OR CUIDADOR.Opcion_provincias = 1) AND PROVINCIA_X_CUIDADOR.Id_provincia = Idprovincia)
					 	AND (DISPONIBILIDAD_X_CUIDADOR.Fecha_hora_inicio <= S_hora_inicial) 
				 		OR (DISPONIBILIDAD_X_CUIDADOR.Fecha_hora_final >= S_hora_final)
	LIMIT 1;
	INSERT INTO SOLICITUD_X_CUIDADOR (Id_solicitud, Id_cuidador, Calificacion, Metodo_pago, Direccion, Descripcion)
	VALUES
	(Isolicitud,@id_user,Calif,Pago,Dir,Descrip);			  
END //
DELIMITER;

CALL ASIGNAR_SOLICITUD_CUIDADOR(4, '2019-06-16 13:00:00', '2019-06-16 14:00:00', 5, 4.0, 'Efectivo','Dir','Descrip');


/*
 	SELECT Id_cuidador FROM SOLICITUD_X_CUIDADOR 
			 INNER JOIN SOLICTUD ON SOLICITUD_X_CUIDADOR.Id_solicitud = SOLICITUD.Id_solicitud
			 WHERE (NOT(FHora_final < Hora_Inicio OR FHora_inicio > Hora_final)) 
*/
			
/*Procedimiento para insertar un reporte*/
DROP PROCEDURE IF EXISTS INSERTAR_REPORTE;
DELIMITER //
CREATE PROCEDURE INSERTAR_REPORTE
	(
	IN Duration		DECIMAL,
	IN Caca			INT,
	IN Orines		INT,
	IN Juegos		INT,
	IN Distance		DECIMAL,
	IN	Details		VARCHAR(300),
	IN Isolicitud	INT)
BEGIN
	INSERT INTO REPORTE (Duracion, Cantidad_caca, Cantidad_orines, Cantidad_juegos, Distancia, Detalles, Id_solicitud)
	VALUES
		(Duration, Caca, Orines, Juegos, Distance, Details, Isolicitud);
END //
DELIMITER;
/*
SELECT * FROM SOLICITUD;
CALL INSERTAR_REPORTE (1,1,3,5,5,'Muerde a los demas perros', 1);
SELECT * FROM REPORTE;
SELECT @id_report = Id_reporte FROM REPORTE WHERE Id_solicitud = 1;
*/

/*Procedimiento para insertar una foto de un reporte*/
DROP PROCEDURE IF EXISTS INSERTAR_FOTO_REPORTE;
DELIMITER //
CREATE PROCEDURE INSERTAR_FOTO_REPORTE
	(IN Ireporte		INT,
	IN Foto_reporte	VARCHAR(30))
BEGIN
	INSERT INTO FOTO_X_REPORTE (Id_reporte, Foto)
	VALUES
		(Ireporte, Foto_reporte);
END //
DELIMITER;
/*
SELECT * FROM REPORTE;
CALL INSERTAR_FOTO_REPORTE (1, 'fotoreporte1.png');
SELECT * FROM FOTO_X_REPORTE;
*/


