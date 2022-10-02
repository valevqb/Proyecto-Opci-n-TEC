DROP TABLE IF EXISTS Carreras cascade ;
DROP TABLE IF EXISTS Eventos cascade ;
DROP TABLE IF EXISTS Usuarios cascade;
DROP TABLE IF EXISTS Sevicios cascade;
DROP TABLE IF EXISTS Becas cascade;
DROP TABLE IF EXISTS Evento_Carrera cascade;
DROP TABLE IF EXISTS Tipo_Actividad cascade;
DROP TABLE IF EXISTS Actividad cascade;
DROP TABLE IF EXISTS Costes CASCADE ;

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

Create Table Sevicios(
	id serial NOT NULL PRIMARY KEY,
	info json NOT NULL
);

Create Table Becas(
	id serial NOT NULL PRIMARY KEY,
	info json NOT NULL
);


Create Table Costes(
	id serial NOT NULL PRIMARY KEY,
	info json NOT NULL
);


create table Usuarios(
	id serial NOT NULL PRIMARY KEY,
	nombre text NOT NULL,
	apellido text NOT NULL,
	id_carrera int,
	correo text NOT NULL,
	contrasena text NOT NULL,
	md5 text NOT NULL,
	
	CONSTRAINT fk_carrera
   FOREIGN KEY(id_carrera) 
   REFERENCES Carreras(id)
	
);

create table Eventos(
	id serial NOT NULL PRIMARY KEY,
	fecha DATE not NULL,
	Nombre TEXT NOT NULL,
	Descripcion TEXT NOT NULL
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


INSERT INTO CARRERAS(info)
values('{ 
	"Acreditacion": "Carrera que cumple con los requisitos de calidad establecidos por el Sistema Nacional de Acreditación de la Educación Superior (SINAES).", 
	"Cortes": {"2015":"650","2016":"660","2017":"670","2018":"651.4"},
	"Descripcion": "Tiene como énfasis lograr un máximo rendimiento de la tecnología de información en las actividades comerciales, administrativas e industriales. Busca la solución más eficaz y eficiente de problemas de diversas índoles mediante la investigación sobre los diferentes métodos y estructuras de programación, para el diseño y desarrollo de software e infraestructura de tecnologías digitales.", 
	"Habilidades": ["Interpretación y resolución de problemas de software",
					"Razonamiento lógico matemático",
					"Trabajo en equipo",
					"Trabajar por objetivos Comunicación efectiva Creatividad y Proactividad"
					],
	"Horario":"Diurno",
	"Intereses":[	"Comunicaciones entre equipos de computación",
					"Resolver problemas lógico-matemáticos",
					"Solución de problemas cotidianos",
					"Manejo de bases de datos",
					"Seguridad computacional",
					"Innovación tecnológica"
				],
	"Nombre":"Ingeniería en Computación",
	"Sede" :"Cartago, San José, San Carlos, Limón y Alajuela",
	"IMG" :"https://reqres.in/img/faces/1-image.jpg"		

}');
INSERT INTO CARRERAS(info)
values(
'{ 
	"Acreditacion": "Carrera que cumple con los requisitos de calidad establecidos por el Sistema Nacional de Acreditación de la Educación Superior (SINAES).", 
	"Cortes": {"2015":"650","2016":"660","2017":"670","2018":"651.4"},
	"Descripcion": "Área de la ingeniería que planea, diseña, implementa y optimiza los sistemas de manufactura de bienes y servicios, por cuales fluyen productos e información mediante la integración de personas, materiales, equipos, tecnología y energía, buscando obtener la máxima productividad.", 
	"Habilidades": ["Interpretación y resolución de problemas de software",
					"Razonamiento lógico matemático",
					"Trabajo en equipo",
					"Trabajar por objetivos Comunicación efectiva Creatividad y Proactividad"
					],
	"Horario":"Diurno",
	"Intereses":[	"Comunicaciones entre equipos de computación",
					"Resolver problemas lógico-matemáticos",
					"Solución de problemas cotidianos",
					"Manejo de bases de datos",
					"Seguridad computacional",
					"Innovación tecnológica"
				],
	"Nombre":"Ingeniería en Producción Industrial",
	"Sede" :"Cartago,  San Carlos",
	"IMG" :"https://reqres.in/img/faces/1-image.jpg"		

}')

