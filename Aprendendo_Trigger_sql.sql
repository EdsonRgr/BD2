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
       nome nvarchar(50) not null
      )
go

create table tb_cli_audit(
	   id_cli_audit int PRIMARY KEY IDENTITY(1,1),
       id_cliente_new int not null ,
       nome_new nvarchar(50) not null,
       data date
      )
go

alter table tb_cli_audit
      ADD CONSTRAINT fk_id_cli
      FOREIGN KEY (id_cliente_new) REFERENCES tb_clientes(id_cliente)
      go


insert into tb_clientes values
         ('Edson'),
         ('Gustavo'),
		('Roger');
        go


create trigger dataParaNovosClientes on tb_clientes 
for insert
as

			begin
			declare @cliId int;
			declare @cliNome varchar(100);
			declare @audit_action varchar(100);

			select @cliId=i.id_cliente from inserted i;
			select @cliNome=i.nome from inserted i;

			set @audit_action ='Registro inserido -- [inserindo o campo de data] .';

			insert into tb_cli_audit values (@cliId,@cliNome,getdate());
			end
go

insert into tb_clientes values
         ('Marcos'),
         ('Leo');
         go
         
        
        
         select * from tb_clientes;
		go
         select * from tb_cli_audit;
         go
         
        select * from tb_clientes as tb
		left join tb_cli_audit as tba
		on tb.nome = tba.nome_new   
		go