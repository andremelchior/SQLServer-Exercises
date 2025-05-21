--Feito por André Diogo Melchior da Silva e Michael Akira de Lima Kuwahara.

-- Lista 1

CREATE DATABASE L1

USE L1

CREATE TABLE pais(
	id_pais INT NOT NULL IDENTITY(1,1),
	nm_pais VARCHAR(15) NOT NULL,
	CONSTRAINT pk_pais PRIMARY KEY (id_pais)
)

CREATE TABLE combustivel(
	id_combustivel INT NOT NULL IDENTITY(1,1),
	nm_combustivel VARCHAR(15) NOT NULL,
	abr_combustivel VARCHAR(5) NOT NULL,
	CONSTRAINT pk_combustivel PRIMARY KEY (id_combustivel)
)

CREATE TABLE tipoModelo(
	id_tipoModelo INT NOT NULL IDENTITY(1,1),
	ds_tipoModelo VARCHAR(35) NOT NULL,
	CONSTRAINT pk_tipoModelo PRIMARY KEY (id_tipoModelo)
)

CREATE TABLE marca(
	id_marca INT NOT NULL IDENTITY(1,1),
	nm_marca CHAR(15) NOT NULL,
	abr_marca VARCHAR(5) NOT NULL, 
	id_paisMarca INT NOT NULL
	CONSTRAINT pk_marca PRIMARY KEY (id_marca)
	CONSTRAINT fk_paisMarca FOREIGN KEY (id_paisMarca) REFERENCES pais(id_pais)
)

CREATE TABLE modelo(
	id_modelo INT NOT NULL IDENTITY(1,1),
	nm_modelo VARCHAR(15) NOT NULL,
	vlr_modelo DECIMAL(10, 2) NOT NULL,
	vlr_potenciaMoto DECIMAL(5, 2) NOT NULL,
	id_combustivelModelo INT NOT NULL,
	id_tipoModeloCarro INT NOT NULL,
	id_marcaModelo INT NOT NULL,
	CONSTRAINT pk_modelo PRIMARY KEY (id_modelo),
	CONSTRAINT fk_combustivelModelo FOREIGN KEY (id_combustivelModelo) REFERENCES combustivel(id_combustivel),
	CONSTRAINT fk_tipoModeloCarro FOREIGN KEY (id_tipoModeloCarro) REFERENCES tipoModelo(id_tipoModelo),
	CONSTRAINT fk_marcaModelo FOREIGN KEY (id_marcaModelo) REFERENCES marca(id_marca)
)


-- Lista 3 - Entidade Fraca Tabela Preco

CREATE TABLE UnidadeMedida (
	cod_UnidadeMedida int not null IDENTITY(1,1),
	nm_UnidadeMedida varchar(35) not null,
	abr_UnidadeMedida varchar(5) not null
	CONSTRAINT pk_codUnidadeMedida PRIMARY KEY(cod_UnidadeMedida)
)

CREATE TABLE fabricante(
    cod_fabricante int not null IDENTITY(1,1),
    nm_fabricante varchar(35) not null,
	CONSTRAINT pk_codFabricante PRIMARY KEY(cod_fabricante)
)

CREATE TABLE produto(
    cod_produto int not null IDENTITY(1,1),
    nm_produto varchar(35) not null,
    ds_produto varchar(45) not null,
    vlr_precoVenda decimal(10,2) not null,
    vlr_precoCusto decimal(10,2) not null,
    vlr_peso decimal(10,2) not null,
    vlr_precoVolume decimal(10,2) not null,
    cd_UnidadeMedidaPeso int,
    cd_UnidadeMedidaVol int,
    cd_fabricante int,
	CONSTRAINT pk_codProduto PRIMARY KEY(cod_produto),
    CONSTRAINT fk_codUnidadeMedidaPeso FOREIGN KEY(cd_UnidadeMedidaPeso)
    REFERENCES UnidadeMedida(cod_UnidadeMedida),
    CONSTRAINT fk_codUnidadeMedidaVol FOREIGN KEY(cd_UnidadeMedidaVol)
    REFERENCES UnidadeMedida(cod_UnidadeMedida),
    CONSTRAINT fk_codFabricanteProduto FOREIGN KEY(cd_fabricante)
    REFERENCES fabricante(cod_fabricante)
)

