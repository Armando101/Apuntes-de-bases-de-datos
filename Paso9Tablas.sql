create table PASAJERO (
	PASAJERO_ID int not null
	auto_incremet, 
	NOMBRE_P varchar(30) not null,
	PASAPORTE varchar(15),
	CONTACTOEMERGENCIA varchar(40) not null,
	primary key (PASAJERO_ID)
);

create table AEREOLINEA_PASAJERO (
	PASAJERO_ID int not null,
	AEREOLINEA_ID int not null, 
	VIAJEROFRECUENTE numeric(12,0),
	primary key (PASAJERO_ID,AEREOLINEA_ID)
);


#Generalmente cuando creamos las tablas se hacen con un orden especifico, si creamos primero Aerolinea_Pasajero, se va a referir a una tabla que no existe. Esto nos da un error de consistencia.
#Se recomienda hacer alter table, para cambiar los esquemas al final.

alter table AEREOLINEA_PASAJERO #Nos dice con que tabla vamos a trabajar, en este caso es AEREOLINEA_PASAJERO 
add constraint FK_AEREOLINEA_PASAJERO #Agregamos un constraint o regla de validación, y el nombre de ésta regla, en este caso la regla se llama FK_AEREOLINEA_PASAJERO
foreing key (PASAJERO_ID) #Esta regla va a ser una llave foranea de mi atributo PASAJERO_ID 
references PASAJERO (PASAJERO_ID); #Esta regla hace referencia a la tabla PASAJERO y que requiere un atributo específico que este caso es PASAJERO_ID