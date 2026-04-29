create table Gravadora (idGrav int not null identity(1,1),
						nomeGrav varchar(30) not null,
                        constraint PK_GRAV PRIMARY KEY (idGrav));

create table  Compositor(idComp int not null identity(1,1),
						 nomeComp varchar(50) not null,
                         constraint PK_COMP PRIMARY KEY (idComp));

create table  Interprete (idInt int not null identity(1,1),
						  nomeInt varchar(50) not null,
                          constraint PK_INT PRIMARY KEY (idInt));

create table  Musica(idMusica int not null identity(1,1),
					 nomeMusica varchar(50) not null,
                     constraint PK_MUS PRIMARY KEY (idMusica));

create table  CD (idCD int not null identity(1,1),
				  nomeCD varchar(40) not null,
                  produtor varchar(50) not null,
                  ano int not null,
                  estilo varchar(30) not null, 
                  nr_faixas int not null, 
                  idGrav int not null,
             constraint PK_CD PRIMARY KEY (idCD),
             constraint FK_GRAV_CD FOREIGN KEY (idGrav) references Gravadora (idGrav) );


create table Musica_CD(idMusicaCD int not null identity(1,1),
					   idMusica int not null, idCD int not null,
                       constraint PK_MUS_CD PRIMARY KEY (idMusica, idCD),
                       constraint FK_MCD_MUS FOREIGN KEY (idMusica) references Musica (idMusica),
                       constraint FK_MCD_CD  foreign key (idCD) references CD (idCD) );


create table Composicao (idComposicao int not null identity(1,1),
						idComp int not null, 
                        idMusica int not null, 
                        dataComp date not null,
                        constraint PK_COMPOSICAO PRIMARY KEY (idComposicao),
                        constraint FK_COMPOS_MUS FOREIGN KEY (idMusica) references MUSICA(idMusica),
                        constraint FK_COMPOS_COMP FOREIGN KEY (idComp) references Compositor(idComp));


create table CantoresMusica (
						idInt int not null, 
						idMusica int not null,
                       constraint FK_CANT_MUSICA FOREIGN KEY (idMusica) references Musica (idmusica),
                       constraint FK_CANT_INT    FOREIGN KEY (idInt) references Interprete(idint) );
             

--Gravadora(nomeGrav)
insert into gravadora values ('Continental');
insert into gravadora values ('Global Records');
insert into gravadora (nomeGrav) values ('Som Livre');
insert into gravadora (nomeGrav) values ('Universal');
SELECT*FROM Gravadora

--Compositor(nomeComp)
insert into compositor values ('Chico Buarque');
insert into compositor values ('Caetano');
insert into compositor values ('Terry McClean');
insert into compositor (nomecomp) values ('Tião Carreiro');
insert into compositor (nomecomp) values ('Newton Mello');
SELECT*FROM Compositor

--Interprete (nomeInt)

insert into interprete values ('Sandra de Sá');
insert into interprete values ('Zeca Pagodinho');
insert into interprete values ('Elvis Presley');
insert into interprete (nomeint) values ('Elton John');
insert into interprete (nomeint) values ('Tião Carreiro e Pardinho');
SELECT*FROM Interprete

--Musica(nomeMusica)
insert into musica  values ('Sozinha');
insert into musica  values ('Agora eu sei');
insert into musica values ('Agua da minha sede');
insert into musica values ('Vida da Gente');
insert into musica values ('My Way');
insert into musica values ('Tutti-frutti');
insert into musica values ('Love me tender');
insert into musica values ('Rio de Lágrimas');
insert into musica values ('Boi Soberano');
insert into musica values ('Hino de Piracicaba');
SELECT*FROM Musica

--CD (nomeCD,produtor,ano, estilo, nr_faixas, nomeGrav)
insert into cd (nomeCD,produtor,ano, estilo, nr_faixas, idGrav) values
               ('Música Preta Brasileira','Emilio S',2004, 'MPB', 10, 4);
insert into cd (nomeCD,produtor,ano, estilo, nr_faixas, idGrav) values
               ('Acústico MTV','Ze Branquinho',2004, 'Samba', 12, 4);
insert into cd (nomeCD,produtor,ano, estilo, nr_faixas, idGrav) values
               ('Viola Clássica','Viriato Correia',2005, 'Regional', 13, 1);
insert into cd (nomeCD,produtor,ano, estilo, nr_faixas, idGrav) values
               ('The Best of Elvis','Hilton Pedro', 1992, 'Rock', 16, 2);
SELECT*FROM CD

