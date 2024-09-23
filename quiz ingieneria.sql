CREATE DATABASE mascotas;
USE mascotas;

CREATE TABLE mascota
(
    idMascota INT(11) NOT NULL,
    nombreMascota VARCHAR(15),
    generoMascota VARCHAR(15),
    razaMascota VARCHAR(15),
    cantidad INT(10),
    PRIMARY KEY (idMascota)
);

CREATE TABLE cliente
(
    cedulaCliente INT(11) NOT NULL,
    nombreCliente VARCHAR(15),
    apellidoCliente VARCHAR(15),
    direccionCliente VARCHAR(15),
    telefonoPrefijo VARCHAR(4),
    telefono VARCHAR(20),
    idMascotaFK INT(10),
    PRIMARY KEY (cedulaCliente),
    FOREIGN KEY (idMascotaFK) REFERENCES mascota(idMascota)
);

CREATE TABLE producto
(
    codigoProducto INT(11) NOT NULL,
    nombreProducto VARCHAR(15),
    marca VARCHAR(15),
    precio FLOAT,
    cedulaClienteFK INT(11),
    PRIMARY KEY (codigoProducto),
    FOREIGN KEY (cedulaClienteFK) REFERENCES cliente(cedulaCliente)
);

CREATE TABLE producto_cliente
(
    codigoProductoFK INT(11) NOT NULL,
    cedulaClienteFK INT(11) NOT NULL,
    FOREIGN KEY (cedulaClienteFK) REFERENCES cliente(cedulaCliente),
    FOREIGN KEY (codigoProductoFK) REFERENCES producto(codigoProducto)
);

CREATE TABLE vacuna
(
    codigoVacuna INT(11) NOT NULL,
    nombreVacuna VARCHAR(15),
    dosisVacuna INT(10),
    enfermedad VARCHAR(15),
    PRIMARY KEY (codigoVacuna)
);

CREATE TABLE mascota_vacuna
(
    codigoVacunaFK INT(11),
    idMascotaFK INT(11),
    enfermedad VARCHAR(15),
    FOREIGN KEY (codigoVacunaFK) REFERENCES vacuna(codigoVacuna),
    FOREIGN KEY (idMascotaFK) REFERENCES mascota(idMascota)
);

-- Insert data into mascota
INSERT INTO mascota VALUES
(1,'G','M','Pitbull',1),
(2,'Lalo','M','Criollo',1),
(3,'Lola','F','Terrier',1),
(7,'Tony','M','French Poodle',1),
(4,'Erebus','M','Labrador',1),
(5,'Abraxas','M','Criollo',1),
(6,'Gojira','F','Bull Terrier',1);

-- Insert data into cliente
INSERT INTO cliente VALUES
(1,'Thomas','Neira','Carrera 76A #131-21','+57','3062342857',NULL),
(2,'Amelia','Sabi','Carrera 5#12A-65','+57','3056852965',NULL),
(3,'Antonio','Ayala','Diagonal 61C#22A-30','+57','3046842679',NULL);

-- Insert data into vacuna
INSERT INTO vacuna VALUES
(1,'Nobivac','2','Rabia'),
(2,'Parvigen','1','Parvovirus/Moquillo'),
(3,'Imovax','4','Rabia');

-- Queries
SELECT nombreMascota, generoMascota FROM mascota;

SELECT cedulaCliente AS 'Documento', direccionCliente AS 'Direccion' FROM cliente;

SELECT cedulaCliente AS 'Documento', idMascotaFK AS 'Codigo mascota' 
FROM cliente 
ORDER BY nombreCliente ASC; 

SELECT nombreProducto FROM producto WHERE precio = 1000;

SELECT nombreVacuna, dosisVacuna FROM vacuna;

SELECT * FROM vacuna WHERE enfermedad = 'Rabia';

SELECT * FROM mascota WHERE generoMascota = 'M' AND cantidad = 1;

SELECT nombreProducto FROM producto WHERE precio BETWEEN 1000 AND 10000;

-- TAREA: Búsqueda de patrones con LIKE y NOT LIKE en la tabla "mascota"

-- 1. Consulta usando LIKE
-- Buscar todas las mascotas cuyo nombre comience con la letra "L".
SELECT * 
FROM mascota 
WHERE nombreMascota LIKE 'L%';

-- 2. Consulta usando NOT LIKE
-- Buscar todas las mascotas cuyo nombre no contenga la letra "a".
SELECT * 
FROM mascota 
WHERE nombreMascota NOT LIKE '%a%';


