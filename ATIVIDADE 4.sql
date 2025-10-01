-- Criar e usar o banco de dados
CREATE DATABASE empresa_exemplo;

USE empresa_exemplo;

-- Tabela de Funcionários
CREATE TABLE funcionarios(
id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40) NOT NULL,
sobrenome VARCHAR(40) NOT NULL,
telefone VARCHAR(40) NOT NULL,
data_nascimento DATE,
endereco VARCHAR(80) NOT NULL,
data_contratacao DATE,
salario DECIMAL(7,2),
cargo VARCHAR(40) NOT NULL
);

-- Inserir dados na tabela funcionarios (Conforme fontes)
INSERT INTO funcionarios (nome, sobrenome, telefone, data_nascimento, endereco, data_contratacao, salario, cargo) VALUES
('Araújo', 'Catumbela', '1432222222', STR_TO_DATE('11/02/1994', '%d/%m/%Y'), 'Rua dos Bandeirantes 3-33', STR_TO_DATE('17/02/2013', '%d/%m/%Y'), 7200.00, 'Diretor Geral');

INSERT INTO funcionarios (nome, sobrenome, telefone, data_nascimento, endereco, data_contratacao, salario, cargo) VALUES
('Moisés', 'Mendrote', '144562222', STR_TO_DATE('26/07/1999', '%d/%m/%Y'), 'Rua 12 de julho 5-30', STR_TO_DATE('15/02/2015', '%d/%m/%Y'), 4500.00, 'Diretor Analista');

INSERT INTO funcionarios (nome, sobrenome, telefone, data_nascimento, endereco, data_contratacao, salario, cargo) VALUES
('Ana', 'Juliana', '14824222', STR_TO_DATE('02/03/2000', '%d/%m/%Y'), 'Rua 15 de outubro 6-12', STR_TO_DATE('17/05/2017', '%d/%m/%Y'), 3700.00, 'Diretor de Marketing');

-- Tabela de Produtos (para exemplos de faturamento e exercícios)
CREATE TABLE produtos (
id_produto INT PRIMARY KEY AUTO_INCREMENT,
nome_produto VARCHAR(100) NOT NULL,
preco_unitario DECIMAL(10, 2) NOT NULL,
estoque INT NOT NULL
);

INSERT INTO produtos (nome_produto, preco_unitario, estoque) VALUES
('Laptop Gamer', 7500.00, 15),
('Smartphone X', 2200.50, 50),
('Monitor Ultrawide', 1800.00, 20),
('Teclado Mecânico', 350.99, 100),
('Mouse Sem Fio', 120.00, 150);

-- Tabela de Vendas (para exemplos de faturamento e exercícios)
CREATE TABLE vendas (
id_venda INT PRIMARY KEY AUTO_INCREMENT,
id_produto INT NOT NULL,
quantidade_vendida INT NOT NULL,
data_venda DATE NOT NULL,
FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

INSERT INTO vendas (id_produto, quantidade_vendida, data_venda) VALUES
(1, 1, '2023-10-20'),
(2, 2, '2023-10-21'),
(3, 1, '2023-10-21'),
(4, 5, '2023-10-22'),
(2, 1, '2023-10-23'),
(5, 3, '2023-10-23'),
(1, 1, '2023-10-24');

-- Tabela de Clientes (para exemplos de limpeza de texto e exercícios)
CREATE TABLE clientes (
id_cliente INT PRIMARY KEY AUTO_INCREMENT,
nome_cliente VARCHAR(100) NOT NULL,
email VARCHAR(100)
);

INSERT INTO clientes (nome_cliente, email) VALUES
('João da Silva', 'joao.silva@email.com'),
('André Cardoso', 'andre.cardoso@email.com'),
('Júlia Pereira', 'julia.pereira@email.com'),
('Márcia Almeida', 'marcia.almeida@email.com'),
('Fábio Gonçalves', 'fabio.goncalves@email.com'),
('Luís Costa', 'luis.costa@email.com');


use empresa_exemplo;
drop function if exists calcular_preco_com_desconto;

delimiter //

create function calcular_preco_com_desconto(
preco_unitario decimal (10,2),
porcentagem_desconto decimal (5,2)

)

returns decimal (10,2)
deterministic
begin
	declare preco_final decimal (10,2);
    
    set preco_final = preco_unitario - (preco_unitario * porcentagem_desconto);
    
    return preco_final;
end//
delimiter    
SELECT nome_produto,preco_unitario,calcular_preco_com_desconto(preco_unitario, 0.15) AS preco_com_desconto
FROM produtos
WHERE nome_produto = 'Mouse Sem Fio';
