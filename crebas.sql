/*==============================================================*/
/* Nom de SGBD :  MySQL 4.0                                     */
/* Date de création :  11/12/2025 15:29:16                      */
/*==============================================================*/


drop index FOURNIR2_FK on FOURNIR;

drop index FOURNIR_FK on FOURNIR;

drop table if exists FOURNIR;

drop table if exists FOURNISSEUR;

drop table if exists PRODUIT;

/*==============================================================*/
/* Table : FOURNIR                                              */
/*==============================================================*/
create table FOURNIR
(
   CODEPROD                       text                           not null,
   NUMF                           int                            not null,
   PRIXACHAT                      decimal                        not null,
   primary key (CODEPROD, NUMF)
)
type = InnoDB;

/*==============================================================*/
/* Index : FOURNIR_FK                                           */
/*==============================================================*/
create index FOURNIR_FK on FOURNIR
(
   CODEPROD
);

/*==============================================================*/
/* Index : FOURNIR2_FK                                          */
/*==============================================================*/
create index FOURNIR2_FK on FOURNIR
(
   NUMF
);

/*==============================================================*/
/* Table : FOURNISSEUR                                          */
/*==============================================================*/
create table FOURNISSEUR
(
   NUMF                           int                            not null,
   NOMF                           text                           not null,
   ADRESSEF                       text                           not null,
   primary key (NUMF)
)
type = InnoDB;

/*==============================================================*/
/* Table : PRODUIT                                              */
/*==============================================================*/
create table PRODUIT
(
   CODEPROD                       text                           not null,
   DESIGPROD                      text                           not null,
   PRIXUNIT                       decimal                        not null,
   primary key (CODEPROD)
)
type = InnoDB;

alter table FOURNIR add constraint FK_FOURNIR foreign key (CODEPROD)
      references PRODUIT (CODEPROD) on delete restrict on update restrict;

alter table FOURNIR add constraint FK_FOURNIR2 foreign key (NUMF)
      references FOURNISSEUR (NUMF) on delete restrict on update restrict;

