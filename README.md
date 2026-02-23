## 1. CRIAÇÃO DO BANCO E ESTRUTURA (DDL)

>CREATE DATABASE supermercado;

- Criando tabela de cliente

>CREATE TABLE cliente (
    id INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    CONSTRAINT pk_id_cliente PRIMARY KEY (id)
);

- Criando tabela de produto

>CREATE TABLE produto (
    id INT NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    cod_barras VARCHAR(14),
    valor DECIMAL(16,2)
);

- Alterações na tabela de produto

>ALTER TABLE produto ADD CONSTRAINT pk_id_produto PRIMARY KEY (id);
ALTER TABLE produto ADD COLUMN situacao BOOLEAN NOT NULL;
ALTER TABLE produto ALTER COLUMN descricao TYPE VARCHAR(200);


## 2. INSERÇÃO E MANIPULAÇÃO DE DADOS (DML)
>INSERT INTO produto (id, descricao, cod_barras, valor, situacao)
VALUES (2, 'cafe', '8721398123', 10.20, true);
>
>INSERT INTO cliente (id, nome, cpf)
VALUES (4, 'Zeca', '00100000000');
>
>Atualização e Deleção
UPDATE cliente SET nome = 'ax' WHERE id = 2;
DELETE FROM produto WHERE id = 1 OR id = 4 OR id = 6;


## 3. CONSULTAS (DQL)
>SELECT * FROM produto;
>
>SELECT * FROM produto WHERE id = 1;
>
>SELECT id, descricao 
FROM produto 
ORDER BY id DESC;


## 4. RESET E NOVAS INSERÇÕES
>DELETE FROM produto;
>
>INSERT INTO produto (id, descricao, cod_barras, valor, situacao)
VALUES (5, 'Arroz', '8721398123', 10.20, true);
>
>INSERT INTO produto (id, descricao, cod_barras, valor, situacao)
VALUES (2, 'Cafe', '8721398123', 10.20, true);
>
>INSERT INTO produto (id, descricao, cod_barras, valor, situacao)
VALUES (3, 'Macarrao', '8721398123', 10.20, true);


![SQL](http://www.juracyalmeida.com/wp-content/uploads/2018/05/SQL-O-que-%C3%A9-DDL-DML-DCL.png)

## Linguagem SQL (Structured Query Language) 
Utilizada para interagir com bancos de dados relacionais. 

**As siglas e os respectivos comandos mostrados na imagem significam:**

>#### **DQL – Data Query Language** (Linguagem de Consulta de Dados)
Focada na recuperação e visualização de informações armazenadas. 

- **SELECT**: É o principal comando para extrair e consultar registros das tabelas.  

>#### **DML – Data Manipulation Language** (Linguagem de Manipulação de Dados)
Utilizada para gerenciar os dados dentro dos objetos do banco.
- **INSERT**: Adiciona novos registros (linhas) a uma tabela.
- **UPDATE**: Altera ou modifica valores de registros já existentes.
- **DELETE**: Remove linhas ou registros específicos de uma tabela. 

>#### **DDL – Data Definition Language** (Linguagem de Definição de Dados)
Serve para definir, alterar ou remover a estrutura (esquema) do banco de dados. 

- **CREATE**: Cria novos objetos, como bancos de dados, tabelas ou índices.
- **ALTER**: Modifica a estrutura de um objeto já existente (ex: adicionar uma coluna).
- **DROP**: Exclui permanentemente objetos (tabelas, bancos, etc.) do sistema. 

>#### **DCL – Data Control Language** (Linguagem de Controle de Dados)
Gerencia a segurança e permissões de acesso aos dados. 
- **GRANT**: Concede privilégios ou acessos específicos a um usuário ou perfil.
- **REVOKE**: Retira permissões que foram concedidas anteriormente.

[def]: image-1.png
