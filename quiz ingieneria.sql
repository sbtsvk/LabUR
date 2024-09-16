create database Mascotas;
use Mascotas;

create table mascota (
	idmascota int(11) primary key,
	nombremascota varchar(15),
	generomascota varchar(15),
	razamascota varchar(15),
	cantidad int(10)
    
);

create table producto (
	codigoproducto int(11) primary key,
    nombreproducto varchar(15),
    marca varchar(15),
    precio float,
    cedulaclientefk int(11),
	FOREIGN KEY (cedulaclientefk) REFERENCES cliente(cedulacliente)

);

create table mascota_vacuna (
	codigovacunafk int(11),
    idmascotafk int(11),
    enfermedad varchar(15),
	FOREIGN KEY (idmascotafk) REFERENCES mascota(idmascota),
	FOREIGN KEY (codigovacunafk) REFERENCES vacuna(codigovacuna)
);

create table vacuna (
	codigovacuna int(11) primary key,
    nombrevacuna varchar(15),
    dosisvacuna int(10),
    enfermedad varchar(15)

);

create table cliente (
	cedulacliente int(11) primary key,
    nombrecliente varchar(15),
    apellidocliente varchar(15),
    direccioncliente varchar(10),
    telefono int(10),
    idmascotafk int(11),
    FOREIGN KEY (idmascotafk) REFERENCES mascota(idMascota) 
);

alter table producto add column cantidad int not null;

alter table mascota change column cantidad cantidadmascota 

     
     
     