CREATE TABLE ProdutoTabelaPreco(
    cod_Produto int,
    cod_ProdutoTabelaPreco int not null IDENTITY(1,1),
    dt_inicioPreco date not null,
    vlr_Produto decimal(10,2) not null,
    dt_FimPreco date not null,
    CONSTRAINT pk_codProdutoTabelaPreco PRIMARY KEY(cod_Produto, cod_ProdutoTabelaPreco),
    CONSTRAINT fk_codProduto FOREIGN KEY(cod_Produto)
    REFERENCES produto(cod_produto)
)


-- Lista 2 - Associativa Musica
CREATE DATABASE L2

USE L2

CREATE TABLE GeneroPessoa(
    cod_GeneroPessoa int not null IDENTITY(1,1),
    ds_GeneroPessoa varchar(45) not null,
    abr_GeneroPessoa varchar(5) not null,
	CONSTRAINT pk_codGeneroPessoa PRIMARY KEY(cod_GeneroPessoa)
)

CREATE TABLE artista(
    cod_Artista int not null IDENTITY(1,1),
    nm_Artista varchar(45) not null,
    nm_ArtisticoArtista varchar(20) not null,
    dt_nascimento date not null,
    cd_GeneroPessoaArtista int,
	CONSTRAINT pk_codArtista PRIMARY KEY(cod_Artista),
    CONSTRAINT fk_codGeneroArtista FOREIGN KEY(cd_GeneroPessoaArtista)
    REFERENCES GeneroPessoa(cod_GeneroPessoa)
)

CREATE TABLE musica(
    cod_musica int not null IDENTITY(1,1),
    nm_musica varchar(30) not null,
    vlr_tempoDuracao int not null,
    dt_LancamentoMusica date not null,
	CONSTRAINT pk_codMusica PRIMARY KEY(cod_musica),
)

CREATE TABLE composicao(
    cod_musica int,
    cod_artista int,
	CONSTRAINT pk_codMusicaArtistaComposicao PRIMARY KEY(cod_musica, cod_artista),
    CONSTRAINT fk_codMusicaComposicao FOREIGN KEY (cod_musica)
    REFERENCES musica(cod_musica),
    CONSTRAINT fk_codArtistaComposicao FOREIGN KEY (cod_artista)
    REFERENCES artista(cod_artista)
)


/*------------------------*/

--- lista 1
CREATE DATABASE DSM_ZOO
USE DSM_ZOO

CREATE TABLE zoo(
cd_zoo INT NOT NULL IDENTITY(1, 1),
nm_zoo VARCHAR(30) NOT NULL,
ds_siteZoo VARCHAR(45) NOT NULL,
ds_enderecoZoo VARCHAR(50) NOT NULL
CONSTRAINT pk_cdzoo PRIMARY KEY (cd_zoo)
)

CREATE TABLE pais(
cd_pais INT NOT NULL IDENTITY(1, 1),
nm_pais VARCHAR(30) NOT NULL
CONSTRAINT pk_cd_Pais PRIMARY KEY (cd_pais)
)

CREATE TABLE raca(
cod_raca INT NOT NULL IDENTITY(1, 1),
nm_cientificoRaca VARCHAR(30) NOT NULL,
nm_popularRaca VARCHAR(30) NOT NULL,
cd_paisOrigem INT
CONSTRAINT pk_codRaca PRIMARY KEY (cod_raca),
CONSTRAINT fk_codPaisOrigem FOREIGN KEY (cd_paisOrigem) REFERENCES pais(cd_pais)
)

