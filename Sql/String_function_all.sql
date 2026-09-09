


-- UPPER()
SELECT UPPER(employee_name) AS employee_name FROM Employees;
SELECT employee_id, UPPER(city) AS city FROM Employees;

-- LOWER()
SELECT LOWER(employee_name) AS employee_name FROM Employees;
SELECT LOWER(email) AS email FROM Employees;

-- LEN()
SELECT employee_name, LEN(employee_name) AS name_length FROM Employees;
SELECT len('Hello   ');

-- DATALENGTH()
SELECT employee_name, DATALENGTH(employee_name) AS byte_count FROM Employees;
SELECT LEN(employee_name) AS Character_Count, DATALENGTH(employee_name) AS Byte_Count FROM Employees;

-- CONCAT()
SELECT CONCAT(employee_name, ' - ', department) AS Employee_Info FROM Employees;
SELECT CONCAT(employee_id, ' | ', employee_name, ' | ', department) AS Employee_Details FROM Employees;

-- CONCAT_WS()
SELECT CONCAT_WS(' - ', employee_name, department, city) AS Employee_Info FROM Employees;

-- LEFT()
SELECT LEFT(employee_name, 5) AS First_Five_Characters FROM Employees;
SELECT city, LEFT(city, 3) AS City_Code FROM Employees;

-- RIGHT()
SELECT RIGHT(employee_name, 5) AS Last_Five_Characters FROM Employees;

-- SUBSTRING()
SELECT SUBSTRING(employee_name, 1, 5) AS Extracted_Text FROM Employees;
SELECT SUBSTRING(employee_name, 7, 6) AS Last_Name FROM Employees;         

-- CHARINDEX()
SELECT employee_name, CHARINDEX(' ', employee_name) AS Space_Position FROM Employees;
SELECT employee_name, CHARINDEX('a', employee_name) AS Position FROM Employees;

-- PATINDEX()
SELECT employee_name, PATINDEX('%Sh%', employee_name) AS Position FROM Employees;
SELECT employee_name, PATINDEX('%a%', employee_name) AS Position FROM Employees;

-- REPLACE()
SELECT REPLACE(employee_name, ' ', '_') AS Employee_Name FROM Employees;
SELECT REPLACE(email, 'gmail.com', 'company.com') AS Company_Email FROM Employees;

-- TRANSLATE()
SELECT TRANSLATE('123-456-789', '-', '/');
SELECT TRANSLATE('ABC123', 'ABC', 'XYZ');

-- TRIM()
SELECT TRIM('   Rahul Sharma   ');
SELECT TRIM(employee_name) AS Clean_Name FROM Employees;

-- LTRIM()
SELECT LTRIM('     Rahul');

-- RTRIM()
SELECT RTRIM('Rahul     ');

-- LTRIM() + RTRIM()
SELECT LTRIM(RTRIM(employee_name)) FROM Employees;

-- REVERSE()
SELECT REVERSE(employee_name) AS Reversed_Name FROM Employees;

-- SPACE()
SELECT CONCAT('Hello', SPACE(5), 'World');
SELECT SPACE(5);


-- REPLICATE()
SELECT REPLICATE('*', 10);
SELECT CONCAT(employee_name, REPLICATE('.', 5)) AS Formatted_Name FROM Employees;
SELECT REPLICATE('*', 5);

-- FORMAT()
SELECT FORMAT(1234567, 'N0') AS Formatted_Number;

-- STRING_AGG()
SELECT department, STRING_AGG(employee_name, ', ') AS Employees FROM Employees GROUP BY department;

-- STRING_SPLIT()
SELECT value FROM STRING_SPLIT('SQL,Python,Power BI,Excel', ',');

-- ASCII()
SELECT ASCII('A');
SELECT ASCII('a');

-- CHAR()
SELECT CHAR(65);

-- UNICODE()
SELECT UNICODE('A');

-- NCHAR()
SELECT NCHAR(65);

-- DIFFERENCE()
SELECT DIFFERENCE('Smith', 'Smyth');

-- SOUNDEX()
SELECT SOUNDEX('Smith');
SELECT SOUNDEX('Smith') AS Name1, SOUNDEX('Smyth') AS Name2;

-- QUOTENAME()
SELECT QUOTENAME('Employees');

-- STR()
SELECT STR(123.45, 10, 2);

-- STRING_ESCAPE()
SELECT STRING_ESCAPE('Rahul "Sharma"', 'json');

-- STRING CONCATENATION (+)
SELECT employee_name + ' - ' + department FROM Employees;
SELECT CONCAT('Rahul', NULL, 'Sharma');

-- COMBINED FUNCTIONS (Cleaning, Standardizing, & Extracting)
SELECT UPPER(TRIM(employee_name)) AS Clean_Name FROM Employees;
SELECT LEFT(employee_name, CHARINDEX(' ', employee_name) - 1) AS First_Name FROM Employees;
SELECT RIGHT(employee_name, LEN(employee_name) - CHARINDEX(' ', employee_name)) AS Last_Name FROM Employees;
SELECT LOWER(REPLACE(employee_name, ' ', '.')) AS Username FROM Employees;
SELECT LEFT(email, CHARINDEX('@', email) - 1) AS Email_Username FROM Employees;
SELECT SUBSTRING(email, CHARINDEX('@', email) + 1, LEN(email)) AS Email_Domain FROM Employees;
SELECT UPPER(LEFT(employee_name, 1)) + LOWER(SUBSTRING(employee_name, 2, LEN(employee_name))) AS Employee_Name FROM Employees;
SELECT UPPER(TRIM(REPLACE(customer_name, '.', ' '))) AS Clean_Name FROM Customers;

-- STRING FUNCTIONS IN WHERE CLAUSE
SELECT * FROM Employees WHERE LEN(employee_name) > 10;
SELECT * FROM Employees WHERE LEFT(employee_name, 1) = 'R';
SELECT * FROM Employees WHERE employee_name LIKE '%ah%';
SELECT * FROM Employees WHERE email LIKE '%@gmail.com';
SELECT * FROM Employees WHERE CHARINDEX('@gmail.com', email) > 0;

-- STRING FUNCTIONS IN ORDER BY
SELECT employee_name, LEN(employee_name) AS Name_Length FROM Employees ORDER BY LEN(employee_name) DESC;

-- STRING FUNCTIONS WITH GROUP BY
SELECT UPPER(city) AS City, COUNT(*) AS Employee_Count FROM Employees GROUP BY UPPER(city);

-- STRING FUNCTIONS WITH CASE
SELECT employee_name, 
       CASE 
           WHEN LEN(employee_name) > 12 THEN 'Long Name' 
           WHEN LEN(employee_name) >= 8 THEN 'Medium Name' 
           ELSE 'Short Name' 
       END AS Name_Category 
FROM Employees;
