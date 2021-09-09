/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     8/9/2021 19:18:41                            */
/*==============================================================*/


drop index RELATIONSHIP_2_FK;

drop index RELATIONSHIP_1_FK;

drop index ALQUILER_PK;

drop table ALQUILER;

drop index CLIENTE_PK;

drop table CLIENTE;

drop index PELICULA_PK;

drop table PELICULA;

/*==============================================================*/
/* Table: ALQUILER                                              */
/*==============================================================*/
create table ALQUILER (
   IDALQUILER           INT4                 not null,
   IDPELICULA           INT4                 null,
   IDCLIENTE            INT4                 null,
   FECHAPRESTAMO        DATE                 null,
   FECHAENTREGA         DATE                 null,
   VALOR                DECIMAL(8,2)         null,
   constraint PK_ALQUILER primary key (IDALQUILER)
);

/*==============================================================*/
/* Index: ALQUILER_PK                                           */
/*==============================================================*/
create unique index ALQUILER_PK on ALQUILER (
IDALQUILER
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_1_FK on ALQUILER (
IDPELICULA
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_2_FK on ALQUILER (
IDCLIENTE
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   IDCLIENTE            INT4                 not null,
   CEDULACLIENTE        VARCHAR(10)          null,
   NOMBRESCLIENTE       VARCHAR(20)          null,
   APELLIDOSCLIENTE     VARCHAR(20)          null,
   FECHAREGISTROCLIENTE DATE                 null,
   constraint PK_CLIENTE primary key (IDCLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
IDCLIENTE
);

/*==============================================================*/
/* Table: PELICULA                                              */
/*==============================================================*/
create table PELICULA (
   IDPELICULA           INT4                 not null,
   NOMBREPELICULA       VARCHAR(30)          null,
   ANNIO_ESTRENO        INT4                 null,
   constraint PK_PELICULA primary key (IDPELICULA)
);

/*==============================================================*/
/* Index: PELICULA_PK                                           */
/*==============================================================*/
create unique index PELICULA_PK on PELICULA (
IDPELICULA
);

alter table ALQUILER
   add constraint FK_ALQUILER_RELATIONS_PELICULA foreign key (IDPELICULA)
      references PELICULA (IDPELICULA)
      on delete restrict on update restrict;

alter table ALQUILER
   add constraint FK_ALQUILER_RELATIONS_CLIENTE foreign key (IDCLIENTE)
      references CLIENTE (IDCLIENTE)
      on delete restrict on update restrict;