CREATE TABLE areaExibicao(
cd_AreaExibicao INT NOT NULL IDENTITY(1, 1),
nm_AreaExibicao VARCHAR(45) NOT NULL,
ds_AreaExibicao VARCHAR(50) NOT NULL,
vlr_areaM2 DECIMAL(10, 2) NOT NULL,
cd_zoo INT,
CONSTRAINT pk_cdAreaExecucao PRIMARY KEY (cd_AreaExibicao),
CONSTRAINT fk_cdZoo FOREIGN KEY (cd_zoo) REFERENCES zoo(cd_zoo)
)

CREATE TABLE familiaAnimais(
cd_familiaAnimais INT NOT NULL IDENTITY(1, 1),
nm_familiaAnimais VARCHAR(45) NOT NULL,
cd_areaExibicao INT,
CONSTRAINT pk_cdFamiliaAnimais PRIMARY KEY (cd_familiaAnimais),
CONSTRAINT fk_areaExibicao FOREIGN KEY (cd_areaExibicao) REFERENCES areaExibicao (cd_AreaExibicao)
)

--- lista 2

CREATE DATABASE DSM_L2

USE DSM_L2

CREATE TABLE curso(
	id_curso INT NOT NULL IDENTITY(1, 1),
	nm_curso VARCHAR(20) NOT NULL
	CONSTRAINT pk_curso PRIMARY KEY (id_curso)
)

CREATE TABLE statusAlunoDisciplina(
	id_statusalunodisciplina INT NOT NULL IDENTITY(1, 1),
	ds_statusalunodisciplina CHAR(10) NOT NULL,
	abr_statusalunodisciplina CHAR(2) NOT NULL
	CONSTRAINT pk_statusalunodisciplina PRIMARY KEY (id_statusalunodisciplina)
)

CREATE TABLE generoPessoa(
	id_generoPessoa INT NOT NULL IDENTITY(1, 1),
	ds_generoPessoa CHAR(10) NOT NULL,
	abr_generoPessoa CHAR(1) NOT NULL
	CONSTRAINT pk_generoPessoa PRIMARY KEY (id_generoPessoa)
)

CREATE TABLE aluno(
	id_aluno INT NOT NULL IDENTITY(1, 1),
	dt_nascimentoAluno SMALLDATETIME NOT NULL,
	id_generoPessoaAluno INT NOT NULL,
	nr_cpfAluno BIGINT NOT NULL,
	nr_rgAluno BIGINT NOT NULL
	CONSTRAINT pk_aluno PRIMARY KEY (id_aluno),
	CONSTRAINT fk_cursoDisciplina FOREIGN KEY (id_generoPessoaAluno) REFERENCES curso(id_curso)
)

CREATE TABLE disciplina(
	id_disciplina INT NOT NULL IDENTITY(1, 1),
	nm_disciplina VARCHAR(15) NOT NULL,
	sig_disciplina CHAR(5) NOT NULL,
	ds_disciplinaEmenta VARCHAR(50) NOT NULL,
	id_cursoDisciplina INT NOT NULL,
	vlr_disciplinaCargaHoraria INT NOT NULL
	CONSTRAINT pk_disciplina PRIMARY KEY (id_disciplina)
	CONSTRAINT fk_cursoDisciplina FOREIGN KEY (id_cursoDisciplina) REFERENCES curso(id_curso)
)

CREATE TABLE alunoDisciplina(
	id_alunoDisciplina INT NOT NULL IDENTITY(1, 1),
	id_aluno INT NOT NULL,
	id_disciplina INT NOT NULL,
	vlr_p1 DECIMAL(2, 2) NOT NULL,
	vlr_p2 DECIMAL(2, 2) NOT NULL,
	vlr_p3 DECIMAL (2, 2) NOT NULL,
	vlr_atv DECIMAL (2, 2) NOT NULL,
	qtd_faltas INT NOT NULL,
	nr_semestre INT NOT NULL,
	id_statusAlunoDisciplina INT NOT NULL
	CONSTRAINT pk_alunoDisciplina PRIMARY KEY (id_alunoDisciplina, id_aluno, id_disciplina),
	CONSTRAINT fk_aluno FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
	CONSTRAINT fk_disciplina FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina),
	CONSTRAINT fk_statusAlunoDisciplina FOREIGN KEY (id_statusAlunoDisciplina) REFERENCES statusalunodisciplina(id_statusalunodisciplina)
)

)

