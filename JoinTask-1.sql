

--1. Hər Publisherin ən az səhifəli kitabını ekrana çıxarın


SELECT Press.Name AS PRESS, MIN(Books.Pages) AS MinPages
FROM Books
INNER JOIN Press ON Books.Id_Press = Press.Id
GROUP BY Press.Name;

--2. Publisherin ümumi çap etdiyi kitabların orta səhifəsi 
--100dən yuxarıdırsa, o Publisherləri ekrana çıxarın.

SELECT Press.Name AS Publisher
FROM Books
INNER JOIN Press ON Books.Id_Press = Press.Id
GROUP BY Press.Name
HAVING AVG(Books.Pages) > 100;

--3. BHV və BİNOM
--Publisherlərinin kitabların bütün cəmi səhifəsini ekrana çıxarın

SELECT Press.Name AS Publisher,SUM(Books.[Pages])
FROM Books
INNER JOIN Press ON Books.Id_Press = Press.Id
GROUP BY Press.Name
HAVING Press.[Name] IN ('BHV','BINOM');

--4. Yanvarın 1-i 2001ci il və bu gün arasında 
--kitabxanadan kitab götürən bütün tələbələrin adlarını ekrana çıxarın

SELECT CONCAT(Students.FirstName, ' ', Students.LastName) AS Fullname,
S_Cards.DateOut
FROM S_Cards
INNER JOIN Students ON S_Cards.Id_Student = Students.Id
WHERE S_Cards.DateOut >= '2001-01-01';


--5. Olga Kokorevanın  "Windows 2000 Registry" kitabı 
--üzərində işləyən tələbələri tapın

SELECT CONCAT(Students.FirstName, ' ', Students.LastName) AS Fullname
FROM S_Cards
INNER JOIN Students ON S_Cards.Id_Student=Students.Id
INNER JOIN Books ON  Books.Id=S_Cards.Id_Book
INNER JOIN Authors ON Books.Id_Author=Authors.Id
WHERE Books.[Name]='Windows 2000 Registry'


--6. Yazdığı bütün kitabları nəzərə aldıqda, orta səhifə sayı 
--600dən çox olan Yazıçılar haqqında məlumat çıxarın.

SELECT CONCAT(Authors.FirstName, ' ', Authors.LastName) AS Fullname
FROM Books
INNER JOIN Authors ON Books.Id_Author = Authors.Id
GROUP BY Authors.FirstName, Authors.LastName
HAVING AVG(Books.Pages) > 600;

--7. Çap etdiyi bütün kitabların cəmi səhifə sayı 700dən çox olan 
--Publisherlər haqqında ekrana məlumat çıxarın

SELECT Press.Name AS Publisher,SUM(Books.[Pages]) AS [PAGE COUNT]
FROM Books
INNER JOIN Press ON Books.Id_Press = Press.Id
GROUP BY Press.Name
HAVING SUM(Books.Pages)>700;

--8. Kitabxananın bütün ziyarətçilərini və 
--onların götürdüyü kitabları çıxarın.

SELECT CONCAT(Students.FirstName, ' ', Students.LastName) AS Fullname,
Books.[Name]
FROM S_Cards
INNER JOIN Students ON S_Cards.Id_Student=Students.Id
INNER JOIN Books ON  Books.Id=S_Cards.Id_Book

UNION

SELECT CONCAT(Teachers.FirstName, ' ', Teachers.LastName) AS Fullname,
Books.[Name]
FROM T_Cards
INNER JOIN Teachers ON T_Cards.Id_Teacher=Teachers.Id
INNER JOIN Books ON  Books.Id=T_Cards.Id_Book


--9. Studentlər arasında ən məşhur author(lar) və 
--onun(ların) götürülmüş kitablarının sayını çıxarın.



--10. Tələbələr arasında ən məşhur author(lar) və
--onun(ların) götürülmüş kitablarının sayını çıxarın.
