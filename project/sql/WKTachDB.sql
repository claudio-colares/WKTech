CREATE DATABASE IF NOT EXISTS WKTechBD;
USE WKTechBD;

CREATE TABLE clientes (
    codigo INT PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    cidade VARCHAR(100),
    uf CHAR(2)
);

CREATE TABLE produtos (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(200) NOT NULL,
    preco_venda DECIMAL(10, 2) NOT NULL
);

CREATE TABLE pedidos (
    numero_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_emissao DATE NOT NULL,
    codigo_cliente INT NOT NULL,
    valor_total DECIMAL(15, 2) NOT NULL,
    FOREIGN KEY (codigo_cliente) REFERENCES clientes(codigo)
);

-- Criação da tabela de itens do pedido
CREATE TABLE itens_pedido (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    numero_pedido INT NOT NULL,
    codigo_produto INT NOT NULL,
    quantidade INT NOT NULL,
    valor_unitario DECIMAL(10, 2) NOT NULL,
    valor_total DECIMAL(15, 2) NOT NULL,
    FOREIGN KEY (numero_pedido) REFERENCES pedidos(numero_pedido) ON DELETE CASCADE,
    FOREIGN KEY (codigo_produto) REFERENCES produtos(codigo),
    INDEX idx_numero_pedido (numero_pedido),
    INDEX idx_codigo_produto (codigo_produto)
);
