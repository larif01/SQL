-- criar banco de dados
CREATE DATABASE escola_ingles;

-- criar tabelas
USE escola_ingles;

CREATE TABLE endereco (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cep VARCHAR(20) NOT NULL,
    bairro VARCHAR(255) NOT NULL,
    cidade VARCHAR(255) NOT NULL,
    rua VARCHAR(255) NOT NULL,
    numero INT NOT NULL,
    complemento VARCHAR(255) NOT NULL
);

CREATE TABLE telefone (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pessoal VARCHAR(20) NOT NULL,
    residencial VARCHAR(20) NOT NULL,
    profissional VARCHAR(20) NOT NULL
);

CREATE TABLE email (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pessoal VARCHAR(255) NOT NULL,
    profissional VARCHAR(255) NOT NULL
);

CREATE TABLE professor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_email INT NOT NULL,
    id_telefone INT NOT NULL,
    id_endereco INT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_email) REFERENCES email(id),
    FOREIGN KEY (id_telefone) REFERENCES telefone(id),
    FOREIGN KEY (id_endereco) REFERENCES endereco(id)
);

CREATE TABLE aluno (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_email INT NOT NULL,
    id_telefone INT NOT NULL,
    id_endereco INT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    FOREIGN KEY (id_email) REFERENCES email(id),
    FOREIGN KEY (id_telefone) REFERENCES telefone(id),
    FOREIGN KEY (id_endereco) REFERENCES endereco(id)
);

CREATE TABLE aluno_turma (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT NOT NULL,
    id_turma INT NOT NULL,
    nivel_ensino VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id),
    FOREIGN KEY (id_turma) REFERENCES turma(id)
);

CREATE TABLE curso (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL,
    carga_horaria INT NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE turma (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_curso INT NOT NULL,
    id_professor INT NOT NULL,
    sala_aula VARCHAR(255) NOT NULL,
    quantidade_alunos INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES curso(id),
    FOREIGN KEY (id_professor) REFERENCES professor(id)
);

CREATE TABLE prova (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT NOT NULL,
    data DATE NOT NULL,
    numero_acertos INT NOT NULL,
    nivel_resultado VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id)
);

CREATE TABLE horario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    dia_semana VARCHAR(255) NOT NULL,
    período_dia VARCHAR(255) NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fim TIME NOT NULL
);

CREATE TABLE horario_turma (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_turma INT NOT NULL,
    id_horario INT NOT NULL,
    FOREIGN KEY (id_turma) REFERENCES turma(id),
    FOREIGN KEY (id_horario) REFERENCES horario(id)
);