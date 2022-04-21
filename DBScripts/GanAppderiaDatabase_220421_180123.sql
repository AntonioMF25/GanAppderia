-- HistoricoProductos [ent12]
create table "public"."historicoproductos" (
   "oid"  int4  not null,
   "nombreproducto"  varchar(255),
   "descripcionproducto"  text,
   "precioproducto"  float8,
   "unidadesproducto"  int4,
   "preciotraspromocion"  float8,
   "imagenproducto"  varchar(255),
   "fechacaducidad"  date,
   "valoracionmedia"  float8,
   "urlqr"  varchar(255),
   "fechahistorico"  date,
   "oid_productoantiguo"  int4,
  primary key ("oid")
);


