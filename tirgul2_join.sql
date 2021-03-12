use NORTHWND
select P.ProductName, C.CategoryName
from Products P, Categories C
where P.ProductID = C.CategoryID

use NORTHWND --like the privious quere just with better run time
select P.ProductName, C.CategoryName
from Products P join Categories C on P.CategoryID = C.CategoryID

use NORTHWND
select P.ProductName, C.CategoryName, S.CompanyName
from (Suppliers S join Products P on S.SupplierID = P.SupplierID) join Categories C on P.CategoryID = C.CategoryID

use PUBS
select E.fname+' '+E.lname as [full name], E.job_lvl
from employee E join  jobs J on J.job_desc like 'editor' and E.job_lvl between J.min_lvl and J.max_lvl
--where j.job_desc like 'editor' and E.job_lvl between J.min_lvl and J.max_lvl //longer way to run the same

--------------------------------------------------------------
--books and their publishers
use PUBS
select T.title, P.pub_name [Name]
from titles T join publishers P on T.pub_id = P.pub_id

--Reporters name and the name whom report to
use NORTHWND
select E.FirstName+' '+E.LastName as [full name], RT.FirstName+' '+RT.LastName as [Report to]
from Employees E left join Employees RT on E.ReportsTo = RT.EmployeeID

--all the books with their number of purchased copies. 0 instead of NULL
use PUBS
select T.title [name], ISNULL(S.qty,0) as [NUMBER OF COPIES]
from titles T left join sales S on T.title_id = S.title_id

--all the books that have at least one book with the same price
use PUBS
select T1.title as [First Book], T2.title [Second Book], T1.price
from titles T1 join titles T2 on T1.price=T2.price and T1.title_id!=T2.title_id 
order by T1.title
