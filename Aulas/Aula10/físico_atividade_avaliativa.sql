/* Lógico_atividade_avaliativa: */

CREATE TABLE usuario (
    id_usuario NUMERIC(6) PRIMARY KEY,
    nome CHAR(30),
    email CHAR(250),
    senha CHAR(20),
    data_nascimento DATE(8),
    data_cadastro DATE(8),
    pais CHAR(20),
    fk_endereco_endereco_PK NUMERIC(10)
);

CREATE TABLE conteudo (
    id_conteudo NUMERIC(6) PRIMARY KEY,
    titulo_conteudo CHAR(20),
    lancamento DATE(8),
    duracao NUMERIC(6)
);

CREATE TABLE musica (
    fk_conteudo_id_conteudo NUMERIC(6) PRIMARY KEY
);

CREATE TABLE podcast (
    descricao CHAR(100),
    idioma CHAR(15),
    classificacao_etaria NUMERIC(2),
    fk_conteudo_id_conteudo NUMERIC(6) PRIMARY KEY
);

CREATE TABLE playlist (
    id_playlist NUMERIC(6) PRIMARY KEY,
    nome CHAR(20),
    descricao CHAR(100),
    data_criacao DATE(8),
    visibilidade CHAR(10),
    fk_usuario_id_usuario NUMERIC(6),
    fk_conteudo_id_conteudo NUMERIC(6)
);

CREATE TABLE aba_busca (
    id_busca NUMERIC(6) PRIMARY KEY,
    termo_pesquisado CHAR(50),
    tipo_busca CHAR(15),
    filtro_aplicado CHAR(15),
    fk_usuario_id_usuario NUMERIC(6),
    fk_conteudo_id_conteudo NUMERIC(6)
);

CREATE TABLE genero (
    id_genero NUMERIC(3) PRIMARY KEY,
    nome CHAR(20)
);

CREATE TABLE conteudo_genero (
    fk_conteudo_id_conteudo NUMERIC(6),
    fk_genero_id_genero NUMERIC(3)
);

CREATE TABLE free (
    ads BOOLEAN,
    fk_usuario_id_usuario NUMERIC(6) PRIMARY KEY
);

CREATE TABLE premium (
    quantidade_contas NUMERIC(1),
    valor_mensal NUMERIC(5),
    id_assinatura NUMERIC(1),
    numero_dispositivos NUMERIC(1),
    forma_pagamento CHAR(20),
    fk_usuario_id_usuario NUMERIC(6),
    PRIMARY KEY (id_assinatura, fk_usuario_id_usuario)
);

CREATE TABLE artista (
    id_artista NUMERIC(6) PRIMARY KEY,
    nome CHAR(50),
    biografia CHAR(100),
    pais_origem CHAR(15)
);

CREATE TABLE album (
    id_album NUMERIC(6) PRIMARY KEY,
    titulo CHAR(30),
    data_lancamento DATE(8),
    tipo_album CHAR(15),
    fk_conteudo_id_conteudo NUMERIC(6),
    fk_artista_id_artista NUMERIC(6)
);

CREATE TABLE endereco (
    endereco_PK NUMERIC(10) NOT NULL PRIMARY KEY,
    rua CHAR(70),
    cidade CHAR(20),
    estado CHAR(20),
    cep NUMERIC(8)
);
 
ALTER TABLE usuario ADD CONSTRAINT FK_usuario_2
    FOREIGN KEY (fk_endereco_endereco_PK)
    REFERENCES endereco (endereco_PK)
    ON DELETE SET NULL;
 
ALTER TABLE musica ADD CONSTRAINT FK_musica_2
    FOREIGN KEY (fk_conteudo_id_conteudo)
    REFERENCES conteudo (id_conteudo)
    ON DELETE CASCADE;
 
ALTER TABLE podcast ADD CONSTRAINT FK_podcast_2
    FOREIGN KEY (fk_conteudo_id_conteudo)
    REFERENCES conteudo (id_conteudo)
    ON DELETE CASCADE;
 
ALTER TABLE playlist ADD CONSTRAINT FK_playlist_2
    FOREIGN KEY (fk_usuario_id_usuario)
    REFERENCES usuario (id_usuario);
 
ALTER TABLE playlist ADD CONSTRAINT FK_playlist_3
    FOREIGN KEY (fk_conteudo_id_conteudo)
    REFERENCES conteudo (id_conteudo);
 
ALTER TABLE aba_busca ADD CONSTRAINT FK_aba_busca_2
    FOREIGN KEY (fk_usuario_id_usuario)
    REFERENCES usuario (id_usuario);
 
ALTER TABLE aba_busca ADD CONSTRAINT FK_aba_busca_3
    FOREIGN KEY (fk_conteudo_id_conteudo)
    REFERENCES conteudo (id_conteudo);
 
ALTER TABLE conteudo_genero ADD CONSTRAINT FK_conteudo_genero_1
    FOREIGN KEY (fk_conteudo_id_conteudo)
    REFERENCES conteudo (id_conteudo);
 
ALTER TABLE conteudo_genero ADD CONSTRAINT FK_conteudo_genero_2
    FOREIGN KEY (fk_genero_id_genero)
    REFERENCES genero (id_genero);
 
ALTER TABLE free ADD CONSTRAINT FK_free_2
    FOREIGN KEY (fk_usuario_id_usuario)
    REFERENCES usuario (id_usuario)
    ON DELETE CASCADE;
 
ALTER TABLE premium ADD CONSTRAINT FK_premium_2
    FOREIGN KEY (fk_usuario_id_usuario)
    REFERENCES usuario (id_usuario)
    ON DELETE CASCADE;
 
ALTER TABLE album ADD CONSTRAINT FK_album_2
    FOREIGN KEY (fk_conteudo_id_conteudo)
    REFERENCES conteudo (id_conteudo);
 
ALTER TABLE album ADD CONSTRAINT FK_album_3
    FOREIGN KEY (fk_artista_id_artista)
    REFERENCES artista (id_artista);