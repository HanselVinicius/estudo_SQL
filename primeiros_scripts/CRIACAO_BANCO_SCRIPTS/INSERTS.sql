### INSERTS DE DADOS

USE vendas_sucos;

INSERT INTO tabela_de_produtos 
(
CODIGO,
DESCRITOR,
SABOR,
TAMANHO,
EMBALAGEM,
PRECO_LISTA
)VALUES('1040107','Light - 350 ml - Melância','Melância','350 ml','Lata',4.56);


SELECT * FROM tabela_de_produtos;

INSERT INTO tabela_de_produtos 
(
CODIGO,
DESCRITOR,
SABOR,
TAMANHO,
EMBALAGEM,
PRECO_LISTA
)VALUES('1040108','Light - 350 ml - Graviola','Graviola','350 ml','Lata',4.00);

SELECT * FROM tabela_de_produtos;



INSERT INTO tabela_de_produtos 
VALUES('1040109','Light - 350 ml - Açai','Açai','350 ml','Lata',5.00);

INSERT INTO tabela_de_produtos 
VALUES('1040110','Light - 350 ml - Jaca','Jaca','350 ml','Lata',6.00),
('1040111','Light - 350 ml - Manga','Manga','350 ml','Lata',3.50);



INSERT INTO tabela_de_clientes 
VALUES 
('2600586709','César Teixeira','Rua Conde de Bonfim','Tijuca','RJ','Rio de Janeiro','22020001','20000312',18,120000,22000,0,'M');


SELECT * FROM tabela_de_clientes;


UPDATE tabela_de_clientes SET SEXO = 'F';

ALTER TABLE tabela_de_clientes ADD  SEXO CHAR;



SELECT * FROM sucos_vendas.tabela_de_produtos;

SELECT CODIGO_DO_PRODUTO AS CODIGO, NOME_DO_PRODUTO AS DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA AS PRECO_LISTA FROM sucos_vendas.tabela_de_produtos 
WHERE CODIGO_DO_PRODUTO NOT IN (SELECT CODIGO FROM vendas_sucos.tabela_de_produtos);

SELECT CODIGO FROM vendas_sucos.tabela_de_produtos WHERE CODIGO = '1000889' ;


SELECT * FROM vendas_sucos.tabela_de_produtos;

INSERT INTO vendas_sucos.tabela_de_produtos SELECT CODIGO_DO_PRODUTO AS CODIGO, NOME_DO_PRODUTO AS DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA AS PRECO_LISTA FROM sucos_vendas.tabela_de_produtos 
WHERE CODIGO_DO_PRODUTO NOT IN (SELECT CODIGO FROM vendas_sucos.tabela_de_produtos);

SELECT * FROM sucos_vendas.tabela_de_clientes;

SELECT * FROM vendas_sucos.tabela_de_clientes;

SELECT CPF,NOME,ENDERECO_1 AS ENDERECO,BAIRRO,ESTADO,CIDADE,CEP,DATA_DE_NASCIMENTO,IDADE,LIMITE_DE_CREDITO AS LIMITE_CREDITO,
VOLUME_DE_COMPRA AS VOLUME_COMPRA,PRIMEIRA_COMPRA,SEXO FROM sucos_vendas.tabela_de_clientes
 WHERE CPF NOT IN (SELECT CPF FROM VENDAS_SUCOS.TABELA_DE_CLIENTES);

INSERT INTO vendas_sucos.tabela_de_clientes SELECT CPF,NOME,ENDERECO_1 AS ENDERECO,BAIRRO,ESTADO,CIDADE,CEP,DATA_DE_NASCIMENTO,IDADE,LIMITE_DE_CREDITO AS LIMITE_CREDITO,
VOLUME_DE_COMPRA AS VOLUME_COMPRA,PRIMEIRA_COMPRA,SEXO FROM sucos_vendas.tabela_de_clientes
 WHERE CPF NOT IN (SELECT CPF FROM VENDAS_SUCOS.TABELA_DE_CLIENTES);


SELECT * FROM vendas_sucos.tabela_de_clientes;

SELECT * FROM tabela_de_clientes;


