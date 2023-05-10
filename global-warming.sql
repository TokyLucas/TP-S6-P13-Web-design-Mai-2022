DO $$ DECLARE
  r RECORD;
BEGIN
  FOR r IN (SELECT tablename FROM pg_tables WHERE schemaname = current_schema()) LOOP
    EXECUTE 'DROP TABLE ' || quote_ident(r.tablename) || ' CASCADE';
  END LOOP;
END $$;

CREATE EXTENSION pgcrypto;

CREATE  TABLE public.admin ( 
	idadmin              serial  NOT NULL  ,
	nom                  varchar(40)  NOT NULL  ,
	email                varchar(50)  NOT NULL  ,
	mdp                  varchar(100)  NOT NULL  ,
	CONSTRAINT pk_admin PRIMARY KEY ( idadmin )
 );

CREATE  TABLE public.categorie ( 
	idcategorie          serial  NOT NULL  ,
	nom                  varchar(50)  NOT NULL  ,
	CONSTRAINT pk_categorie PRIMARY KEY ( idcategorie )
 );

CREATE  TABLE public.articles ( 
	idarticle            serial  NOT NULL  ,
	titre                varchar(50)    ,
	description          text    ,
	contenus             text    ,
	date_de_publication  date DEFAULT CURRENT_DATE NOT NULL  ,
	url                  text default '#'  ,
	idcategorie          integer    ,
	thumbnail			 text	 ,
	CONSTRAINT pk_articles PRIMARY KEY ( idarticle )
 );

ALTER TABLE public.articles ADD CONSTRAINT fk_articles_categorie FOREIGN KEY ( idcategorie ) REFERENCES public.categorie( idcategorie );

CREATE or replace view articles_preview as 
 select articles.idarticle, titre, description, date_de_publication, url, thumbnail, nom  from articles join
	categorie on articles.idcategorie = categorie.idcategorie;

CREATE or replace view articles_details as 
 select articles.*, nom  from articles join
	categorie on articles.idcategorie = categorie.idcategorie;

INSERT INTO categorie (nom) VALUES ('Meteorologie'),('Conservation');

INSERT INTO admin (nom, email, mdp) VALUES ('Admin', 'admin@gmail.com', (SELECT digest( '12345678' , 'sha1')::varchar));

INSERT INTO Articles (titre, description, contenus, date_de_publication, url, idcategorie, thumbnail) VALUES
('Rechauffement climatique', 'La Terre se réchauffe, et les humains en sont au moins partiellement responsables. Il est important de comprendre les causes, les effets et les complexités du réchauffement climatique afin de pouvoir lutter pour la santé de notre planète.', 'Le réchauffement climatique est le réchauffement à long terme de la température globale de la planète. Bien que cette tendance au réchauffement se poursuive depuis longtemps, son rythme s est considérablement accéléré au cours des cent dernières années en raison de la combustion de combustibles fossiles. L augmentation de la population humaine s est accompagnée d une augmentation du volume de combustibles fossiles brûlés. Les combustibles fossiles comprennent le charbon, le pétrole et le gaz naturel, et leur combustion provoque ce que l on appelle "l effet de serre" dans l atmosphère terrestre.

L effet de serre se produit lorsque les rayons du soleil pénètrent dans l atmosphère, mais que la chaleur réfléchie par la surface ne peut pas s échapper dans l espace. Les gaz produits par la combustion de combustibles fossiles empêchent la chaleur de quitter l atmosphère. Ces gaz à effet de serre sont le dioxyde de carbone, les chlorofluorocarbones, la vapeur d eau, le méthane et l oxyde nitreux. L excès de chaleur dans l atmosphère a entraîné une augmentation de la température moyenne de la planète, autrement dit un réchauffement de la planète.', CURRENT_DATE, 'rechauffement-climatique-1', 1, 'assets/images/gw/effet-de-serre.jpg'),
 ('Effet de serre', 'Le réchauffement climatique décrit l augmentation actuelle de la température moyenne de l air et des océans de la Terre. Le réchauffement planétaire est souvent décrit comme l exemple le plus récent de changement climatique.', 'Les activités humaines contribuent au réchauffement de la planète en augmentant l effet de serre. L effet de serre se produit lorsque certains gaz - appelés gaz à effet de serre - s accumulent dans l atmosphère terrestre. Ces gaz, présents naturellement dans l atmosphère, comprennent le dioxyde de carbone, le méthane, l oxyde d azote et les gaz fluorés parfois appelés chlorofluorocarbones (CFC).

Les gaz à effet de serre laissent la lumière du soleil briller sur la surface de la Terre, mais ils retiennent la chaleur qui est renvoyée dans l atmosphère. En ce sens, ils agissent comme les parois vitrées isolantes d une serre. L effet de serre maintient le climat de la Terre à un niveau confortable. Sans lui, les températures de surface seraient plus froides d environ 33 degrés Celsius (60 degrés Fahrenheit), et de nombreuses formes de vie gèleraient.

Toutes ces activités humaines ajoutent des gaz à effet de serre dans l atmosphère, piégeant ainsi plus de chaleur que d habitude et contribuant au réchauffement de la planète.', CURRENT_DATE, 'effet-de-serre-2', 1, 'assets/images/gw/effet-de-serre.jpg'),
('Changement climatique', 'Les températures mondiales et le niveau des mers augmentent, ce qui pourrait contribuer à l apparition de tempêtes plus importantes et plus dévastatrices. Tout cela peut être attribué au changement climatique.', 'Les températures mondiales et le niveau des mers augmentent, ce qui pourrait contribuer à l apparition de tempêtes plus importantes et plus dévastatrices. Tout cela peut être attribué au changement climatique. Le changement climatique est défini comme une évolution progressive de tous les éléments météorologiques interconnectés de notre planète sur une période d environ 30 ans. Les données montrent que la Terre se réchauffe et c est à nous de faire les changements nécessaires pour une planète plus saine.

Utilisez ces ressources dans votre classe pour aider vos élèves à comprendre le changement climatique et à agir en conséquence.', CURRENT_DATE, 'changement-climatique-3', 2, 'assets/images/gw/changement-climatique.jpg')
;

