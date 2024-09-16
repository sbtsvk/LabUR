use mascotas;

create table mascota
(
	idMascota INT(11) NOT NULL,
    nombreMascota VARCHAR(15),
    generoMascota VARCHAR(15),
    razaMascota VARCHAR(15),
    cantidad INT(10),
    PRIMARY KEY (idMascota)
);

create table cliente
(
	cedulaCliente INT(11) NOT NULL,
    nombreCliente VARCHAR(15),
    apellidoCliente VARCHAR(15),
    direccionCliente VARCHAR(15),
    telefono INT(10),
    idMascotaFK INT(10),
    PRIMARY KEY (cedulaCliente),
    FOREIGN KEY (idMascotaFK) REFERENCES mascota(idMascota)
);

create table producto
(
	codigoProducto INT(11) NOT NULL,
    nombreProducto VARCHAR(15),
    marca VARCHAR(15),
    precio FLOAT,
    cedulaClienteFK INT(11),
    PRIMARY KEY (codigoProducto),
    FOREIGN KEY (cedulaClienteFK) REFERENCES cliente(cedulaCliente)
);

create table vacuna
(
	codigoVacuna INT(11) NOT NULL,
    nombreVacuna VARCHAR(15),
    dosisVacuna INT(10),
    enfermedad VARCHAR(15),
    PRIMARY KEY (codigoVacuna)
);

create table mascota_vacuna
(
	codigoVacunaFK INT(11),
    idMascotaFK INT(11),
    enfermedad VARCHAR(15),
    FOREIGN KEY (codigoVacunaFK) REFERENCES vacuna(codigoVacuna),
    FOREIGN KEY (idMascotaFK) REFERENCES mascota(idMascota)
);

ALTER TABLE mascota
RENAME COLUMN cantidad TO cantidadMascota;
