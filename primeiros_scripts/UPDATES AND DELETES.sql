## ALTERANDO E EXCLUINDO REGISTROS


SELECT * FROM tabela_de_produtos;


UPDATE tabela_de_produtos SET PRECO_LISTA = 5 WHERE CODIGO = '1000889';



UPDATE tabela_de_produtos SET EMBALAGEM = 'PET', TAMANHO = '1 listro', DESCRITOR =
'Sabor da Montanha - 1 Litro - Uva' WHERE CODIGO = '1000889';


SELECT * FROM tabela_de_produtos WHERE SABOR = 'Maracujá';


UPDATE tabela_de_produtos SET PRECO_LISTA = PRECO_LISTA * 1.10 WHERE SABOR = 'Maracujá';

SELECT * FROM tabela_de_clientes WHERE CPF = '19290992743';

UPDATE tabela_de_clientes SET ENDERECO = 'R. Jorge Emílio 23', BAIRRO = 'Santo Amaro', CIDADE = 'São Paulo', ESTADO = 'SP', CEP = '8833223' WHERE CPF = '19290992743';

SELECT * FROM tabela_de_vendedores;

SELECT * FROM sucos_vendas.tabela_de_vendedores;


SELECT * FROM tabela_de_vendedores A 
INNER JOIN sucos_vendas.tabela_de_vendedores B 
ON A.MATRICULA = substring(B.MATRICULA,3,3);

UPDATE tabela_de_vendedores A INNER JOIN sucos_vendas.tabela_de_vendedores B 
ON A.MATRICULA = substring(B.MATRICULA,3,3) SET A.FERIAS = B.DE_FERIAS;


SELECT A.CPF FROM tabela_de_clientes A
INNER JOIN tabela_de_vendedores B
ON A.BAIRRO = B.BAIRRO;

SELECT * FROM tabela_de_clientes;

UPDATE tabela_de_clientes A INNER JOIN tabela_de_vendedores B
ON A.BAIRRO = B.BAIRRO SET VOLUME_COMPRA = VOLUME_COMPRA * 1.30;

### DELETANDO DADOS


SELECT * FROM tabela_de_produtos WHERE SUBSTRING(DESCRITOR, 1, 15) = 'Sabor dos Alpes';


DELETE FROM tabela_de_produtos WHERE TAMANHO = '1 Litro' AND 
SUBSTRING(DESCRITOR, 1, 15) = 'Sabor dos Alpes' ;

SELECT CODIGO_DO_PRODUTO FROM sucos_vendas.TABELA_DE_PRODUTOS;

SELECT CODIGO FROM tabela_de_produtos WHERE 
CODIGO NOT IN (SELECT CODIGO_DO_PRODUTO FROM sucos_vendas.TABELA_DE_PRODUTOS);

DELETE FROM tabela_de_produtos WHERE
 CODIGO NOT IN (SELECT CODIGO_DO_PRODUTO FROM sucos_vendas.TABELA_DE_PRODUTOS);
 
 
 SELECT A.NUMERO FROM NOTAS A
 INNER JOIN tabela_de_clientes B ON A.CPF = B.CPF
 WHERE B.IDADE <= 18;

DELETE A FROM NOTAS A INNER JOIN tabela_de_clientes B ON A.CPF = B.CPF WHERE B.IDADE<= 18;



CREATE TABLE `tabela_de_produtos2` (
  `CODIGO` varchar(10) NOT NULL,
  `DESCRITOR` varchar(100) DEFAULT NULL,
  `SABOR` varchar(50) DEFAULT NULL,
  `TAMANHO` varchar(50) DEFAULT NULL,
  `EMBALAGEM` varchar(50) DEFAULT NULL,
  `PRECO_LISTA` float DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ;


INSERT INTO tabela_de_produtos2
SELECT * FROM tabela_de_produtos;

SELECT * FROM tabela_de_produtos2;

UPDATE tabela_de_produtos2 SET PRECO_LISTA = 8;


DELETE FROM tabela_de_produtos2;


DELETE FROM NOTAS;

DELETE FROM ITENS_NOTAS;

### commit e rollbacks 

START TRANSACTION;

SELECT * FROM TABELA_DE_VENDEDORES;

UPDATE tabela_de_vendedores SET COMISSAO = COMISSAO * 1.15;

ROLLBACK;

COMMIT;


START TRANSACTION;

DROP TABLE tabela_de_produtos2;

COMMIT;

INSERT INTO `vendas_sucos`.`tabela_de_vendedores`
(`MATRICULA`,
`NOME`,
`BAIRRO`,
`COMISSAO`,
`DATA_ADMISSAO`,
`FERIAS`)
VALUES
('99999',
'JOAO DA SILVA',
'Icaraí',
'0.08',
'2012-01-15',
0);

SELECT * FROM tabela_de_vendedores;




INSERT INTO `vendas_sucos`.`tabela_de_vendedores`
(`MATRICULA`,
`NOME`,
`BAIRRO`,
`COMISSAO`,
`DATA_ADMISSAO`,
`FERIAS`)
VALUES
('99995',
'JOAO DA SILVA2',
'Icaraí',
'0.08',
'2012-01-15',
0);

ROLLBACK;


COMMIT;


