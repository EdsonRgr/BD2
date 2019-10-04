use master
go

drop database CriandoTrigger
go

create database CriandoTrigger
go

use CriandoTrigger
go

create table tb_clientes(
       id_cliente int PRIMARY KEY IDENTITY(1,1),
       nome varchar(50) not null,
       endereco varchar(50) not null,
       fone bigint not null,
       email varchar (100) not null 
       )
go

create table tb_cli_audit(
	   id_cli_audit int PRIMARY KEY IDENTITY(1,1),
       id_cliente_new int not null ,
       nome_new nvarchar(50) not null,
       endereco_new varchar(50) not null,
       fone_new bigint not null,
       email varchar (100) not null,
       data date
      )
go

alter table tb_cli_audit
      ADD CONSTRAINT fk_id_cli
      FOREIGN KEY (id_cliente_new) REFERENCES tb_clientes(id_cliente)
      go


insert into tb_clientes(nome,endereco ,fone ,email) values
         ('Edson','Rua tal', 999999999, 'edson@gmail.com'),
         ('Eduardo','Rua tal2', 888888888, 'eduardo@gmail.com'),
		('Roger',' Ruatal3', 777777777, 'roger@gmail.com')
        go


create trigger dataParaNovosClientes on tb_clientes 
for insert
as

			begin
			declare @cliId int;
			declare @cliNome varchar(100);
			declare @cliEnd varchar (100);
			declare @cliFone int;
			declare @cliEmail varchar (100);
			declare @audit_action varchar(100);
			

			select @cliId=i.id_cliente from inserted i;
			select @cliNome=i.nome from inserted i;
			select @cliEnd=i.endereco from inserted i;
			select @cliFone=i.fone from inserted i;
			select @cliEmail=i.email from inserted i;
			

			set @audit_action ='Registro inserido -- [inserindo o campo de data] .';

			insert into tb_cli_audit values (@cliId,@cliNome,@cliEnd,@cliFone,@cliEmail,getdate());
			end
go

insert into tb_clientes values
         ('Gustavo','Rua de viadin', 999999999 , 'gustavo@gmail.com')
       
         go
         
        
        
         select * from tb_clientes;
		go
         select * from tb_cli_audit;
         go
         
        select * from tb_clientes as tb
		left join tb_cli_audit as tba
		on tb.nome = tba.nome_new   
		go