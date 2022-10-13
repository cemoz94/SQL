--Select
--ANSI
--çalıştıracağın sorguyu seç öyle çalıştır de
Select ContactName Adi,CompanyName SirketAdi,City Sehir From Customers

Select * From Customers where City = 'London'

--case insensitive
sElEct * From Products where CategoryID = 1 or CategoryID =3
--or ya da hem 1 hem 3 ikisi de olabilir olmayabilir de

sElEct * From Products where CategoryID = 1 and UnitPrice>=10
--and olunca ikiside olmak zorundadır

select * from Products order by CategoryID, ProductName
--önce kategori id sonra onlar içerisinde ürün ismine göre sırala orderby

select * from Products order by UnitPrice asc --ascending =artan

select * from Products order by UnitPrice desc --descending =azalan

select * from Products where CategoryID=1 order by UnitPrice desc
-- kategorisi 1 olanlarda azalan fiyat yapar

select count(*) from Products
--tüm satırları say demek

--select count(*),ProductName from Products bu yanlış bir yazım

select count(*) from Products where CategoryID=2
-- kategori 2de kaç tane satır var
-- tek ürün olsa çalışmaz

select count(*) Adet from Products where CategoryID=2
--kolonun adını adet yazar

select CategoryID from Products group by CategoryID
-- bütün kategorileri bana tekrar etmeyecek şekilde listele

select CategoryID,count(*) from Products group by CategoryID

select CategoryID,count(*) from Products group by CategoryID having count(*)<10
--içerisinde 10 taneden az ürün çeşidi olan kategorileri verir

select CategoryID,count(*) from Products where UnitPrice>20 group by CategoryID having count(*)<10
--ürünü 20'den fazla olanları kategoriye göre grupla bununda sayısı 10dan küçük olanları veriri

select * from Products inner join Categories on Products.CategoryID = Categories.CategoryID
-- ürünlerdeki ve kategorilerdeki categori id si eşleşenlerin birleştirilmesi

select Products.ProductID,Products.ProductName,Products.UnitPrice,Categories.CategoryName from Products inner join Categories on Products.CategoryID = Categories.CategoryID
-- burada da neler gözüksün göstermek için

--DTO Data Transformation Object

select Products.ProductID,Products.ProductName,Products.UnitPrice,Categories.CategoryName 
from Products inner join Categories 
on Products.CategoryID = Categories.CategoryID
where Products.UnitPrice>10

--inner join sadece eşleşenleri bir araya getirir. Eşleşmeyenleri getirmez
-- boşluk koydukları için [] alınır
select * from Products p inner join [Order Details] od
on p.ProductID = od.ProductID

--hiç satış yapılmayan ürünler neler kampanya yapalım
select * from Products p left join [Order Details] od
on p.ProductID = od.ProductID
--solda olup sağda olmayanları da getir
--üstteki ile aynı geldi yani bütün ürünlerden satış yapmışız demek

select * from Customers c inner join Orders o
on c.CustomerID = o.CustomerID
--830 kayıt var

select * from Customers c left join Orders o
on c.CustomerID = o.CustomerID
--832 bu da demek ki müşterilerde olup siparişte olanları da getir

--sistemde kayıtlı ama ürün almamışları getir
--kampanya yapcağım sana özel
select * from Customers c left join Orders o
on c.CustomerID = o.CustomerID
where o.CustomerID is null
--2 müşteri hiç ürün almamış

--right var bir de ama o çok kullanılmaz çok tablo olur o nedenle yazılır

--2den fazla tablo join etmek için
select * from Products p inner join [Order Details] od
on p.ProductID = od.ProductID
inner join Orders o
on o.OrderID = od.OrderID
