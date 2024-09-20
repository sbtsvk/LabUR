create database mascotas;
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
    PRIMARY KEY (codigoProducto)
);

create table producto_cliente
(
	codigoProductoFK INT(11) NOT NULL,
    cedulaClienteFK INT(11) NOT NULL,
    FOREIGN KEY (cedulaClienteFK) REFERENCES cliente(cedulaCliente),
    FOREIGN KEY (codigoProductoFK) REFERENCES producto(codigoProducto)
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

select * from mascota;

insert into mascota values(1,'G','M','Pitbull',1),(2,'Lalo','M','Criollo',1),(3,'Lola','F','Terrier',1);

insert into vacuna values(1,'Nobivac','1mL','Rabia'),(2,'Parvigen','1mL','Parvovirus/Moquillo'),(3,'Imovax','1mL','Rabia');

insert into mascota values(4,'Erebus','M','Labrador',1),(5,'Abraxas','M','Criollo',1),(6,'Gojira','F','Bull Terrier',1);

insert into cliente values(1,'erebus','M','labrador',1);
describe cliente;

select nombreMascota,generoMascota from mascota;

select cedulaCliente as 'Documento',direccionCliente 'Direccion' from cliente;

select cedulaCliente as 'Documento', idMascotaFK as 'Codigo mascota' from cliente order by nombreCliente asc;
 
-- insert into cliente();

-- insert into producto values();

-- SELECT 
--     CONSTRAINT_NAME 
-- FROM 
--     information_schema.KEY_COLUMN_USAGE 
-- WHERE 
--     TABLE_NAME = 'producto' 
--     AND TABLE_SCHEMA = 'mascotas';
-- ALTER TABLE producto DROP FOREIGN KEY producto_ibfk_1;
-- ;
     
     
