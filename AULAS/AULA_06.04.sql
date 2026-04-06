CREATE TABLE Cliente (
Cod_CLI	INTEGER NOT NULL,
Nome_CLI	VARCHAR(20),
Fone	VARCHAR(15),
Endereco_CLI	VARCHAR(30),
Cidade	VARCHAR(20),
CEP	CHAR(10),
UF	CHAR(2),
CGC	CHAR(20),
InscE	CHAR(10));

CREATE TABLE Pedido (
Num_PED	INTEGER NOT NULL,
Data_PED	DATE,
prazo_entrega	DATE,
Cod_CLI	INTEGER,
Cod_VEND	INTEGER );

CREATE TABLE Vendedor (
Cod_VEND	INTEGER NOT NULL,
Nome_VEND	VARCHAR(20),
Salario	DECIMAL(7,2),
faixa_comissao	CHAR(1));

CREATE TABLE Produto (
Cod_PROD	INTEGER NOT NULL,
Desc_PROD	VARCHAR(30),
Unidade	CHAR(10),
Valor_PROD	DECIMAL(7,2));

CREATE TABLE Itens_pedido (
Num_PED	INTEGER NOT NULL,
Cod_PROD	INTEGER NOT NULL,
Quantidade	INTEGER );

ALTER TABLE Cliente ADD PRIMARY KEY(Cod_CLI); 
ALTER TABLE Pedido ADD PRIMARY KEY(Num_PED); ALTER TABLE Vendedor ADD PRIMARY KEY(Cod_VEND); 
ALTER TABLE Produto ADD PRIMARY KEY(Cod_PROD);
ALTER TABLE Itens_pedido ADD PRIMARY KEY(Num_PED,Cod_PROD);

ALTER TABLE Pedido ADD FOREIGN KEY(Cod_CLI) REFERENCES Cliente(Cod_Cli);

ALTER TABLE Pedido ADD FOREIGN KEY(Cod_VEND) REFERENCES Vendedor(Cod_Vend); ALTER TABLE Itens_pedido ADD FOREIGN KEY(Num_PED) REFERENCES Pedido(Num_PED);
ALTER TABLE Itens_pedido ADD FOREIGN KEY(Cod_PROD) REFERENCES Produto(Cod_Prod);










--Inserir dados na tabela cliente
insert into cliente values ('1','Maria Santana', '11-2434 4567',null, 'São Paulo','01345-456','SP', null,'2345');
insert into cliente values ('4','Mario Vieira', '41-4567 5675',null, 'Curitiba','45045-011','PR', null,'6547');
insert into cliente values ('5','Joana Bandeira', null,'Rua Dois, 1456', 'Fortaleza',null,'CE', null,'5634');
insert into cliente values ('2','Pedro Gomes', null,'Rua Pinheiros, 456', 'Curitiba',null,'PR', null,null);
insert into cliente values ('3','Carla Dias', '11-98740049','Rua Diva, 678', 'São Paulo',null,'SP', null,null);

insert into vendedor values ('5','Joaquim Silva',200.05,'C');
insert into vendedor values ('3','Andre Moura',240.10,'C');
insert into vendedor values ('2','Valter Abreu',400.05,'B');
insert into vendedor values ('1','Mariana Paes',800.15,'A');
insert into vendedor values ('6','João Lins',670.15,'A');

insert into Produto values ('123','Manteiga','kg',1.40);
insert into Produto values ('6','Chocolate','kg',2.40);
insert into Produto values ('8','Leite','L',1.56);
insert into Produto values ('17','Farinha','kg',1.01);
insert into Produto values ('4','Cartolina','folha',0.40);

insert into pedido values('6','2020-10-10','2020-11-10','2','5');
insert into pedido values('5','2020-10-05','2020-10-22','3','6');
insert into pedido values('4','2020-10-04','2020-10-14','1','3');
insert into pedido values('7','2020-10-15','2020-10-25','3','5');
insert into pedido values('3','2020-09-03','2020-09-10','2','6');

insert into itens_pedido values(6, 123, 10);
insert into itens_pedido values(6, 6, 30);
insert into itens_pedido values(6, 8, 20);
insert into itens_pedido values(5, 17, 121);
insert into itens_pedido values(5, 6, 35);
insert into itens_pedido values(4, 8, 10);
insert into itens_pedido values(7, 8, 20);
insert into itens_pedido values(7, 17, 20);
insert into itens_pedido values(7, 4, 20);
insert into itens_pedido values(3, 123, 15);
insert into itens_pedido values(3, 6, 20);
insert into itens_pedido values(3, 17, 30);
insert into itens_pedido values(3, 8, 50);
insert into itens_pedido values(3, 4, 25);

--Listar todos os produtos com respectivas descrições, unidades e valores unitários
SELECT * FROM Produto

--Listar todo o conteúdo de vendedor.
SELECT * FROM Vendedor

--Quais os clientes que moram em Curitiba?
SELECT * FROM Cliente WHERE Cidade= 'Curitiba'

--Quais os pedidos que têm quantidade de itens maior que 20?
SELECT * FROM Itens_pedid

-- Listar os produtos que têm unidade igual a ‘kg’ e valor unitário igual a R$1,40.
SELECT * FROM Produto
WHERE Unidade = 'kg' AND Valor_PROD = 1.40

--Listar os produtos e seus códigos que tenham o valor unitário na faixa de R$0,32 e R$ 2,50
SELECT * FROM Produto
WHERE Valor_PROD BETWEEN 0.32 AND 2.50

--Listar os produtos que tenham a sua unidade iniciando por ‘k’
SELECT * FROM Produto
WHERE Desc_PROD LIKE 'K%'

--Verificar os vendedores cujo nome possui 9 letras.
SELECT * FROM Vendedor
WHERE LEN (Nome_VEND) = 9

--Verificar os vendedores que são da faixa de comissão A e B.
SELECT * FROM Vendedor
WHERE faixa_comissao IN ('A', 'B')

--Mostrar os clientes que não têm inscrição estadual.
SELECT * FROM Cliente
WHERE InscE IS NULL

--Mostrar em ordem alfabética a lista de vendedores e seus salários fixos.
SELECT Nome_VEND, Salario 
FROM Vendedor
ORDER BY Nome_VEND

--Apresentar a descrição e valor unitário dos produtos que tenham a unidade ‘kg’, em ordem do valor unitário descendente.
SELECT Desc_PROD, Valor_PROD
FROM Produto
WHERE Unidade = 'Kg'
ORDER BY Valor_PROD DESC

--
