-- =========================================
-- Create FileTable template
-- =========================================




Drop Database [E-Commerce]

Create Database ECommerce

drop table Account
drop table DeliveryDetails
drop table DiscountCoupon
drop table Inventory
Drop table Invoice
Drop table OrderTable
Drop table ShippingDetails
drop table ShoppingCart
drop table Product

alter table ShoppingCart add foreign key (ItemId) References Inventory(ItemId);
alter table OrderTable add foreign key (CartNum) References ShoppingCart(CartNum);
alter table Inventory add foreign key (DiscountID) References Discount(DiscountId);
alter table ShippingDetails add foreign key (OrderId) references OrderTable(OrderId);
alter table ShippingDetails add foreign key(DeliveryId) references DeliveryDetails(DeliveryId);
Alter table DeliveryDetails add foreign key (AccountNo) references Account(AccountNo);
alter table Invoice add foreign key (ShipmentId) references ShippingDetails(ShippingId);
alter table Invoice add foreign key (OrderId) references OrderTable(OrderId);
alter table Invoice add Foreign key (AccountNo) references Account(AccountNo);
alter table Inventory add foreign key (ProductId) references Product(ProductId);

Create table Account (AccountNo int primary key, Name varchar(50), phone int,email varchar(100)); 
insert into Account values(1,'Apurva',9823,'apurva@gmail.com');
insert into Account values(2,'User1',123456,'User1@gmail.com');
insert into Account values(3,'Samruddhi',12345678,'samruddhi@gmail.com');
insert into Account values(5,'SurbhiT',123546,'surbhi@gmail.com');
insert into Account values(6,'Sarvesh',5456461,'Sarvesh@gmail.com');



create table Inventory (ItemId int primary key, ItemName varchar(50), quantity int,Price Float ,DiscountId int,ProductId int);
insert into Inventory values(1001,'NoteBook',50,100,1,1);
insert into Inventory values(1002,'Mobile',120,20000,2,2);
insert into Inventory values (1003,'Bag',38,300,1,3);
insert into Inventory values (1004,'Bottle',49,150,1,4);
insert into Inventory values(1005,'HeadPhones',20, 20000,2,5);

select 



Create table Product (ProductId Int primary key,ProdutName varchar(50));
insert into Product values(1,'Notebook');
insert into product values(2,'mobile');
insert into Product values (3,'Bag');
insert into product values(4,'Bottle');
insert into Product values(5,'Headphones');

create table DiscountCoupon (DiscountId int primary key, CouponName varchar(50) , validity date,DiscountPercentage int);
insert into  DiscountCoupon values(1,'Diwali',CONVERT(VARCHAR, DATEADD(MONTH,2,getdate()),6),10);
insert into  DiscountCoupon values(2,'MonsoonSale' ,CONVERT(VARCHAR, DATEADD(MONTH,1,getdate()),6),2);
select * from DiscountCoupon;


Create table ShoppingCart (CartNum int primary key, CartStatus varchar(20),ItemID int,quantity int);
insert into ShoppingCart values(50001,'Orderd',1001,1);
insert into ShoppingCart values(500012,'UnOrderd',1002,1);



Create table OrderTable (OrderId int primary key,Amount int ,CartNum int , OrderStatus varchar(200),AccountNo int  ); 
insert into OrderTable values(8000,150,50001,'Ordered',1);
insert into OrderTable values(8001,120,500012,'Ordered',2);          
insert into OrderTable values (8002,300,50001,'Orderd',1);



create table ShippingDetails(ShippingId int primary key,ShipmentStatus varchar(20),OrderId int,DeliveryId int);
insert into ShippingDetails values (225,'Orderd',8000,889);
insert into ShippingDetails values(226,'Orderd',8002,889);
insert into ShippingDetails values (227,'Ordered',8000,889);
insert into ShippingDetails values (228,'Refund',8000,889);


create table DeliveryDetails(DeliveryId int primary key,Name varchar(50), DeliveryAddress varchar(50),City Varchar(50),State varchar(50),pin int,AccountNo int);
insert into DeliveryDetails values(889,'Apurva','AkoleBypass','Sangamner','Maharashtra',422605,1);
insert into DeliveryDetails values(890,'SurbhiT','VishrantVadi','Pune','Maharashtra',411038,5);
insert into DeliveryDetails values(891,'Apurva','AkoleBypass','Sangamner','Maharashtra',422605,1);


Create table Invoice(InvoiceId int primary key, InvoiceDate Date,ShipmentId int , OrderId int ,AccountNo int);
insert into Invoice values(502 ,convert(varchar, getdate(), 6),225,8000,1);
delete from Invoice where InvoiceId=502;
select * from Invoice;
drop table Invoice

create index AccSearch On DeliveryDetails (AccountNo,Name);

select AccountNo ,Name from DeliveryDetails Where AccountNo=1;

create Nonclustered index Search on OrderTable(OrderId);
select OrderStatus from OrderTable;

select Ac.AccountNo,AC.Name,DD.DeliveryAddress from Account as Ac inner join DeliveryDetails as DD on (Ac.AccountNo=DD.AccountNo) where AC.Name='Apurva';


select Ac.AccountNo,AC.Name,DD.DeliveryAddress from Account as Ac full Outer join DeliveryDetails as DD on (Ac.AccountNo=DD.AccountNo);

select DD.Name from DeliveryDetails as DD inner join ShippingDetails as SD on (DD.DeliveryId= SD.DeliveryId) Where DD.Name='Apurva';


select IV.ItemName from Inventory as IV inner join ShoppingCart as SC on(IV.ItemId = SC.ItemID) ;


select DD1.Name  From DeliveryDetails as DD1  join (select AccountNo, count(*) as ACCount from DeliveryDetails)DD  on (DD1.AccountNo = DD.AccountNo)where ACCount>1 group by DD1.AccountNo ;




