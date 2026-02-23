- create database supermercado;
 
--create table cliente (
--id int not null,
--nome varchar(50) not null,
--cpf varchar(11) not null,
--constraint pk_id_cliente primary key (id)
--)
 
--create table produto(
--id int not null,
--descricao varchar(100) not null,
--cod_barras varchar(14),
--valor decimal(16,2)
--)
 
--alter table produto add constraint pk_id_produto primary key (id)
 
--alter table produto add column situacao boolean not null
 
--alter table produto alter column descricao type varchar(200)
 

insert into produto (id, descricao, cod_barras, valor, situacao)
values (2, 'cafe', '8721398123', 10.20, true )

insert into cliente (id, nome, cpf)
values (4, 'Zeca', '00100000000')

update cliente set nome = 'ax' where ID = 2

delete from produto where id = 1 or id = 4 or id = 6
 
select * from produto 

select 
    *
from     
    produto 
where 
    id = 1 
    
select
	id, descricao
from
	produto
order by id desc    
    
delete from produto;
insert into produto (id, descricao, cod_barras, valor, situacao )
values (5, 'Arroz', '8721398123', 10.20, true);
insert into produto (id, descricao, cod_barras, valor, situacao )
values (2, 'Cafe', '8721398123', 10.20, true);
insert into produto (id, descricao, cod_barras, valor, situacao )
values (3, 'Macarrao', '8721398123', 10.20, true);    
    
