
# Gestion de stock (Entrée) : Dictionnaire, Règles, MCD, MLD

## Dictionnaire de données
- <img width="588" height="331" alt="image" src="https://github.com/user-attachments/assets/55f7494f-9803-4db5-aca6-d598577ddae3" />
## Règles de gestion
- 1er règle : Un fournisseur peut livrer zéro ou plusieurs produits
- 2ème règle : Un produit peut prévenir de zéro ou plusieurs fournisseurs
- 3ème règle : Le prix est unique pour chaque couple (Produit, Fournisseur) dans l’association Fournir
- 4ème règle : PrixAchat > 0
- 5ème règle : PrixUnit > 0
- 6ème règle : CodeProd unique
- 7ème règle : NumF unique
- 8ème règle : Le couple (CodeProd, NumF) doit être unique.

## MCD
- <img width="959" height="407" alt="image" src="https://github.com/user-attachments/assets/da29857b-58b3-40cf-98f2-b72609730c87" />
## MLD
- <img width="959" height="405" alt="image" src="https://github.com/user-attachments/assets/29a32c04-7c91-42d0-9817-7b751ee47cae" />
## Modèle relationnel
```sql
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
```
## 🧑‍💻 Author
- 👤 Agouram Hassan
- 🏫 Modélisation des Systèmes d’Information avec Merise
- 🎓 Instructor	Mr.LACHGAR
- 📅 11 décembre 2025
