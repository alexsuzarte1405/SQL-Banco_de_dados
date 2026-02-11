-- Criação da tabela de clientes
CREATE TABLE cliente (
    id INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    CONSTRAINT pk_id_cliente PRIMARY KEY (id)
);

-- Criação da tabela de produtos
CREATE TABLE produto (
    id INT NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    cod_barras VARCHAR(14),
    valor DECIMAL(16,2)
);

-- Adicionando a chave primária em produto
ALTER TABLE produto ADD CONSTRAINT pk_id_produto PRIMARY KEY(id);

-- Adicionando a coluna de situação (status)
ALTER TABLE produto ADD COLUMN situacao BOOLEAN NOT NULL;

-- Aumentando o limite de caracteres da descrição
ALTER TABLE produto ALTER COLUMN descricao TYPE VARCHAR(200);

 