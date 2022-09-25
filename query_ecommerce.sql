use ecommerce;

show tables;
select * from clients;
select * from orders;
select * from productorder;
select * from product;
select * from delivery;



-- quantidade de clientes 
select count(*) from clients;

-- pedidos por cliente
select * from clients left join orders on idClient = idOrderClient ;

select concat(Fname,' ', Minit,' ',Lname) as ClientName, idOrder, orderStatus   from clients left join orders on idClient = idOrderClient ;

select * from clients inner join orders on idclient = idOrderClient
						inner join productorder on idOrder = idPOorder
                        inner join delivery on idOrder = idDeOrder;

-- pedidos cancelados

select concat(Fname,' ', Minit,' ',Lname) as ClientName, CPF, orderStatus from clients inner join orders on idclient = idOrderClient
						inner join productorder on idOrder = idPOorder
                        inner join delivery on idOrder = idDeOrder
                        where orderStatus = 'Cancelado';
                        
select * 
from productstorage
order by quantity desc;
