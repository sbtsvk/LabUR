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
    telefono VARCHAR(20),
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

ALTER TABLE cliente ADD COLUMN telefonoPrefijo VARCHAR(4);
ALTER TABLE cliente MODIFY COLUMN telefonoPrefijo VARCHAR(4) AFTER direccionCliente;

select * from mascota;

insert into mascota values(1,'G','M','Pitbull',1),(2,'Lalo','M','Criollo',1),(3,'Lola','F','Terrier',1);

insert into vacuna values(1,'Nobivac','2mL','Rabia'),(2,'Parvigen','1mL','Parvovirus/Moquillo'),(3,'Imovax','4mL','Rabia');

insert into mascota values(7,'Tony','M','French Poodle',1),(8,'Tony Grande','Samoyedo',1);

insert into mascota values(4,'Erebus','M','Labrador',1),(5,'Abraxas','M','Criollo',1),(6,'Gojira','F','Bull Terrier',1);

insert into cliente values(1,'Thomas','Neira','Carrera 76A #131-21','+57','3062342857',NULL),(2,'Amelia','Sabi','Carrera 5#12A-65','+57','3056852965',NULL),(3,'Antonio','Ayala','Diagonal 61C#22A-30','+57','3046842679',NULL);
 
select nombreMascota,generoMascota from mascota;

select cedulaCliente as 'Documento',direccionCliente 'Direccion' from cliente;

select cedulaCliente as 'Documento', idMascotaFK as 'Codigo mascota' from cliente order by nombreCliente asc; 

select nombreProducto from producto where precio =1000;

select vacuna from enfermedad where codigoVacunaFK =1000; 

select nombreVacuna,dosisVacuna from vacuna;

select * from vacuna where enfermedad = 'rabia';

select * from mascota where generoMascota = 'M' and cantidad = 1;

select nombreProducto from producto where precio between 1000 and 10000 ;








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
     
     
