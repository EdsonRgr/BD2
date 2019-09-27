use master
go

drop database AulaBD
go

create database AulaBD
go

use AulaBD
go

create table tb_clientes(
       id_cliente int PRIMARY KEY IDENTITY(1,1),
       nome nvarchar(50) not null
      )
go

create table tb_vendas(
       id_venda int primary key IDENTITY(1,1),
       id_cliente int not null
      )
        go
       
       create table tb_produtos(
       id_produtos int PRIMARY KEY IDENTITY(1,1),
       descricao nvarchar(50) not null
       )
       go

create table tb_produtos_vendido(
       id_produto_vendido int PRIMARY KEY identity(1,1),
       id_venda int not null,
       id_produtos int not null)
go

create table tb_vendas_canceladas(
       id_v_cancelada int primary key identity(1,1),
       id_venda int unique not null)
       go
    
    
    alter table tb_vendas
      ADD CONSTRAINT fk_vendas_cli
      FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente)
    go
    
    alter table tb_produtos_vendido
      ADD CONSTRAINT fk_produtos_vendidos
      FOREIGN KEY (id_produtos) REFERENCES tb_produtos(id_produtos)
      go
      
      alter table tb_produtos_vendido
      ADD CONSTRAINT fk_vendas
      FOREIGN KEY (id_venda) REFERENCES tb_vendas(id_venda)
      go
      
      alter table tb_vendas_canceladas
      ADD CONSTRAINT fk_cancelamentos
      FOREIGN KEY (id_v_cancelada) REFERENCES tb_vendas(id_venda)
      go
      
      alter table tb_vendas_canceladas
      ADD CONSTRAINT fk_vendas_canceladas
      FOREIGN KEY (id_venda) REFERENCES tb_vendas(id_venda)
      go
      
      
insert into tb_clientes values
        ('Roger'),
        ('Ana'),
        ('Celso'),
        ('Gustavo'); 
        go

insert into tb_produtos values
        ('relogio'),
        ('chinelo'),
        ('bombinha'),
        ('televisor'); 
        go
        
        insert into tb_vendas values
        ('1'),
        ('2'),
        ('1'),
        ('1')
       
        
        go
        
        insert into tb_produtos_vendido values
        ('1','1'),
        ('2','2'),
        ('3','1'),
        ('2','1')
        
         
        go
        
        insert into tb_vendas_canceladas values
        ('3'),
        ('4')
     
       
        go
        
        
        
     select * from tb_clientes
     select * from tb_produtos
     select * from tb_vendas
     select * from tb_produtos_vendido
     select * from tb_vendas_canceladas
        
        
        
    select * from tb_vendas as v
    join tb_clientes as c
    on v.id_cliente = c.id_cliente   
     
    go
        
	select c.id_cliente, c.nome
	 from tb_clientes as c
	LEFT JOIN tb_vendas as v
	on c.id_cliente = v.id_cliente
	where v.id_cliente is null 

	go

	select * 
	from tb_produtos as p
	left join tb_produtos_vendido as pv
	on p.id_produtos = pv.id_produtos
	where pv.id_produtos is null
	
	go
	
	select * from 
	tb_produtos_vendido as pv
	right join tb_produtos as p
	on pv.id_produtos = p.id_produtos
	where pv.id_produtos is null
	
go

