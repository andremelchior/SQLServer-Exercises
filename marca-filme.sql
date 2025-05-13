--Feito por André e Michael (github.com/pxawtyy).

-- EX 1 - Lista 1

CREATE DATABASE carrosModeloMarca

USE carrosModeloMarca

CREATE TABLE marca (
	cod_marca   int not null IDENTITY(1,1),
	nm_marca    char(10) not null,
	pais_origem char(20) not null,
	abr_marca   varchar(5) not null
	CONSTRAINT pk_marca PRIMARY KEY(cod_marca)
)

CREATE TABLE modelo (
	cod_modelo     int not null IDENTITY(1,1),
	nm_modelo      varchar(30) not null,
	ano_lancamento int not null,
	cd_marca       int,
	CONSTRAINT pk_modelo PRIMARY KEY(cod_modelo),
	CONSTRAINT fk_modeloMarca FOREIGN KEY(cd_marca)
	REFERENCES marca(cod_marca)
)

INSERT INTO marca VALUES ('chevrolet', 'estados unidos', 'chevy')
INSERT INTO marca VALUES ('renault', 'frança', 'renlt')
INSERT INTO modelo VALUES ('kwid', 2023, 2)
INSERT INTO modelo VALUES ('onix', 2013, 1)
SELECT * FROM marca
SELECT * FROM modelo

/*------------------------//------------------------*/

-- EX 2 - Lista 1
  
CREATE DATABASE filmesFilmePersonagem

USE filmesFilmePersonagem

CREATE TABLE filme (
	cod_filme       int not null IDENTITY(1,1),
	titulo_filme    varchar(15) not null,
	subtitulo_filme varchar(20) not null,
	ano_lancamento  int not null,
	tempo_duracao   int not null,
	bilheteria      decimal(10,2) not null
	CONSTRAINT pk_filme PRIMARY KEY(cod_filme)
)

CREATE TABLE personagem (
	cod_personagem int not null IDENTITY(1,1),
	nm_personagem  varchar(20) not null,
	tempo_cena     int not null,
	tp_papel       varchar(15) not null,
	ds_papel       varchar(50) not null,
	cd_Filme       int
	CONSTRAINT pk_personagem PRIMARY KEY(cod_personagem)
	CONSTRAINT fk_filmePersonagem FOREIGN KEY(cd_Filme)
	REFERENCES filme(cod_filme)
)

INSERT INTO filme VALUES ('Senhor Anéis', 'Sociedade do Anel', 2001, 178, 871530324.00)
INSERT INTO personagem VALUES ('Homem de Ferro', 'Início do MCU', 2008, 126, 585174222.00)

INSERT INTO personagem VALUES ('Frodo Bolseiro', 90, 'Protagonista', 'Hobbit que carrega um Anel', 1)
INSERT INTO personagem VALUES ('Gandalf', 60, 'Coadjuvante', 'Mago que guia a Sociedade do Anel', 1)
INSERT INTO personagem VALUES ('Tony Stark', 100, 'Protagonista', 'Bilionário que se torna o Homem de Ferro', 2)
INSERT INTO personagem VALUES ('Pepper Potts', 40, 'Coadjuvante', 'Assistente e interesse amoroso de Tony', 2)

SELECT * FROM filme
SELECT * FROM personagem
