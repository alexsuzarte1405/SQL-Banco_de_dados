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

>#### **Chave Estrangeira**
- O que é Chave Estrangeira (Foreign Key)?
- A chave estrangeira é um campo de uma tabela que aponta para a chave primária de outra
tabela.
- Ela serve para criar relacionamento entre tabelas.
- Em outras palavras:
o A chave estrangeira é o que “liga” uma tabela à outra em um banco de dados relacional.

**Por que precisamos dela?**
  Sem chave estrangeira:
- As tabelas ficam isoladas
- Não há garantia de que os dados combinam
- Podem existir registros “órfãos” (sem relação real)
  Com chave estrangeira:
- O banco garante integridade dos dados
- Evita erros e inconsistências
- Representa relações do mundo real (cliente → pedido, aluno → matrícula, etc.)

**Exemplo prático - Tabela de Clientes**
|Id (PK) | Nome      |
|--------|-----------|
|1       |Ana Silva  |
|2       |João Souza |

**Exemplo prático - Tabela de Pedidos**
|Id (PK)  | clienteId   |  (FK) Total|
|---------|-------------|------------|
|1001     |   1         |        3500|
|1002     |   2         |         200|

**Normalização**
- Normalizar um banco de dados é organizar as informações para que cada dado exista apenas
uma vez, evitando repetição, erros e bagunça nas tabelas.

**Forma Não Normalizada (UNF)**
| OrderID  | CustomerName  | CustomerPhone |      Products Total         |
|----------|---------------|---------------|-----------------------------|
|   1001   | Ana Silva     |   9999-1111   |  Notebook, Mouse 3500       |
|   1002   | João Souza    |   9888-2222   |  Teclado 200                |
|   1003   | Ana Silva     |   9999-1111   |  Monitor, Cabo HDMI,Mouse   |

**Primeira Forma Normal (1FN)**
-Os campos devem ser atômicos (um único valor por célula).
|OrderID |CustomerName | CustomerPhone | Product Total |
|--------|-------------|---------------|---------------|
| 1001   |Ana Silva    | 9999-1111     | Notebook 3500 |
| 1001   |Ana Silva    | 9999-1111     | Mouse 3500    |
| 1002   |João Souza   | 9888-2222     | Teclado 200   |
| 1003   |Ana Silva    | 9999-1111     | Monitor 1200  |
| 1003   |Ana Silva    | 9999-1111     | Cabo HDMI 1200|
| 1003   |Ana Silva    | 9999-1111     | Mouse 1200    |

**Primeira Forma Normal (1FN)**
- Problema: Dados do cliente continuam duplicados.
- Total pertece APENAS ao pedido.
- Ainda existem dependências (responsabilidades) na mesma tabela.

**Segunda Forma Normal (2FN)**
- Regras: Deve estar na 1FN.
- Removemos dependências parciais.
- Cada entidade passa a ter sua própria tabela e ter sua própria
chave primária.
| CustomerID | Nome     | Telefone  |
|------------|----------|-----------|
|      1     |Ana Silva | 9999-1111 |
|      2     |João Souza| 9888-2222 |

|OrderID     |CustomerID|   Total   |
|------------|----------|-----------|
|  1001      |     1    |    3500   |
|  1002      |     2    |     200   |
|  1003      |     1    |    1200   |

| OrderID  |  Produto |
|----------|----------|
|   1001   | Notebook |
|   1001   | Mouse    |
|   1002   | Teclado  |
|   1003   | Monitor  |
|   1003   | Cabo HDMI|
|   1003   | Mouse    |

 **Problema:**
- Produto é um texto livre... está "solto".

**Terceira Forma Normal (3FN)**
Regras:
- Deve estar na 2FN.
- Remover dependências transitivas.
- Campos não-chave DEVEM depender apenas da chave.

| CustomerID |     Nome     | Telefone  |
|------------|--------------|-----------|
|     1      | Ana Silva    | 9999-1111 |
|     2      | João Souza   | 9888-2222 |

| ProductID  | NomeProduto  |
|------------|--------------|
|     10     | Notebook     |
|     11     | Mouse        |
|     12     | Teclado      |
|     13     | Monitor      |
|     14     | Cabo HDMI    |

| OrderID | CustomerID | Total |
|---------|------------|-------|
|  1001   |      1     | 3500  |
|  1002   |      2     |  200  |
|  1003   |      1     | 1200  |

| OrderID | ProductID |
|---------|-----------|
|   1001  |    10     |
|   1001  |    11     |
|   1002  |    12     |
|   1003  |    13     |
|   1003  |    14     |
|   1003  |    11     |

**Resultado**
-O banco de dados agora possui
- Ausência de redundância.
- Relacionamentos claros (Chaves Estrangeiras).
- Estrutura relacional correta.
- Melhor desempenho.
- Manutenção facilitada.
- Isso torna os bancos de dados
- Mais eficientes.
- Mais confiáveis.
- Mais fáceis de escalar.
- Mais fáceis de entender.

>#### **Linguagem SQL -Métodos de Combinação**
**JOINS (Adição de Colunas - Horizontal)**
 Conectamos tabelas lateralmente através de uma coluna comum (Chave).
- Inner Join: Apenas o que existe em ambas as tabelas.
- Left Join: Mantemos tudo da tabela à esquerda e trazemos o que houver da direita.
- Right Join: Mantemos tudo da direita e trazemos o que houver da esquerda.
- Full Join: Trazemos tudo de ambos os lados, independentemente de haver correspondência.

**Como Usamos Joins**
- Ao escrevermos um JOIN, devemos especificar a relação:
SELECT
TabelaA.Nome,
TabelaB.Pais

