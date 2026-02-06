--Inner Join:
SELECT 
    s.VTU_Number, 
    s.Name AS Student_Name, 
    c.Course_Name, 
    c.Faculty_Id,
    c.Faculty_Email
FROM Student s
INNER JOIN Course c ON s.VTU_Number = c.Student_ID;

--Left Join:
SELECT 
    s.VTU_Number, 
    s.Name, 
    c.Course_Name
FROM Student s
LEFT JOIN Course c ON s.VTU_Number = c.Student_ID;

--Right Join:
SELECT 
    s.Name, 
    c.Course_Code, 
    c.Course_Name
FROM Student s
RIGHT JOIN Course c ON s.VTU_Number = c.Student_ID;

--FULL JOIN (Full Outer Join):
SELECT s.Name, c.Course_Name FROM Student s
LEFT JOIN Course c ON s.VTU_Number = c.Student_ID
UNION
SELECT s.Name, c.Course_Name FROM Student s
RIGHT JOIN Course c ON s.VTU_Number = c.Student_ID;

--Cross Join(Cartesian Product):
SELECT s.Name, c.Course_Name
FROM Student s
CROSS JOIN Course c;

