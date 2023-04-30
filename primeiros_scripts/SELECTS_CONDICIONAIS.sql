USE sucos_vendas;
## CONSULTAS SIMPLES CONDICIONAIS COM O MYSQL
SELECT * FROM tabela_de_clientes;

SELECT CPF AS IDENTIFICADOR, NOME AS CLIENTE FROM tabela_de_clientes;

SELECT * FROM tabela_de_produtos;

SELECT * FROM tabela_de_produtos WHERE CODIGO_DO_PRODUTO = '1000889';


SELECT * FROM tabela_de_produtos WHERE SABOR = 'Laranja';


select * FROM tabela_de_produtos WHERE EMBALAGEM = 'PET';


SELECT * FROM tabela_de_produtos WHERE PRECO_DE_LISTA > 19.50 AND PRECO_DE_LISTA < 19.52;

SELECT * FROM tabela_de_produtos WHERE PRECO_DE_LISTA between 19.49 AND 19.52;

##CONSULTAS CONDICIONAIS 


SELECT * FROM tabela_de_produtos WHERE SABOR = "MANGA"
OR TAMANHO = '470 ml';

SELECT * FROM tabela_de_produtos WHERE SABOR = "MANGA"
AND TAMANHO = '470 ml';


SELECT * FROM tabela_de_produtos WHERE NOT ( SABOR = "MANGA"
AND TAMANHO = '470 ml');

SELECT * FROM tabela_de_produtos WHERE NOT ( SABOR = "MANGA"
OR TAMANHO = '470 ml');

SELECT * FROM tabela_de_produtos WHERE SABOR = "MANGA"
AND NOT  (TAMANHO = '470 ml');


SELECT * FROM tabela_de_produtos WHERE SABOR IN ('Laranja','Manga');

##EQUIVALENTES AMBOS DE CIMA E DE BAIXO 
SELECT * FROM tabela_de_produtos WHERE SABOR = 'Laranja' OR SABOR = 'Manga';


SELECT * FROM tabela_de_clientes WHERE CIDADE IN ('Rio de Janeiro', 'São Paulo')
AND IDADE >= 20;


SELECT * FROM tabela_de_clientes WHERE CIDADE IN ('Rio de Janeiro', 'São Paulo')
AND (IDADE >= 20 AND IDADE <= 22);


## COMANDO LIKE 

###TRAZ TODOS QUE POSSUEM MAÇA NO NOME INDEPENDENTE DE ESTAR NO INICIO OU FIM DO TEXTO
SELECT * FROM tabela_de_produtos WHERE SABOR LIKE '%Maça%';


SELECT * FROM tabela_de_produtos WHERE SABOR LIKE '%Maça%' AND EMBALAGEM = 'PET';

###TRAZ SOMENTE OS QUE COMEÇAM COM MAÇA
SELECT * FROM tabela_de_produtos WHERE SABOR LIKE 'Maça%';

###TRAZ SOMENTE OS QUE TERMINAM COM MATTOS
SELECT * FROM tabela_de_clientes where NOME LIKE '%Mattos';



