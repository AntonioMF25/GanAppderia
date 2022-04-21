-- Group [Group]
create table "public"."group" (
   "oid"  int4  not null,
   "groupname"  varchar(255),
  primary key ("oid")
);


-- Module [Module]
create table "public"."module" (
   "oid"  int4  not null,
   "moduleid"  varchar(255),
   "modulename"  varchar(255),
  primary key ("oid")
);


-- User [User]
create table "public"."user" (
   "oid"  int4  not null,
   "username"  varchar(255),
   "password"  varchar(255),
   "email"  varchar(255),
   "fechaalta"  date,
  primary key ("oid")
);


-- HistoricoPromociones [ent1]
create table "public"."historicopromociones" (
   "oid"  int4  not null,
   "tiempodias"  int4,
   "descripcionpromocion"  text,
   "nombrepromocion"  varchar(255),
   "porcentaje"  int4,
   "fechahistorico"  date,
  primary key ("oid")
);


-- Factura [ent10]
create table "public"."factura" (
   "oid"  int4  not null,
   "importetotal"  float8,
   "fechacompra"  timestamp,
   "ahorrototal"  float8,
  primary key ("oid")
);


-- Lineas Factura [ent11]
create table "public"."lineas_factura" (
   "oid"  int4  not null,
   "nombreproducto"  varchar(255),
   "precioproducto"  float8,
   "cantidadproducto"  int4,
   "preciototalproducto"  float8,
   "ahorrototalproducto"  float8,
   "oid_producto"  int4,
  primary key ("oid")
);


-- Ubicacion [ent2]
create table "public"."ubicacion" (
   "oid"  int4  not null,
   "nombreubicacion"  varchar(255),
   "descripcionubicacion"  text,
   "coordenadasubicacion"  varchar(255),
  primary key ("oid")
);


-- Productos [ent4]
create table "public"."productos" (
   "oid"  int4  not null,
   "nombreproducto"  varchar(255),
   "descripcionproducto"  text,
   "precioproducto"  float8,
   "unidadesproducto"  int4,
   "imagenproducto"  varchar(255),
   "fechacaducidad"  date,
   "valoracionmedia"  float8,
   "urlqr"  varchar(255),
  primary key ("oid")
);


-- Promociones [ent5]
create table "public"."promociones" (
   "oid"  int4  not null,
   "tiempodias"  int4,
   "porcentaje"  int4,
   "nombrepromocion"  varchar(255),
   "descripcionpromocion"  text,
  primary key ("oid")
);


-- HistoricoUser [ent7]
create table "public"."historicouser" (
   "oid"  int4  not null,
   "username"  varchar(255),
   "password"  varchar(255),
   "email"  varchar(255),
   "rol"  varchar(255),
   "fechaalta"  date,
   "fechahistorico"  date,
   "oid_usuarioantiguo"  int4,
  primary key ("oid")
);


-- Categoria [ent8]
create table "public"."categoria" (
   "oid"  int4  not null,
   "nombrecategoria"  varchar(255),
  primary key ("oid")
);


-- Valoracion [ent9]
create table "public"."valoracion" (
   "oid"  int4  not null,
   "comentario"  text,
   "puntuacion"  int4,
  primary key ("oid")
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table "public"."group"  add column  "module_oid"  int4;
alter table "public"."group"   add constraint fk_group_module foreign key ("module_oid") references "public"."module" ("oid");


-- Group_Module [Group2Module_Module2Group]
create table "public"."group_module" (
   "group_oid"  int4 not null,
   "module_oid"  int4 not null,
  primary key ("group_oid", "module_oid")
);
alter table "public"."group_module"   add constraint fk_group_module_group foreign key ("group_oid") references "public"."group" ("oid");
alter table "public"."group_module"   add constraint fk_group_module_module foreign key ("module_oid") references "public"."module" ("oid");


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "public"."user"  add column  "group_oid"  int4;
alter table "public"."user"   add constraint fk_user_group foreign key ("group_oid") references "public"."group" ("oid");


-- User_Group [User2Group_Group2User]
create table "public"."user_group" (
   "user_oid"  int4 not null,
   "group_oid"  int4 not null,
  primary key ("user_oid", "group_oid")
);
alter table "public"."user_group"   add constraint fk_user_group_user foreign key ("user_oid") references "public"."user" ("oid");
alter table "public"."user_group"   add constraint fk_user_group_group foreign key ("group_oid") references "public"."group" ("oid");


-- Productos_Categoria [rel1]
alter table "public"."productos"  add column  "categoria_oid"  int4;
alter table "public"."productos"   add constraint fk_productos_categoria foreign key ("categoria_oid") references "public"."categoria" ("oid");


-- Categoria_Subcategoria [rel2]
alter table "public"."categoria"  add column  "categoria_oid"  int4;
alter table "public"."categoria"   add constraint fk_categoria_categoria foreign key ("categoria_oid") references "public"."categoria" ("oid");


-- Productos_Promociones [rel3]
alter table "public"."productos"  add column  "promociones_oid"  int4;
alter table "public"."productos"   add constraint fk_productos_promociones foreign key ("promociones_oid") references "public"."promociones" ("oid");


-- User_Valoracion [rel4]
alter table "public"."valoracion"  add column  "user_oid"  int4;
alter table "public"."valoracion"   add constraint fk_valoracion_user foreign key ("user_oid") references "public"."user" ("oid");


-- Productos_Valoracion [rel5]
alter table "public"."valoracion"  add column  "productos_oid"  int4;
alter table "public"."valoracion"   add constraint fk_valoracion_productos foreign key ("productos_oid") references "public"."productos" ("oid");


-- User_Productos [rel6]
alter table "public"."productos"  add column  "user_oid"  int4;
alter table "public"."productos"   add constraint fk_productos_user foreign key ("user_oid") references "public"."user" ("oid");


-- User_Factura [rel7]
alter table "public"."factura"  add column  "user_oid"  int4;
alter table "public"."factura"   add constraint fk_factura_user foreign key ("user_oid") references "public"."user" ("oid");


-- Factura_Lineas Factura [rel8]
alter table "public"."lineas_factura"  add column  "factura_oid"  int4;
alter table "public"."lineas_factura"   add constraint fk_lineas_factura_factura foreign key ("factura_oid") references "public"."factura" ("oid");


-- Productos_Ubicacion [rel9]
alter table "public"."productos"  add column  "ubicacion_oid"  int4;
alter table "public"."productos"   add constraint fk_productos_ubicacion foreign key ("ubicacion_oid") references "public"."ubicacion" ("oid");


-- Productos.precioTrasPromocion [ent4#att7]
create view "public"."productos_preciotraspromocion" as
select AL1."oid" as "oid", AL1."precioproducto" - (AL1."precioproducto" * (AL2."porcentaje" / 100)) as "der_attr"
from  "public"."productos" AL1 
               left outer join "public"."promociones" AL2 on AL1."promociones_oid"=AL2."oid";


