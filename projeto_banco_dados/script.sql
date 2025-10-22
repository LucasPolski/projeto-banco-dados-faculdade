-- =====================================
-- SCRIPT DE CRIAÇÃO DO BANCO DE DADOS
-- Projeto: Sistema de Departamentos, Funcionários, Projetos e Tarefas
-- =====================================

-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS EmpresaDB;
USE EmpresaDB;

-- =====================================
-- TABELA DEPARTAMENTOS
-- =====================================
CREATE TABLE Departamentos (
    id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    localizacao VARCHAR(100),
    data_criacao DATE NOT NULL
);

-- =====================================
-- TABELA FUNCIONARIOS
-- =====================================
CREATE TABLE Funcionarios (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    cargo VARCHAR(50),
    salario DECIMAL(10,2),
    id_departamento INT NOT NULL,
    FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento)
);

-- =====================================
-- TABELA PROJETOS
-- =====================================
CREATE TABLE Projetos (
    id_projeto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    data_inicio DATE NOT NULL,
    data_fim DATE
);

-- =====================================
-- TABELA ALOCACOES
-- =====================================
CREATE TABLE Alocacoes (
    id_alocacao INT PRIMARY KEY AUTO_INCREMENT,
    id_funcionario INT NOT NULL,
    id_projeto INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    carga_horaria_semana INT NOT NULL,
    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario),
    FOREIGN KEY (id_projeto) REFERENCES Projetos(id_projeto)
);

-- =====================================
-- TABELA TAREFAS
-- =====================================
CREATE TABLE Tarefas (
    id_tarefa INT PRIMARY KEY AUTO_INCREMENT,
    id_projeto INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT,
    status VARCHAR(20) NOT NULL,
    prazo DATE,
    FOREIGN KEY (id_projeto) REFERENCES Projetos(id_projeto)
);
