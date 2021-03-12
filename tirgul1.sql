use PUBS
select *
from authors

--The name of the books and their prices
use PUBS
select T.title, T.price
from titles T

--The name of the books with 5% incresment of their prices
use PUBS
select title,price*1.05 [new price]
from titles 

--Calculated price as function of the above
use NORTHWND
select OrderID,ProductID,UnitPrice*Quantity*(1-Discount) as [Calculated price]
from [Order Details]

--id of all publishers
use PUBS
select distinct pub_id
from titles

--getting the whole information of the books that cost between 2-10 shekels
use PUBS
select title,price
from titles
where price Between 2 and 10

--getting all products from Category 1,2 or 7
use NORTHWND
select ProductName,CategoryID
from Products
where CategoryID=1 or CategoryID=2 or CategoryID=4

--getting all the customers that start with A and live in Mexico XXXXXXXXXXXXXXXXXXX
use NORTHWND 
select CompanyName,City
from Customers
where CompanyName like 'A%' and City like 'M_exico'

--getting the full name and city of all the employess that don't work at London,Seattle,Redmond
use NORTHWND
select FirstName,LastName,City
from Employees
where City not in('London','Seattle','Redmond')

/*getting all the products that follow the rules below, and sort them in dictionary order:
1.First letter is between a-k, or t-z
2.second letter can be every letter
3.third letter must be 'r' or 'm'
4.4th letter onwards can be every kind of string */ 
use NORTHWND
select ProductName
from Products
where ProductName like '[a-kt-z]_[rm]%'
order by ProductName

/*Select suppliers's contcat name,phone.fax,homepage that follow the rules below:
1. fax doesn't contain null values
2.Region contains null values
3.if homepage contain null return unknown */
use NORTHWND
select ContactName,Phone,Fax,ISNULL(HomePage,'Unknown') as Homepage
from Suppliers
where Fax IS NOT NULL and Region IS NULL