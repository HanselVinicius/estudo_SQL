use sucos;


SELECT * FROM tbcliente;


#IDENTICO AO SELECT * FROM tbclientes
SELECT CPF, ENDERECO1, ENDERECO2, BAIRRO, CIDADE, ESTADO, CEP,
 DATA_NASCIMENTO, IDADE, SEXO, LIMITE_CREDITO,
 VOLUME_COMPRA, PRIMEIRA_COMPRA
 FROM tbcliente;
 
 
 SELECT CPF, NOME FROM tbcliente;
 
 
 SELECT CPF,NOME FROM tbcliente LIMIT 5;
 
 #ALIAS DE COLUNAS NO SQL 
 SELECT CPF AS CPF_CLIENTE, NOME AS NOME_CLIENTE FROM tbcliente;
 
 #A ORDEM NÃO IMPORTA
 SELECT NOME,CPF,SEXO,IDADE,DATA_NASCIMENTO from tbcliente;
 
 #slect na tabela de vendedores
 SELECT NOME,MATRICULA FROM tabela_de_vendedores;
 
 
 #Filtros no select
 
##condições no where 
SELECT * FROM tbcliente WHERE CIDADE = 'Rio de Janeiro';

SELECT * FROM tbproduto WHERE SABOR = 'Limão';

##updates com where, apos isso limão não retorna mais nada
UPDATE tbproduto SET SABOR = 'Cítricos' WHERE SABOR = 'Limão';

SELECT * FROM tbproduto WHERE SABOR = 'Cítricos';


SELECT * FROM tabela_de_vendedores WHERE NOME = 'Claudia Morais';

##FILTROS MENORES E IGUAIS
SELECT * FROM tbcliente WHERE IDADE > 22;
 
SELECT * FROM tbcliente WHERE IDADE < 22;
 
##diferente
SELECT * FROM tbcliente WHERE IDADE <> 22;

##O MAIOR PARA STRINGS NO SQL É POR ORDEM ALFABETICA
SELECT * FROM tbcliente WHERE NOME > 'Érica Carvalho';

SELECT * FROM tbcliente WHERE NOME <> 'Érica Carvalho';

## VALORES COM PONTO FLUTUANTE NÃO FUNCIONAM BEM COM COMANDO '=' E '<>'
SELECT * FROM tbproduto WHERE PRECO_LISTA = 16.008;

## PARA EXATIDÃO COM FLOATS PODEMOS USAR O BETWEEN
SELECT * FROM tbproduto WHERE PRECO_LISTA BETWEEN 16.007 AND 16.009;

SELECT * FROM tabela_de_vendedores WHERE PERCENTUAL_COMISSAO > 0.10; 

## DATAS

SELECT * FROM tbcliente WHERE DATA_NASCIMENTO = '1995-01-13';
## APOS E ANTES ESTA DATA 
SELECT * FROM tbcliente WHERE DATA_NASCIMENTO > '1995-01-13';

SELECT * FROM tbcliente WHERE DATA_NASCIMENTO < '1995-01-13';

## function year
SELECT * FROM tbcliente WHERE YEAR(DATA_NASCIMENTO) = '1995';

SELECT * FROM tbcliente WHERE month(DATA_NASCIMENTO) = '10';


SELECT * FROM tabela_de_vendedores WHERE year(DATA_ADMISSAO) >= '2016';


## FILTROS COMPOSTOS (AND)

SELECT * FROM tbproduto WHERE PRECO_LISTA >= 16.007 AND PRECO_LISTA <= 16.009;

SELECT * FROM tbcliente WHERE IDADE >= 18 AND IDADE <= 22;

SELECT * FROM tbcliente WHERE IDADE >= 18 AND IDADE <= 22 AND SEXO = 'M';


SELECT * FROM tbcliente WHERE CIDADE = 'Rio de Janeiro' OR BAIRRO = 'Jardins';



SELECT * FROM tbcliente WHERE (IDADE >= 18 AND IDADE <= 22 AND SEXO = 'M') OR 
CIDADE = 'Rio de Janeiro' OR BAIRRO = 'Jardins' ;


SELECT * FROM tabela_de_vendedores WHERE DE_FERIAS = 1 AND year(DATA_ADMISSAO) < '2016';





