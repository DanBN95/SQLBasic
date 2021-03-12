use NORTHWND
select E.FirstName+' '+E.LastName as [full name], isnull(E.Region,'unknown') as [Region]
from Employees E
where E.Region in('WA','BC') or E.Region is NULL

use NORTHWND
select P.ProductName,P.UnitPrice,P.UnitsInStock
from Products P
--where P.UnitsInStock<=10 AND P.UnitPrice<=20
order by UnitPrice desc ,UnitsInStock desc