

# JOINS NO SQL

SELECT * FROM tabela_de_vendedores;

SELECT * FROM notas_fiscais;

SELECT * FROM tabela_de_vendedores A INNER JOIN notas_fiscais B 
ON A.MATRICULA = B.MATRICULA;

SELECT A.MATRICULA, A.NOME, COUNT(*) 
FROM tabela_de_vendedores A INNER JOIN notas_fiscais B 
ON A.MATRICULA = B.MATRICULA
group by A.MATRICULA, A.NOME;


SELECT A.MATRICULA, A.NOME, COUNT(*) 
FROM tabela_de_vendedores A ,notas_fiscais B 
WHERE A.MATRICULA = B.MATRICULA
group by A.MATRICULA, A.NOME;

SELECT YEAR(DATA_VENDA), SUM(QUANTIDADE * PRECO) AS FATURAMENTO
FROM itens_notas_fiscais INF INNER JOIN notas_fiscais NF
ON NF.NUMERO = INF.NUMERO
GROUP BY (DATA_VENDA);


SELECT NUMERO, NOME 
FROM tabela_de_clientes CLI INNER JOIN  notas_fiscais NF  
ON CLI.CPF = NF.CPF;

SELECT EMBALAGEM, MAX(PRECO) AS MAIOR
FROM tabela_de_produtos PR INNER JOIN itens_notas_fiscais NF
ON PR.CODIGO_DO_PRODUTO = NF.CODIGO_DO_PRODUTO 
GROUP BY (EMBALAGEM);


SELECT * FROM notas_fiscais WHERE DATA_VENDA = YEAR(2016);

## LEFT JOIN : TODOS DA TABELA DA ESQUERDA E ALGUNS DA TABELA DA DIREITA


SELECT COUNT(*) FROM tabela_de_clientes;


SELECT CPF , COUNT(*) FROM notas_fiscais GROUP BY CPF;


SELECT DISTINCT A.CPF, A.NOME,B.CPF FROM tabela_de_clientes A
INNER JOIN notas_fiscais B 
ON A.CPF = B.CPF;

## CONSEGUIMOS VER QUE FABIO CARVALHO É UM CLIENTE QUE NÃO COMPROU SUCOS 
SELECT DISTINCT A.CPF, A.NOME,B.CPF FROM tabela_de_clientes A
LEFT JOIN notas_fiscais B 
ON A.CPF = B.CPF
WHERE B.CPF IS NULL;


SELECT DISTINCT A.CPF, A.NOME,B.CPF FROM tabela_de_clientes A
LEFT JOIN notas_fiscais B 
ON A.CPF = B.CPF
WHERE B.CPF IS NULL AND YEAR(B.DATA_VENDA) = 2015;

## TRAZ TUDO O QUE TEM NA TABELA DIREITA E SE NÃO TIVER REGISTRO NA ESQUERDA IGNORA 
SELECT DISTINCT A.CPF, A.NOME,B.CPF FROM tabela_de_clientes A
RIGHT JOIN notas_fiscais B 
ON A.CPF = B.CPF;

SELECT DISTINCT A.CPF, A.NOME,B.CPF FROM notas_fiscais B 
RIGHT JOIN tabela_de_clientes A
ON A.CPF = B.CPF
WHERE B.CPF IS NULL;

SELECT P.CODIGO_DO_PRODUTO,N.PRECO FROM tabela_de_produtos P 
RIGHT JOIN itens_notas_fiscais N
ON P.PRECO_DE_LISTA = N.PRECO;
 
 ## FULL E CROSS JOIN 
 
 SELECT * FROM tabela_de_vendedores;
 
SELECT * FROM tabela_de_clientes;

SELECT tabela_de_vendedores.BAIRRO, tabela_de_vendedores.NOME,DE_FERIAS,
tabela_de_clientes.BAIRRO,tabela_de_clientes.NOME FROM 
tabela_de_vendedores INNER JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

SELECT tabela_de_vendedores.BAIRRO, tabela_de_vendedores.NOME,DE_FERIAS,
tabela_de_clientes.BAIRRO,tabela_de_clientes.NOME FROM 
tabela_de_vendedores LEFT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

SELECT tabela_de_vendedores.BAIRRO, tabela_de_vendedores.NOME,DE_FERIAS,
tabela_de_clientes.BAIRRO,tabela_de_clientes.NOME FROM 
tabela_de_vendedores RIGHT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

