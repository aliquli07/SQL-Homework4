USE Employees

--1. USA-da yasayan isciler
SELECT BusinessEntityID, FirstName, LastName,
	CountryRegionName, StateProvinceName, City
FROM Employees
WHERE CountryRegionName = 'United States'

--2. Her vezife uzre isci sayi
SELECT JobTitle, COUNT(*) AS Job_Count
FROM Employees
GROUP BY JobTitle

--3. Her adin nece defe tekrarlanmasi
SELECT FirstName, COUNT(*) AS Name_Count
FROM Employees
GROUP BY FirstName

--4. Ən çox tekrarlanan ad
SELECT TOP 1 FirstName, COUNT(*) AS Name_Count
FROM Employees
GROUP BY FirstName
ORDER BY Name_Count DESC

--5. Ən az tekrarlanan ad
SELECT TOP 1 FirstName, COUNT(*) AS Name_Count
FROM Employees
GROUP BY FirstName
ORDER BY Name_Count ASC

--6. Ən çox isci olan 5 seher
SELECT TOP 5 City, COUNT(*) AS Employee_Count
FROM Employees
GROUP BY City
ORDER BY Employee_Count DESC

--7. Ən çox ferqli vezife olan 5 seher
SELECT TOP 5 City, COUNT(DISTINCT JobTitle) AS Unique_Job_Count
FROM Employees
GROUP BY City
ORDER BY Unique_Job_Count DESC

--8. 2012-01-01 tarixinde ise baslayanlarin emaili
SELECT EmailAddress
FROM Employees
WHERE StartDate = '2012-01-01'

--9. Illere gore ise baslayanlarin sayi
SELECT YEAR(StartDate) AS Start_Year, COUNT(*) AS Employee_Count
FROM Employees
GROUP BY YEAR(StartDate)
ORDER BY Start_Year

--10. 101 nomreli iscinin isden cixis tarixini yenile
UPDATE History
SET EndDate = '2023-12-31'
WHERE BusinessEntityID = 101

--11. Illere gore isden cixanlarin sayi
SELECT YEAR(EndDate) AS End_Year, COUNT(*) AS Employee_Count
FROM History
WHERE EndDate IS NOT NULL
GROUP BY YEAR(EndDate)
ORDER BY End_Year

--12. 1 ilden az isleyenler
SELECT *
FROM History
WHERE DATEDIFF(YEAR, StartDate, EndDate) < 1
