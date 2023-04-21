use sucos;


ALTER TABLE tabela_de_vendedores ADD PRIMARY KEY (MATRICULA);



ALTER TABLE tabela_de_vendedores ADD COLUMN (DATA_ADMISSAO DATE,DE_FERIAS BIT);


UPDATE tabela_de_vendedores SET DATA_ADMISSAO = '2021-04-10'
WHERE MATRICULA = '00235';

UPDATE tabela_de_vendedores SET DE_FERIAS = 0
WHERE MATRICULA = '00235';


UPDATE tabela_de_vendedores SET DATA_ADMISSAO = '2020-03-07'
WHERE MATRICULA = '00236';

UPDATE tabela_de_vendedores SET DE_FERIAS = 0
WHERE MATRICULA = '00236';

UPDATE tabela_de_vendedores SET NOME = 'Mário Atrua Costa'
WHERE MATRICULA = '00237';

INSERT INTO tabela_de_vendedores (MATRICULA,NOME,PERCENTUAL_COMISSAO,DATA_ADMISSAO,DE_FERIAS) 
values ('00237','Mario ATRUAS COSTA',0.8,'2014-08-15',0);


INSERT INTO tabela_de_vendedores (MATRICULA,NOME,PERCENTUAL_COMISSAO,DATA_ADMISSAO,DE_FERIAS) 
values ('00238','Josiane Figueiredo Costa',0.8,'2013-09-17',1);

INSERT INTO tabela_de_vendedores (MATRICULA,NOME,PERCENTUAL_COMISSAO,DATA_ADMISSAO,DE_FERIAS) 
values ('00239','Roberta Martins',0.11,'2017-03-18',1), ('00240','Péricles Alves',0.11,'2016-08-21',0);




SELECT * FROM tabela_de_vendedores;







