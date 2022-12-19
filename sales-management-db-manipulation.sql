use quanlybanhang;

insert into Customer values 
(1, 'Minh Quan', 10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);

insert into `order` values 
(1, 1, '2006-03-21', null),
(2, 2, '2006-03-23', null),
(3, 1, '2006-03-16', null);

insert into `product` values 
(1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);

insert into `orderdetail` values 
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);

select oID, oDate, oTotalPrice from `order`;

select c.cName, c.cAge, p.pName, p.pPrice, od.odQTY
from customer c
inner join `order` o on c.cID = o.cID
inner join orderdetail od on od.oID = o.oID
inner join product p on p.pID = od.pID;

select o.oID, o.oDate, sum(od.odQTY*p.pPrice) as TotalPrice
from `order` o
inner join orderdetail od on od.oID = o.oID
inner join product p on p.pID = od.pID
group by (o.oID);

select cName, cAge
from customer c
where not exists
(select oID from `order` o where o.cID = c.cID);

select c.cName, c.cAge
from customer c
left join `order` o on o.cID = c.cID 
where o.oDate is null;
