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

create table tb_vendas_produtos(
       id_produto_vendido int PRIMARY KEY identity(1,1),
       id_venda int not null,
       id_produtos int not null)
go

create table tb_vendas_canceladas(
       id_v_cancelada int unique identity(1,1),
       id_venda int not null)
       go
    
    
    alter table tb_vendas
      ADD CONSTRAINT fk_vendas_cli
      FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente)
    go
    
    alter table tb_vendas_produtos
      ADD CONSTRAINT fk_produtos_vendidos
      FOREIGN KEY (id_produtos) REFERENCES tb_produtos(id_produtos)
      go
      
      alter table tb_vendas_produtos
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
        ('2'),
        ('4'),
        ('1'),
        ('3'); 
        go
        
        insert into tb_vendas_produtos values
        ('1','2'),
        ('2','3'),
        ('3','4'),
        ('4','1'); 
        go
        
        insert into tb_vendas_canceladas values
        ('4');
        go
        
        
        
     select * from tb_clientes
     select * from tb_vendas
     select * from tb_produtos
     select * from tb_vendas_produtos
     select * from tb_vendas_canceladas
        
        
        
        
        
        




