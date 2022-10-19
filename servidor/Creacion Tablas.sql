DROP TABLE IF EXISTS Carreras cascade ;
DROP TABLE IF EXISTS Eventos cascade ;
DROP TABLE IF EXISTS Usuarios cascade;
DROP TABLE IF EXISTS Sevicios cascade;
DROP TABLE IF EXISTS servicios_bus cascade;
DROP TABLE IF EXISTS Becas cascade;
DROP TABLE IF EXISTS Evento_Carrera cascade;
DROP TABLE IF EXISTS Tipo_Actividad cascade;
DROP TABLE IF EXISTS Actividad cascade;
DROP TABLE IF EXISTS Costes CASCADE ;
DROP TABLE IF EXISTS Admisiones CASCADE; 
DROP TABLE IF EXISTS Preguntas CASCADE; 
DROP TABLE IF EXISTS servicios CASCADE; 


create table Tipo_Actividad(
	id serial NOT NULL PRIMARY KEY,
	nombre text NOT NULL,
	Descripcion text NOT NULL
);

create table Actividad(
	id serial NOT NULL PRIMARY KEY,
	info json NOT NULL,
	id_Tipo_Actividad INT NOT NULL,
	CONSTRAINT fk_Tipo_Actividad
   FOREIGN KEY(id_Tipo_Actividad) 
   REFERENCES Tipo_Actividad(id)
);

create table Carreras(
	id serial NOT NULL PRIMARY KEY,
	info json NOT NULL
);

Create Table Servicios(
	id serial NOT NULL PRIMARY KEY,
	info json NOT NULL
);

Create Table Becas(
	id serial NOT NULL PRIMARY KEY,
	info json NOT NULL
);


Create Table servicios_bus(
	id serial NOT NULL PRIMARY KEY,
	info json NOT NULL
);


Create Table Costes(
	id serial NOT NULL PRIMARY KEY,
	info json NOT NULL
);

Create Table Admisiones(
	id serial NOT NULL PRIMARY KEY,
	info json NOT NULL
);

Create Table Preguntas(
	id serial NOT NULL PRIMARY KEY,
	info json NOT NULL
);



create table Usuarios(
	id serial NOT NULL PRIMARY KEY,
	nombre text NOT NULL,
	correo text NOT NULL UNIQUE,
	contrasena text NOT NULL,
	md5 text NOT NULL,
	admin boolean DEFAULT false	
);

create table Eventos(
	id serial NOT NULL PRIMARY KEY,
	fechaInicio DATE not NULL,
	fechaFIn DATE not NULL,
	Nombre TEXT NOT NULL,
	Descripcion TEXT NOT NULL,
	estododia BOOLEAN  NOT NULL
);

create table evento_carrera(
	id serial NOT NULL PRIMARY KEY,
	id_Evento INT NOT NULL,
	id_Carrera INT NOT NULL,
	
	CONSTRAINT fk_carrera
   FOREIGN KEY(id_carrera) 
   REFERENCES Carreras(id),
	
	CONSTRAINT fk_evento
   FOREIGN KEY(id_evento) 
   REFERENCES Eventos(id)
	
);


