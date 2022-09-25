-- criação do banco de dados para modelo de E-commerce
-- drop database ecommerce;
create database ecommerce;

use ecommerce;

show tables;

-- criar a tabela cliente

create table clients (
idClient int auto_increment primary key,
Fname varchar(10),
Minit char(3),
Lname varchar(20),
CPF char(11) not null,
Address varchar(30),
constraint unique_cpf_client unique (CPF)
);

alter table clients auto_increment=1;



desc clients;

-- criar a tabela produto
-- size equivale  dimençãodoproduto
create table product (
idProduct int auto_increment primary key,
PName varchar(20),
Classification_Kids bool default false,
Category enum('Eletronico','Vestimenta','Brinquedos','Alimentos','Moveis') not null,
Avaliação float default 0,
size varchar(10)
);
desc product;

-- criar tabela pagamento
-- para ser continuado no desafio: termine de implementar a tabela e crie a conexão com as tabelas necessarias
-- alem disso, reflita essa modificação no diagrama de esquema relacional 


-- criar a tabela pedido

create table orders(
idOrder int auto_increment primary key,
idOrderClient int,
orderStatus enum('Cancelado', 'Confirmado','Em Processamento') default 'Em Processamento',
orderDescription varchar(255),
sendValue float default 10,
paymentCash bool default false,
constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
 on update cascade
);
desc orders;

-- criar a tabela estoque
create table productStorage(
idProductStorage int auto_increment primary key,
storagelocation varchar(255),
quantity int default 0
);


 -- criar a tabela fornecedor
 
create table supplier(
idsupplier int auto_increment primary key,
socialName varchar (255) not null,
CNPJ char(15)not null,
contact char(11) not null,
constraint unique_supplier unique (CNPJ)
);
desc supplier;

-- criar a tabela vendedor

create table Seller(
idSeller int auto_increment primary key,
socialName varchar(255) not null,
abstName varchar(255),
CNPJ char(15) not null,
CPF char(11) not null,
location varchar (255),
contact char(11) not null,
constraint unique_cnpj_seller unique (CNPJ),
constraint unique_cpf_seller unique (CPF)
);

desc seller;
alter table ecommerce.seller modify CNPJ char(15);
alter table ecommerce.seller modify CPF char(15);

-- criar tabela produto_fornecedor

create table productSeller(
idPSeller int,
idProduct int,
quantity int not null,
primary key(idPSeller, idProduct),
constraint fk_product_seller foreign key(idPSeller)references seller (idSeller),
constraint fk_product_product foreign key(idProduct) references product(idProduct)
);

desc productSeller;

create table productOrder(
idPOproduct int,
idPOorder int,
poQuantity int default 1,
poStatus enum('Disponivel','Sem estoque') default 'disponivel',
primary key(idPOproduct, idPOorder),
constraint fk_productorder_product foreign key(idPOproduct)references product (idProduct),
constraint fk_productorder_order foreign key(idPOorder) references orders (idOrder)
);


create table storageLocation(
idLproduct int,
idLstorage int,
location varchar(255) not null,
primary key(idLproduct,idLstorage),
constraint fk_storagelocation_product foreign key(idLproduct)references product(idProduct),
constraint fk_storagelocation_storage foreign key(idLstorage) references productStorage (idProductStorage)
);

create table productSupplier(
idPsSupplier int,
idPsProduct int,
quantity int not null,
primary key(idPsSupplier, idPsProduct),
constraint fk_productsupplier_supplier foreign key(idPsSupplier)references supplier(idsupplier),
constraint fk_productsupplier_product foreign key(idPsProduct) references product (idProduct)
);

show tables;

show databases;

use information_schema;

select * from referential_constraints;