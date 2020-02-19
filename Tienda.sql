drop table if exists CARRITO;
drop table if exists CARRITO_ITEM;
drop table if exists CLIENTE;
drop table if exists ITEM;
drop table if exists ITEM_PROVEEDOR;
drop table if exists MCOMPRA;
drop table if exists MPAGO;
drop table if exists PROVEEDOR;

/*==============================*/
/*		Table: CARRITO 			*/
/*==============================*/

create table CARRITO (
	CARRITO_ID	int	NOT NULL auto_incremet,
	CLIENTE_ID int NOT NULL, 
	CLIENTE_CUENTA varchar(60)	NOT NULL, 
	mPAGO_ID	int NOT NULL,
	mCOMPRA_COD	numeric(15,0) NOT NULL,
	CARRITO_numItem numeric(3,0) NOT NULL,
	CARRITO_Dir	varchar(120),
	CARRITO_Coment, varchar(300),
	CARRITO_Tag	varchar(100),
	primary key (CARRITO_ID)
);

/*==============================*/
/*		Table: CLIENTE 			*/
/*==============================*/

create table CLIENTE (
	CLIENTE_ID	int(10) NOT NULL auto_incremet,
	CLIENTE_CUENTA	varchar(60)	NOT NULL,
	CLIENTE_NOMBRE	varchar(80) NOT NULL,
	CLIENTE_FechaIni varchar(80) NOT NULL, 
	CLIENTE_CORREO varchar(60),
	CLIENTE_FechaNac	timestamp, 
	CLIENTE_PREFERENCIAS	varchar(300), 
	primary key(CARRITO_ID, CLIENTE_CUENTA)
);

/*==============================*/
/*		Table: carrito_item		*/
/*==============================*/

create table carrito_item (
	ITEM_ID	int NOT NULL, 
	CARRITO_ID int NOT NULL, 
	Cantidad numeric(3,0), NOT NULL,
	primary key (ITEM_ID, CARRITO_ID)
);

/*==============================*/
/*		Table: ITEM 			*/
/*==============================*/

create table ITEM (
	ITEM_ID int not null auto_increment,
	ITEM_NOMBRE varchar(60) not null,
	ITEM_DESC varchar(300) not null,
	ITEM_MEDIDAS varchar(60) not null,
	ITEM_PESO varchar(15) not null,
	ITEM_FOTO longblob,
	primary key (ITEM_ID)
);

/*==============================*/
/*		Table: ITEM_PROVEEDOR	*/
/*==============================*/

create table ITEM_PROVEEDOR (
	PROV_ID numeric(5, 0) not null,
	PROV_CODCC varchar(15) not null comment 'CODIGO CAMARA DE COMERCIO',
	ITEM_ID int not null,
	LOTE varchar(10) not null,
	primary key (PROV_ID, PROV_CODCC, ITEM_ID)
);

/*==============================*/
/*		Table: MCOMPRA 			*/
/*==============================*/

create table MCOMPRA (
	MCOMPRA_ID int not null auto_increment,
	MCOMPRA_COD numeric(15, 0) not null,
	MCOMPRA_METODO varchar(250) not null,
	MCOMPRA_FECHAINI timestamp not null,
	MCOMPRA_DIR varchar(120),
	primary key (MCOMPRA_ID, MCOMPRA_COD)
);

/*==============================*/
/*		Table: MPAGO 			*/
/*==============================*/

create table MPAGO (
	MPAGO_ID int not null auto_increment,
	MPAGO_TIPO varchar(250) not null,
	MPAGO_CODPASARELA varchar(15) not null,
	MPAGO_STATUS varchar(10) not null,
	MPAGO_FECHAEXPIRA timestamp not null,
	primary key (MPAGO_ID)
);

/*==============================*/
/*		Table: PROVEEDOR		*/
/*==============================*/

create table PROVEEDOR (
	PROV_ID numeric(5, 0) not null,
	PROV_CODCC varchar(15) not null comment 'CODIGO CAMARA DE COMERCIO',
	PROV_NOMBRE varchar(90) not null,
	PROV_DESC varchar(300) not null,
	PROV_FECHAINI timestamp not null,
	PROV_FECHAUCOMPRA timestamp,
	PROV_MONTOUCOMPRA numeric(7, 0),
	PROV_MONEDA varchar(5),
	primary key (PROV_ID, PROV_CODCC)
);

alter table CARRITO add constraint FK_Carrito_Cliente foreing key (
CLIENTE_ID, CLIENTE_CUENTA) references CLIENTE (CLIENTE_ID, CLIENTE_CUENTA)
on delete restrict on update restrict;

--Alterar la tabla carrito agregando un constraint (regla) el cual se va a llamar 
--FK_FK_Carrito_Cliente, esta regla va a ser de tipo foreing key, y vamos a ocupar los atributos
--CLIENTE_ID y CLIENTE_CUENTA de nuestra tabla CARRITO
--Estos atributos los vas a obtener de la tabla CLIENTE (referencia)
--En la tabla CLIENTE vas a encontrar los atributos CLIENTE_ID, CLIENTE_CUENTA.