FROM
TabelaA INNER JOIN TabelaB ON TabelaA.id = TabelaB.id;

**Operadores SET (Adição de Linhas - Vertical)**
   Empilhamos resultados de consultas diferentes, desde que tenham a mesma estrutura de
colunas.
- UNION: Combina os resultados e remove duplicados.
- UNION ALL: Combina tudo, incluindo duplicados (é mais rápido).
- EXCEPT / MINUS: Mostra o que existe no primeiro conjunto mas não no segundo.
- INTERSECT: Mostra apenas o que é comum a ambos os conjuntos.

**Usamos Operadores SET**
SELECT
Nome

FROM
Clientes

UNION
SELECT
Nome

FROM
Funcionarios;

>#### **Funções de Linha Única no SQL**
O que são Funções SQL?
Definição: Conjuntos de instruções que recebem um ou mais valores de entrada e retornam
um valor de saída.

Utilidade:
Limpeza: Remover espaços extras ou caracteres indesejados.
Transformação: Alterar formatos de data ou converter textos.
Análise: Realizar cálculos rápidos por linha.

Processo: Entrada (Valor) -> FUNÇÃO -> Saída (Novo Valor)

>#### **Funções de Texto (String Functions)**
 Manipulação:
- CONCAT: Une duas ou mais strings (ex: Nome + Sobrenome).
- UPPER / LOWER: Converte o texto para MAIÚSCULO ou minúsculo.
- TRIM: Remove espaços em branco no início e no fim.
- REPLACE: Substitui um caractere ou trecho de texto por outro.
 Extração e Medida:
- LEN: Retorna a quantidade de caracteres.
- LEFT / RIGHT: Extrai caracteres a partir da esquerda ou direita.
- SUBSTRING: Extrai uma parte específica do texto de qualquer posição.

>#### Funções de Data e Hora (Date & Time)
Cálculos:
- DATEADD: Adiciona um intervalo (dias, meses, anos) a uma data.
- DATEDIFF: Calcula a diferença entre duas datas.
- Extração de Partes:
 YEAR, MONTH, DAY: Extraem o ano, mês ou dia numérico.
 DATENAME: Retorna o nome da parte da data (ex: "Janeiro", "Segunda-feira").
 Conversão:
- CAST / CONVERT: Alteram o tipo de dado (ex: de Texto para Data).
- FORMAT: Define como a data será exibida (ex: 'dd/MM/yyyy').

>#### Tratamento de Valores Nulos (NULL Functions)
Por que tratar nulos? Evitar erros em cálculos e garantir relatórios precisos.
Principais Funções:
- ISNULL(valor, substituto): Se o valor for nulo, substitui por outro.
- COALESCE(v1, v2, ...): Retorna o primeiro valor não nulo de uma lista.
- NULLIF(v1, v2): Retorna nulo se os dois valores forem iguais.
- IS NULL: Operador para filtrar registros sem dados.

>#### Lógica Condicional (CASE Statement)
O que é: Funciona como um "SE... ENTÃO" (IF... THEN) dentro do SQL.
Aplicações:
- Categorização: Se Venda > 1000 então 'Premium'.
- Padronização: Converter 'Alemanha' para 'DE', 'Brasil' para 'BR'.
Sintaxe Básica:
- CASE
- WHEN Condição THEN Resultado
- ELSE Resultado_Padrão
- END

>#### Funções Aninhadas (Nested Functions)
Conceito: Usar uma função como entrada para outra função.
Exemplo Prático:
- LEN(LOWER(LEFT('Maria', 2)))
- LEFT('Maria', 2) -> 'Ma'
- LOWER('Ma') -> 'ma'
- LEN('ma') -> Resultado Final: 2

>#### Conclusão
- Funções de linha única retornam um resultado para cada linha.
- Podem ser usadas no SELECT (para exibir), no WHERE (para filtrar) e no ORDER BY (para
ordenar).

>#### **Funções de Agregação**
O que são Funções de
Agregação?
- As funções de agregação processam um
conjunto de valores para retornar um único
valor resumido. Elas são essenciais para
transformar dados brutos em informações
estratégicas.

|Função      | Finalidade                             | Tipos de Dados Compatíveis |
|------------|----------------------------------------|----------------------------|
|COUNT       | Conta o número de registros (linhas).  | Qualquer tipo              |
|SUM         | Soma os valores de uma coluna          | Apenas Numéricos           |
|AVG         | Calcula a média aritméticados valores  | Apenas Numéricos           |
|MAX         | Identifica o valor máximo (maior).     | Numéricos, Datas e Texto   |
|MIN         | Identifica o valor mínimo (menor).     | Numéricos, Datas e Texto   |

**Cláusula GROUP BY (Agrupamento)**
- A cláusula GROUP BY é utilizada para organizar linhas que possuem valores idênticos em
grupos. Ela é quase sempre utilizada em conjunto com as funções de agregação mencionadas
acima.
- Condensação de Registros: A principal função do GROUP BY é reduzir (achatar) múltiplos
registros em uma única linha de resumo por grupo.
- Cálculos em Nível de Grupo: Ao contrário de uma conta simples no banco de dados inteiro, o
agrupamento permite realizar Cálculos de Nível de Grupo (ex: calcular o faturamento total por
categoria de produto em vez do faturamento total da loja).
**Exemplo Prático**
Se você tem uma tabela de vendas e usa GROUP BY regiao, o SQL pegará todas as vendas de
"Sul", "Norte" e "Leste" e entregará apenas uma linha para cada região com os totais
somados.