insert into Musica_CD(idMusica , idCD) values (1, 1);
insert into Musica_CD(idMusica , idCD) values (2, 1);
insert into Musica_CD(idMusica , idCD) values (3, 2);
insert into Musica_CD(idMusica , idCD) values (4, 2);
insert into Musica_CD(idMusica , idCD) values (8, 2);
insert into Musica_CD(idMusica , idCD) values (9, 3);
insert into Musica_CD(idMusica , idCD) values (10, 3);
insert into Musica_CD(idMusica , idCD) values (5, 4);
insert into Musica_CD(idMusica , idCD) values (6, 4);
insert into Musica_CD(idMusica , idCD) values (7, 4);

insert into Composicao (idComp, idMusica,dataComp) values (1,1,'2000-01-15');
insert into Composicao (idComp, idMusica,dataComp) values (1,2,'2001-07-18');
insert into Composicao (idComp, idMusica,dataComp) values (2,3,'2004-10-28');
insert into Composicao (idComp, idMusica,dataComp) values (2,4,'2003-11-17');
insert into Composicao (idComp, idMusica,dataComp) values (3,5,'1968-11-11');
insert into Composicao (idComp, idMusica,dataComp) values (3,6,'1964-06-11');
insert into Composicao (idComp, idMusica,dataComp) values (3,7,'1966-12-01');
insert into Composicao (idComp, idMusica,dataComp) values (4,8,'1967-03-01');
insert into Composicao (idComp, idMusica,dataComp) values (4,9,'1957-08-07');
insert into Composicao (idComp, idMusica,dataComp) values (5,10,'1951-05-07');


insert into CantoresMusica  values (1,1);
insert into CantoresMusica  values (1,2);
insert into CantoresMusica  values (2,3);
insert into CantoresMusica  values (2,4);
insert into CantoresMusica  values (3,5);
insert into CantoresMusica  values (3,6);
insert into CantoresMusica  values (3,7);
insert into CantoresMusica  values (5,8);
insert into CantoresMusica  values (5,9);
insert into CantoresMusica  values (5,10);

--EX1: CRIAR VIEW MOSTRAR DADOS CD
CREATE VIEW VW_DADOS_CD AS
SELECT 
    CD.idCD,
    CD.nomeCD,
    CD.produtor,
    CD.ano,
    CD.estilo,
    CD.nr_faixas,
    Gravadora.nomeGrav,
    Musica.nomeMusica,
    Compositor.nomeComp,
    Interprete.nomeInt,
    Composicao.dataComp

FROM CD --inicia na tabela CD
INNER JOIN Gravadora ON CD.idGrav = Gravadora.idGrav --liga CD com gravadora pelo idGrav
INNER JOIN Musica_CD ON CD.idCD = Musica_CD.idCD --liga Cd com MusicaCd
INNER JOIN Musica ON Musica_CD.idMusica = Musica.idMusica 
INNER JOIN Composicao ON Musica.idMusica = Composicao.idMusica
INNER JOIN Compositor ON Composicao.idComp = Compositor.idComp
INNER JOIN CantoresMusica ON Musica.idMusica = CantoresMusica.idMusica
INNER JOIN Interprete ON CantoresMusica.idInt = Interprete.idInt

SELECT * FROM VW_DADOS_CD
ORDER BY nomeCD, nomeMusica


--EX_01: 1.	Listar todos os CD com suas respectivas músicas, intérpretes e gravadora
SELECT nomeCD, nomeMusica, nomeInt, nomeGrav
FROM VW_DADOS_CD
ORDER BY nomeCD, nomeMusica

--EX_02: Liste todos os compositores com suas respectivas músicas. Mostre o nome da música e o nome do Compositor.
CREATE VIEW VW_LISTA_COMPOSITOR AS

SELECT
	Musica.nomeMusica,
	Compositor.nomeComp

FROM Composicao
INNER JOIN Compositor ON Composicao.idComp = Compositor.idComp
INNER JOIN Musica ON Composicao.idMusica = Musica.idMusica

SELECT * FROM VW_LISTA_COMPOSITOR
ORDER BY nomeMusica, nomeComp

--EX_03: 3.	Liste todos os CDS com suas respectivas músicas, interpretes e gravadora.
CREATE VIEW VW_LISTA_CD AS

SELECT
	CD.nomeCD,
	Musica.nomeMusica,
	Interprete.nomeInt,
	Gravadora.nomeGrav

FROM CD
INNER JOIN Gravadora ON CD.idGrav = Gravadora.idGrav
INNER JOIN Musica_CD ON CD.idCD - Musica_CD.idCD
INNER JOIN Musica ON Musica_CD.idMusica = Musica.idMusica
INNER JOIN Cantores.Musica
