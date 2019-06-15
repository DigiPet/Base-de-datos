INSERT INTO ROL (Nombre)
VALUES
	(1,'Administrador'),
	(2,'Cliente'),
	(3,'Cuidador');
	
INSERT INTO ESTADO (Nombre)
VALUES
	(1,'Activado'),
	(2,'Desactivado'),
	(3,'Bloqueado');
	
INSERT INTO PROVINCIA (Nombre)
VALUES
	(1,'San Jose'),
	(2,'Alajuela'),
	(3,'Cartago'),
	(4,'Heredia'),
	(5,'Guanacaste'),
	(6,'Puntarenas'),
	(7,'Limon');
	
INSERT INTO UNIVERSIDAD (Nombre)
VALUES
	(1,'Instituto Tecnologico de Costa Rica'),
	(2,'Universidad de Costa Rica'),
	(3,'Universidad Nacional de Costa Rica');

INSERT INTO BADGE (Nombre)
VALUES
	(1,'50 Caminatas'),
	(2,'100 Caminatas'),
	(3,'500 Caminatas'),
	(4,'Buen Servicio');
	
INSERT INTO TAMANO (Nombre)
VALUES
	(1,'S'),
	(2,'M'),
	(3,'L'),
	(4,'XL');
	
INSERT INTO SERVICIO (Nombre, Precio)
VALUES
	(1,'Caminata', 30);

SELECT * FROM ROL;
SELECT * FROM ESTADO;
SELECT * FROM PROVINCIA;
SELECT * FROM UNIVERSIDAD;
SELECT * FROM BADGE;
SELECT * FROM TAMANO;