CREATE DATABASE IF NOT EXISTS horta_comunitaria;
USE horta_comunitaria;

-- cria tabela voluntario
CREATE TABLE voluntario (
    voluntario_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_voluntario VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE voluntario ADD COLUMN funcao VARCHAR(50);

-- cria tabela telefone_usuario
CREATE TABLE telefone_usuario (
    telefone_id INT PRIMARY KEY AUTO_INCREMENT,
    numero VARCHAR(11) NOT NULL,
    voluntario_id INT NOT NULL,
    CONSTRAINT fk_telefone_voluntario
        FOREIGN KEY (voluntario_id)
        REFERENCES voluntario(voluntario_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ===============================
-- Tabela canteiro
-- ===============================
CREATE TABLE canteiro (
    canteiro_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_canteiro VARCHAR(100) NOT NULL,
    localizacao_canteiro VARCHAR(100) NOT NULL,
    tamanho_canteiro DECIMAL(8,2) NOT NULL
);


-- cria tabela planta

CREATE TABLE planta (
    planta_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_planta VARCHAR(100),
    tempo_cultivo VARCHAR(50)
);

-- cria tabela cultivo
CREATE TABLE cultivo (
    cultivo_id INT PRIMARY KEY AUTO_INCREMENT,
    data_cultivo DATE NOT NULL,
    voluntario_id INT NOT NULL,
    canteiro_id INT NOT NULL,
    planta_id INT NOT NULL,
    CONSTRAINT fk_cultivo_voluntario
        FOREIGN KEY (voluntario_id)
        REFERENCES voluntario(voluntario_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_cultivo_canteiro
        FOREIGN KEY (canteiro_id)
        REFERENCES canteiro(canteiro_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_cultivo_planta
        FOREIGN KEY (planta_id)
        REFERENCES planta(planta_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- cria tabela colheita
CREATE TABLE colheita (
    colheita_id INT PRIMARY KEY AUTO_INCREMENT,
    data_colheita DATE NOT NULL,
    quantidade_colhida DECIMAL(8,2) NOT NULL,
    cultivo_id INT NOT NULL,
    CONSTRAINT fk_colheita_cultivo
        FOREIGN KEY (cultivo_id)
        REFERENCES cultivo(cultivo_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- cria tabela instituicao
CREATE TABLE instituicao (
    instituicao_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_instituicao VARCHAR(100) NOT NULL,
    rua VARCHAR(50) NOT NULL,
    numero VARCHAR(5) NOT NULL,
    complemento VARCHAR(50),
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    cep VARCHAR(8) NOT NULL
);

-- cria tabela doacao
CREATE TABLE doacao (
    doacao_id INT PRIMARY KEY AUTO_INCREMENT,
    quantidade_doada DECIMAL(8,2) NOT NULL,
    colheita_id INT NOT NULL,
    instituicao_id INT NOT NULL,
    CONSTRAINT fk_doacao_colheita
        FOREIGN KEY (colheita_id)
        REFERENCES colheita(colheita_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_doacao_instituicao
        FOREIGN KEY (instituicao_id)
        REFERENCES instituicao(instituicao_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- cria tabela telefone_instituicao
CREATE TABLE telefone_instituicao (
    telefone_id INT PRIMARY KEY AUTO_INCREMENT,
    numero VARCHAR(11) NOT NULL,
    instituicao_id INT NOT NULL,
    CONSTRAINT fk_telefone_instituicao
        FOREIGN KEY (instituicao_id)
        REFERENCES instituicao(instituicao_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);