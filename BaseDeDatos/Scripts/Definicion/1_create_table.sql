create table t401_t_solicitud (id int(10) not null auto_increment, id_301_solicitante int(10) not null, fh_solicitud date not null, id_406_tiposervicio int(10) not null, nu_folioacredetica int(10), nu_matriculaamib int(10), nu_folioautorizacion int(10), id_407_formapago int(10) not null, id_408_figura int(10) not null, id_409_tipoexamen int(10) not null, id_410_modalcapacitacion int(10) not null, id_411_horarioexamen int(10) not null, id_412_modalactcert int(10) not null, tx_modactcerti varchar(20), id_413_institutocapacitador int(10) not null, tx_otroinstcapac varchar(200) not null, nm_di_institucion varchar(200), tx_di_puesto varchar(100), fh_di_iniciolaborles date, fh_di_consulrepcredesp date, nm_df_razonsocial varchar(254), tx_df_correofactura varchar(254), id_404_statussolicitud int(10) not null, primary key (id)) ENGINE=InnoDB;
create table t406_c_tiposervicio (id int(10) not null auto_increment, ds_tiposervicio varchar(100) not null, st_vigente tinyint(1) not null, primary key (id)) ENGINE=InnoDB;
create table t407_c_formapago (id int(10) not null auto_increment, ds_formapago varchar(100) not null, st_vigente tinyint(1) not null, primary key (id)) ENGINE=InnoDB;
create table t304_c_nacionalidad (id int(10) not null auto_increment, ds_nacionalidad varchar(50) not null, st_vigente tinyint(1) not null, primary key (id)) ENGINE=InnoDB;
create table t305_c_nivelestudios (id int(10) not null auto_increment, ds_nivelestudios varchar(50) not null, st_vigente tinyint(1) not null, primary key (id)) ENGINE=InnoDB;
create table t408_c_figura (id int(10) not null auto_increment, ds_figura varchar(200) not null, st_vigente tinyint(1) not null, primary key (id)) ENGINE=InnoDB;
create table t409_c_tipoexamen (id int(10) not null auto_increment, ds_tipoexamen varchar(200) not null, st_vigente tinyint(1) not null, primary key (id)) ENGINE=InnoDB;
create table t410_c_modalcapacitacion (id int(10) not null auto_increment, ds_modalcapacitacion varchar(100) not null, st_vigente tinyint(1) not null, primary key (id)) ENGINE=InnoDB;
create table t411_c_horarioexamen (id int(10) not null auto_increment, ds_horarioexamen varchar(50) not null, st_vigente tinyint(1) not null, primary key (id)) ENGINE=InnoDB;
create table t412_c_modalactcert (id int(10) not null auto_increment, ds_modalactcert varchar(50) not null, st_vigente tinyint(1) not null, primary key (id)) ENGINE=InnoDB;
create table t413_c_institutocapacitador (id int(10) not null auto_increment, nm_institutocapacitador varchar(200) not null, st_vigente tinyint(1) not null, primary key (id)) ENGINE=InnoDB;
create table t402_t_docanexo (id_401_solicitud int(10) not null, id_405_tipodoc int(10) not null, id int(10) not null auto_increment, constraint unq_402 unique (id_401_solicitud,id_405_tipodoc), primary key (id)) ENGINE=InnoDB;
create table t405_c_tipodoc (id int(10) not null auto_increment, ds_tipodoc varchar(150) not null, st_vigente tinyint(1) not null, primary key (id)) ENGINE=InnoDB;
create table t403_t_archivodocanexo (id_402_docanexo int(10) not null, id int(10) not null auto_increment, bl_docanexo blob not null, tx_tipo varchar(16) not null, primary key (id)) ENGINE=InnoDB;

create table t303_t_puesto (id_301_solicitante int(10) not null, id int(10) not null auto_increment, tx_empresa varchar(100) not null, fh_inicio date not null, fh_termino date, tx_puesto varchar(100) not null, primary key (id)) ENGINE=InnoDB;
create table t302_t_archivofoto (id_301_solicitante int(10) not null, id int(10) not null auto_increment, bl_archivofoto blob not null, tx_tipo varchar(16) not null, primary key (id)) ENGINE=InnoDB;

create table t101_t_usuario (id int(10) not null auto_increment, tx_usuario varchar(254) not null, tx_contrasena varchar(32) not null, primary key (id)) ENGINE=InnoDB;

create table t301_t_solicitante (id int(10) not null auto_increment, nm_apaterno varchar(100) not null, nm_amaterno varchar(100) not null, nm_nombrepila varchar(100) not null, tx_rfc varchar(13) not null, tx_curp varchar(18), tx_correopersonal varchar(254) not null, tx_lugarnacimiento varchar(100) not null, fh_fechanacimiento date not null, st_genero varchar(1) not null comment '''M'' o ''F''', st_estadocivil varchar(1) not null, tx_calle varchar(100) not null, tx_numext varchar(35) not null, id_304_nacionalidad int(10) not null, st_nacmexnatural tinyint(1), id_305_nivelestudios int(10) not null, id_205_sepomex int(10) not null, primary key (id)) ENGINE=InnoDB;
create table t306_t_telefonosolicitante (id_301_solicitante int(10) not null, id int(10) not null auto_increment, id_307_tipotelefono int(10) not null, nu_lada varchar(6), nu_telefono varchar(50) not null, nu_extension varchar(6), primary key (id)) ENGINE=InnoDB;
create table t307_c_tipotelefono (id int(10) not null auto_increment, ds_tipotelefono varchar(100) not null, st_vigente tinyint(1) not null, primary key (id)) ENGINE=InnoDB;

create table t205_c_sepomex (id int(10) not null auto_increment, id_203_asentamiento int(10) not null, id_204_ciudad int(10), cve_codigopostal varchar(5) not null, st_vigente tinyint(1) not null, primary key (id)) ENGINE=InnoDB;
create table t201_c_entidadfed (id int(10) not null auto_increment, cve_entidadfed varchar(2) not null unique, nm_entidadfed varchar(100) not null, st_vigente tinyint(1) not null, primary key (id)) ENGINE=InnoDB;
create table t202_c_municipio (id_201_entidadfed int(10) not null, id int(10) not null auto_increment, cve_municipio varchar(3) not null, nm_municipio varchar(150) not null, st_vigente tinyint(1) not null, primary key (id)) ENGINE=InnoDB;
create table t204_c_ciudad (id_202_municipio int(10) not null, id int(10) not null auto_increment, cve_ciudad varchar(2) not null, nm_ciudad varchar(255) not null, st_vigente tinyint(1) not null, primary key (id)) ENGINE=InnoDB;
create table t203_c_asentamiento (id_202_municipio int(10) not null, id int(10) not null auto_increment, cve_asentamiento varchar(4) not null, nm_asentamiento varchar(255) not null, st_vigente tinyint(1) not null, primary key (id)) ENGINE=InnoDB;
create table t404_c_statussolicitud (id int(10) not null auto_increment, ds_statussolicitud varchar(100) not null, st_vigente tinyint(1) not null, primary key (id)) ENGINE=InnoDB;