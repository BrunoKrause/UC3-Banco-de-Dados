/* Lógico_streaming: */

CREATE TABLE usuario (
    id_usuario number(5) PRIMARY KEY,
    nome Char(30),
    email Char(250),
    senha Char(15),
    data_nascimento Date(8),
    pais Char(20),
    fk_assinatura_id_assinatura Number(1)
);

CREATE TABLE genero (
    id_genero Number(5) PRIMARY KEY,
    nome Char(10)
);

CREATE TABLE episodio (
    id_episodio Number(3) PRIMARY KEY,
    titulo Char(15),
    duracao Number(7),
    numero Number(3),
    fk_temporada_id_temporada Number(2)
);

CREATE TABLE assinatura (
    id_assinatura Number(1) PRIMARY KEY,
    valor Number(4),
    qualidade Char(40),
    acesso Char(40)
);

CREATE TABLE historico (
    id_histórico Number(5) PRIMARY KEY,
    data_hora Date(14),
    progresso_assistido Number(7),
    fk_usuario_id_usuario number(5),
    fk_conteudo_id_conteudo Number(5)
);

CREATE TABLE lista_desejos (
    fk_usuario_id_usuario number(5),
    fk_conteudo_id_conteudo Number(5)
);

CREATE TABLE avaliacao (
    id_avaliacao Number(6) PRIMARY KEY,
    nota Number(3),
    comentario Char(1000),
    data Date(8),
    fk_usuario_id_usuario number(5),
    fk_conteudo_id_conteudo Number(5)
);

CREATE TABLE conteudo (
    id_conteudo Number(5) PRIMARY KEY,
    descricao Char(1000),
    lancamento Date(8),
    classificacao_indicativa Number(2),
    nome_conteudo Char(30)
);

CREATE TABLE filme (
    duracao Number(7),
    fk_conteudo_id_conteudo Number(5) PRIMARY KEY
);

CREATE TABLE serie (
    fk_conteudo_id_conteudo Number(5) PRIMARY KEY
);

CREATE TABLE conteudo_genero_tem (
    fk_conteudo_id_conteudo Number(5),
    fk_genero_id_genero Number(5)
);

CREATE TABLE temporada (
    id_temporada Number(2) PRIMARY KEY,
    numero Number(2),
    fk_serie_fk_conteudo_id_conteudo Number(5)
);
 
ALTER TABLE usuario ADD CONSTRAINT FK_usuario_2
    FOREIGN KEY (fk_assinatura_id_assinatura)
    REFERENCES assinatura (id_assinatura)
    ON DELETE RESTRICT;
 
ALTER TABLE episodio ADD CONSTRAINT FK_episodio_2
    FOREIGN KEY (fk_temporada_id_temporada)
    REFERENCES temporada (id_temporada)
    ON DELETE RESTRICT;
 
ALTER TABLE historico ADD CONSTRAINT FK_historico_2
    FOREIGN KEY (fk_usuario_id_usuario)
    REFERENCES usuario (id_usuario);
 
ALTER TABLE historico ADD CONSTRAINT FK_historico_3
    FOREIGN KEY (fk_conteudo_id_conteudo)
    REFERENCES conteudo (id_conteudo);
 
ALTER TABLE lista_desejos ADD CONSTRAINT FK_lista_desejos_1
    FOREIGN KEY (fk_usuario_id_usuario)
    REFERENCES usuario (id_usuario);
 
ALTER TABLE lista_desejos ADD CONSTRAINT FK_lista_desejos_2
    FOREIGN KEY (fk_conteudo_id_conteudo)
    REFERENCES conteudo (id_conteudo);
 
ALTER TABLE avaliacao ADD CONSTRAINT FK_avaliacao_2
    FOREIGN KEY (fk_usuario_id_usuario)
    REFERENCES usuario (id_usuario);
 
ALTER TABLE avaliacao ADD CONSTRAINT FK_avaliacao_3
    FOREIGN KEY (fk_conteudo_id_conteudo)
    REFERENCES conteudo (id_conteudo);
 
ALTER TABLE filme ADD CONSTRAINT FK_filme_2
    FOREIGN KEY (fk_conteudo_id_conteudo)
    REFERENCES conteudo (id_conteudo)
    ON DELETE CASCADE;
 
ALTER TABLE serie ADD CONSTRAINT FK_serie_2
    FOREIGN KEY (fk_conteudo_id_conteudo)
    REFERENCES conteudo (id_conteudo)
    ON DELETE CASCADE;
 
ALTER TABLE conteudo_genero_tem ADD CONSTRAINT FK_conteudo_genero_tem_1
    FOREIGN KEY (fk_conteudo_id_conteudo)
    REFERENCES conteudo (id_conteudo);
 
ALTER TABLE conteudo_genero_tem ADD CONSTRAINT FK_conteudo_genero_tem_2
    FOREIGN KEY (fk_genero_id_genero)
    REFERENCES genero (id_genero);
 
ALTER TABLE temporada ADD CONSTRAINT FK_temporada_2
    FOREIGN KEY (fk_serie_fk_conteudo_id_conteudo)
    REFERENCES serie (fk_conteudo_id_conteudo)
    ON DELETE RESTRICT;