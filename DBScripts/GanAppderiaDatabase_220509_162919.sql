-- ExcelTemplate [ent3]
create table "public"."exceltemplate" (
   "oid"  int4  not null,
   "template"  varchar(255),
  primary key ("oid")
);


-- Factura [ent10]
alter table "public"."factura"  add column  "excel"  varchar(255);


-- Productos [ent4]
alter table "public"."productos"  add column  "imagenqr"  varchar(255);


-- Promociones [ent5]
alter table "public"."promociones"  add column  "tiempodiasrestantes"  int4;


-- Productos.valoracionMedia [ent4#att28]
create view "public"."productos_valoracionmedia_view" as
select AL1."oid" as "oid", avg(AL2."puntuacion") as "der_attr"
from  "public"."productos" AL1 
               left outer join "public"."valoracion" AL2 on AL1."oid"=AL2."productos_oid"
group by AL1."oid";