SELECT 
tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME,
DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME FROM 
tabela_de_vendedores FULL JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

SELECT 
tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME,
DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME FROM 
tabela_de_vendedores FULL JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;


## FULL JOIN NO MYSQL
SELECT tabela_de_vendedores.BAIRRO, tabela_de_vendedores.NOME,DE_FERIAS,
tabela_de_clientes.BAIRRO,tabela_de_clientes.NOME FROM 
tabela_de_vendedores LEFT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO
UNION
SELECT tabela_de_vendedores.BAIRRO, tabela_de_vendedores.NOME,DE_FERIAS,
tabela_de_clientes.BAIRRO,tabela_de_clientes.NOME FROM 
tabela_de_vendedores RIGHT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;



SELECT 
tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME,
DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME FROM 
tabela_de_vendedores , tabela_de_clientes;

## JUNTANDO CONSULTAS COM UNION 

### O UNION FUNCIONA JA TENDO UM DISTINCT INDIRETAMENTE 
SELECT DISTINCT BAIRRO FROM tabela_de_clientes
UNION
SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

### JA O UNION ALL NÃO POSSUI ESTE DISTINCT 
SELECT DISTINCT BAIRRO FROM tabela_de_clientes
UNION ALL
SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

SELECT DISTINCT BAIRRO,NOME, 'CLIENTE' AS TIPO FROM tabela_de_clientes
UNION 
SELECT DISTINCT BAIRRO, NOME, 'VENDEDOR' AS TIPO FROM tabela_de_vendedores;


SELECT DISTINCT BAIRRO,NOME, 'CLIENTE' AS TIPO FROM tabela_de_clientes
UNION 
SELECT DISTINCT BAIRRO, NOME, 'VENDEDOR' AS TIPO FROM tabela_de_vendedores;

### UNIONS PRECISAM TER O MESMO NUMERO DE COLUNAS
SELECT DISTINCT BAIRRO,NOME, 'CLIENTE' AS TIPO, CPF AS IDENTIFICADOR FROM tabela_de_clientes
UNION 
SELECT DISTINCT BAIRRO, NOME, 'VENDEDOR' AS TIPO,MATRICULA FROM tabela_de_vendedores;


### SUBCONSULTAS 

SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

## JUNTA AS CONSULTAS DEIXANDO O CODIGO MENOS HARDCODED
SELECT * FROM tabela_de_clientes WHERE BAIRRO 
IN (SELECT DISTINCT BAIRRO FROM tabela_de_vendedores);

### A CONSULTA SE TORNA UMA ESPECIE DE TABELA PODENDO SER USADA NO FROM 
SELECT X.EMBALAGEM, X.PRECO_MAXIMO FROM 
(SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAXIMO FROM tabela_de_produtos
GROUP BY EMBALAGEM) X WHERE X.PRECO_MAXIMO >= 10;


  SELECT CPF, COUNT(*) FROM notas_fiscais
  WHERE YEAR(DATA_VENDA) = 2016
  GROUP BY CPF
  HAVING COUNT(*) > 2000;

SELECT Y.CPF, Y.CPFS FROM
(SELECT CPF, COUNT(*) AS CPFS FROM notas_fiscais 
WHERE YEAR(DATA_VENDA) = 2016 GROUP BY CPF) Y WHERE Y.CPFS > 2000;

## VIEWS DO SQL


SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO FROM tabela_de_produtos
GROUP BY EMBALAGEM;

## fazemos desta regra de negocio de consulta uma nova "tabela" para 
SELECT X.EMBALAGEM, X.MAIOR_PRECO FROM
(SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO FROM tabela_de_produtos
GROUP BY EMBALAGEM) X WHERE X.MAIOR_PRECO > 10;


SELECT X.EMBALAGEM, X.MAIOR_PRECO FROM
vw_maiores_embalagens X WHERE X.MAIOR_PRECO > 10;

SELECT A.NOME_DO_PRODUTO, A.PRECO_DE_LISTA, A.EMBALAGEM, B.MAIOR_PRECO,
((A.PRECO_DE_LISTA/B.MAIOR_PRECO) -1) * 100 AS PERCENTUAL
FROM tabela_de_produtos A INNER JOIN vw_maiores_embalagens B 
ON A.EMBALAGEM = B.EMBALAGEM