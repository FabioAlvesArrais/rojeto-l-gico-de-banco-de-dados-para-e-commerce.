use ecommerce;
show tables;

-- tabela client  Fname, Minit, Lname, CPF, Address
insert into clients (Fname, Minit, Lname, CPF, Address)
	values ('Maria','N','Nucc','12345678921','rua fulano, 10, itaqua'),
			('luiz','A','Alves','62344478912','rua beotrano, 20, itaqua'),
            ('Fabio','A','Nucc','22343378910','rua Cicrano, 385,e itaqua'),
            ('Carol','M','Silva','12700678909','rua Cicrano, 384, itaqua'),
            ('Felipe','S','Alves','33545678901','rua Seila, 80, itaqua'),
            ('Rosana','N','Pereira','82345558921','rua Seila, 90, itaqua'),
            ('Manoel','A','Filho','52333678801','rua Fulano de tal,9, itaqua'),
            ('Nilza','A','Arraia','63345578912','rua beotrano, 25, itaqua'); 
            
select * from clients;

desc product;
-- Tabela product (Pname, Classification_Kids, Category('Eletronico','Vestimenta','Brinquedos','Alimentos','Moveis'), Avaliação, size
insert into product (Pname, Classification_Kids, Category, Avaliação, size)
					values('fone de ouvido', false,'Eletronico','4', null),
							('Boneca Barbie', true,'Brinquedos','3', null),
                            ('hot wheels', true,'Brinquedos','2', null),
                            ('microfone vedo', false,'Eletronico','1', null),
							('sofa retro', false,'Moveis','4', '2x57x80'),
                            ('guarda roupa', false,'Moveis','3', '3x70x2'),
                            ('camiseta marvel', false,'Vestimenta','5', null),
							('tenis ', false,'Vestimenta','3', null);
            
select * from clients;
select * from product;
select * from orders;
desc orders;
delete from orders where idOrderClient in (1,2,3,4,5,6,7,8); 
-- tabela orders (idOrder, idOrderClient, orderStatus,orderDescription, sendValue, paymentCash)
insert into orders (idOrderClient, orderStatus,orderDescription, sendValue, paymentCash)
				values(1, default, 'compra via app',10, 1),
						(2, 'Cancelado', 'compra via app',null, 0),
                        (3, default, 'compra via app',50, 1),
                        (4, 'Confirmado', 'compra via site',300, 1),
                        (5, 'Cancelado', null,null, 0),
                        (6, default, 'compra via app',null, 0),
                        (7, 'Confirmado', 'compra via app',null, 1),
                        (4, 'confirmado', 'compra via site',150, 1);
                      
                      
desc productOrder;
-- tabela productOrder (idPOproduct, idPOorder, poQuantity, poStatus)
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus)
					values(1,9,2,default),
							(2,10,1,default),
                            (3,11,1,default),
                            (4,12,3,default),
                            (5,13,1,default);
                            

desc productStorage;
-- productStorage ( idProductStorage, storagelocation, quantity)
insert into productStorage (storagelocation, quantity)
						values ('Rio de Janeiro', 1000),
								('Rio de Janeiro', 500),
                                ('São Paulo', 100),
                                ('São Paulo', 200),
                                ('São Paulo', 300),
                                ('Brasilia', 50);


desc storageLocation;
select * from productStorage;
-- tabela storageLocation (idLproduct, idLstorage, location)
insert into storageLocation (idLproduct, idLstorage, location)
						values (1, 2, 'RJ'),
								(2, 6, 'DF'),
                                (3, 4, 'SP');
             
desc supplier;
-- supplier (idsupplier, socialName, CNPJ, contact,
insert into supplier (socialName, CNPJ, contact)
				values ('Almeida e Filhos', 123456789123456, '11912345678'),
						('eletronic house', 123456789654321, '11922335678'),
                        ('casa moveis', 333455589123456, '11999785781'),
                        ('brinquedoteca', 123452289333456, '11973916485');
                        
select * from supplier;
desc productSupplier;
-- tabela productSupplier (idPsSupplier, idPsProduct, quantity)
insert into productSupplier (idPsSupplier, idPsProduct, quantity)
						values (1, 1, 500),
								(1, 2, 400),
                                (2, 4, 633),
                                (3, 3, 5),
                                (2, 5, 5);
                 
desc seller;
-- tabela seller (idSeller, socialName, abstName, CNPJ, CPF, location, contact)
insert into seller (socialName, abstName, CNPJ, CPF, location, contact)
				values ('Tech eleronic', null,null, 36545678988,'Rio de Janeiro', 21978945623),
						('Botique Durgas',null, 987654321987654, null,'São Paulo', 11946401212),
                        ('Mundo Kids', null, null, 15935745678,'São Paulo', 11946408578);
                        

SELECT * FROM seller;
desc productSeller;
-- productSeller (idPSeller, idProduct, quantity)
insert into productSeller (idPSeller, idProduct, quantity)
					values(1, 2, 80),
							(2, 7, 10);

show tables;

-- clients ok, creditcard ok, delivery ok, orders ok, payments ok, product ok, productorder ok, productseller ok, productstorage ok, productsupplier ok, seller ok, storagelocation ok, supplier ok

select * from  supplier;

desc creditcard;

-- table creditcard (cardNumber, CardName, cardValidity)

insert into creditcard (cardNumber, CardName, cardValidity)
					values(1263457869874512,'Maria N Nucc',0727),
							(1263457869884554,'luiz A Alves',0630),
                            (1263454469874512,'Fabio A Nucc',1030),
                            (1263454469877532,'Carol M Silva',1228);
                            
desc payments;
-- table payments (idPClient,idPayment, paycardNum, typePayment, limitAvaliable)
 insert into payments (idPClient,idPayment, paycardNum, typePayment, limitAvaliable)
						values(1, 1, null,'Boleto',2500.00),
                        (2, 2, null,'Pix',2000.00),
                        (3, 3, 1263457869874512,'Cartão',3500.00),
                        (4, 4, 1263457869884554,'Cartão',3000.00),
                        (3, 5, 1263454469874512,'Dois cartões',4500.00),
                        (6, 6, 1263454469877532,'Cartão',2700.00);
                 
desc delivery;
-- table delivery ( iddelivery, idDeOrder, DeStatus, Rastreio)
insert into delivery ( idDeOrder, DeStatus, Rastreio)
				values(9, default, 'AA123456789BR'),
						(10, 'A caminho', 'AA333456789BR'),
                        (11, 'Entregue', 'AA123444789BR'),
                        (12, default, 'AA123423789BR'),
                        (13, 'A caminho', 'AA123456999BR');

