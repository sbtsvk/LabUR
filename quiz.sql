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

select * from mascota;

insert into mascota_vacuna values(1,1,'Rabia'),(1,2,'Rabia'),(1,3,'Rabia'),(1,4,'Rabia'),(2,1,'Moquillo'),(2,3,'Moquillo'),(2,2,'Moquillo');

insert into mascota values(1,'G','M','Pitbull',1),(2,'Lalo','M','Criollo',1),(3,'Lola','F','Terrier',1);

insert into vacuna values(1,'Nobivac','1mL','Rabia'),(2,'Parvigen','1mL','Parvovirus/Moquillo'),(3,'Imovax','1mL','Rabia');

insert into mascota values(7,'Tony','M','French Poodle',1),(8,'Tony Grande','Samoyedo',1);

insert into mascota values(4,'Erebus','M','Labrador',1),(5,'Abraxas','M','Criollo',1),(6,'Gojira','F','Bull Terrier',1);

describe cliente;
describe mascota;
describe vacuna;
describe producto;
describe mascota_vacuna;

insert into producto values(4,'Cepillo de cobre','Purina',2500,NULL),(5,'Bozal de mallón','SerPet',45000,NULL),(6,'Shampoo perfumado','VetPet',54000,NULL);

select cedulaCliente as 'Documento', nombreMascota as 'Mascota' from cliente, mascota where idMascotaFK = idMascota;

select nombreMascota as 'Mascota', mascota_vacuna.enfermedad as 'Vacunas aplicadas' from mascota, vacuna, mascota_vacuna where idMascota = idMascotaFK and codigoVacuna = codigoVacunaFk;

select nombreProducto as 'Producto', precio from producto where marca = 'SerPet' order by precio DESC;

select * from mascota where generoMascota like 'M';

select * from producto;

insert into cliente values(1,'Thomas','Neira','Carrera 76A #131-21','+57','3062342857',NULL),(2,'Amelia','Sabi','Carrera 5#12A-65','+57','3056852965',NULL),(3,'Antonio','Ayala','Diagonal 61C#22A-30','+57','3046842679',NULL);