--- lista 3

CREATE DATABASE DSM_L3
USE DSM_L3

CREATE TABLE tipoNF(
	id_tipoNF INT NOT NULL IDENTITY(1,1),
	ds_tipoNF VARCHAR(10) NOT NULL,
	abr_tipoNF CHAR(5) NOT NULL
	CONSTRAINT pk_tipoNF PRIMARY KEY (id_tipoNF)
)
CREATE TABLE cliente(
	id_cliente INT NOT NULL IDENTITY(1,1),
	nm_cliente CHAR(20) NOT NULL
	CONSTRAINT pk_cliente PRIMARY KEY (id_cliente)
)
CREATE TABLE unidadeMedida(
	id_unidadeMedida INT NOT NULL IDENTITY(1,1),
	nm_unidadeMedida CHAR(10) NOT NULL,
	abr_unidaddeMedida CHAR(2) NOT NULL
	CONSTRAINT pk_unidadeMedida PRIMARY KEY (id_unidadeMedida)
)
CREATE TABLE fabricante(
	id_fabricante INT NOT NULL IDENTITY(1,1),
	nm_fabricante VARCHAR(20) NOT NULL
	CONSTRAINT pk_fabricante PRIMARY KEY (id_fabricante)
)
CREATE TABLE nf(
	id_nf INT NOT NULL IDENTITY(1,1),
	nr_NR BIGINT NOT NULL,
	nr_serieNF BIGINT NOT NULL,
	dt_emissao SMALLDATETIME NOT NULL,
	vlr_total DECIMAL(10, 2) NOT NULL,
	id_cliente INT NOT NULL,
	id_tipoNF INT NOT NULL
	CONSTRAINT pk_nf PRIMARY KEY (id_nf),
	CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
	CONSTRAINT fk_tipoNF FOREIGN KEY (id_tipoNF) REFERENCES tipoNF(id_tipoNF)
)
CREATE TABLE produto(
	id_produto INT NOT NULL IDENTITY(1,1),
	nm_produto CHAR(15) NOT NULL,
	ds_produto CHAR(20) NOT NULL,
	vlr_precoVenda DECIMAL(5,2) NOT NULL,
	vlr_precoCusto DECIMAL(5,2) NOT NULL,
	vlr_peso DECIMAL(5, 2) NOT NULL,
	vlr_volume DECIMAL(5, 2) NOT NULL,
	id_unidadeMedidaPeso INT NOT NULL,
	id_unidadeMedidaVol INT NOT NULL,
	id_fabricante INT NOT NULL
	CONSTRAINT pk_produto PRIMARY KEY (id_produto)
	CONSTRAINT fk_unidadeMedidaPeso FOREIGN KEY (id_unidadeMedidaPeso) REFERENCES unidadeMedida(id_unidadeMedida),
	CONSTRAINT fk_unidadeMedidaVol FOREIGN KEY (id_unidadeMedidaVol) REFERENCES unidadeMedida(id_unidadeMedida),
	CONSTRAINT fk_fabricante FOREIGN KEY (id_fabricante) REFERENCES fabricante(id_fabricante)
)
CREATE TABLE nfItem(
	id_nfItem INT NOT NULL IDENTITY(1,1),
	id_nf INT NOT NULL,
	nr_item BIGINT NOT NULL,
	qtd_item INT NOT NULL,
	id_produtoNFItem INT NOT NULL
	CONSTRAINT pk_nfItem PRIMARY KEY (id_nfItem, id_nf),
	CONSTRAINT fk_nf FOREIGN KEY (id_nf) REFERENCES nf(id_nf),
	CONSTRAINT fk_produtoNFItem FOREIGN KEY (id_produtoNFItem)REFERENCES produto(id_produto)
)