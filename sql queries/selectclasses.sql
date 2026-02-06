
SELECT * FROM Student WHERE Department = 'CSE';
--ORDER BY Clause (Sorting):
SELECT * FROM Course ORDER BY Course_Name ASC;
--LIKE Clause (Pattern Matching):
SELECT Name, Email FROM Student WHERE Email LIKE '%@mail.com';
--	LIMIT Clause (Restricting Results):
SELECT * FROM Student LIMIT 3;

SELECT Department, COUNT(*) as Total_Students 
FROM Student 
GROUP BY Department 
HAVING COUNT(*) > 1;


-- Display all students
SELECT * FROM Student;
-- Display all courses
SELECT * FROM Course;

-- Count total number of students
SELECT COUNT(*) AS Total_Students FROM Student;
-- Count unique departments
SELECT COUNT(DISTINCT Department) AS Department_Count FROM Student;
-- Find the highest Faculty ID assigned
SELECT MAX(Faculty_Id) AS Highest_Faculty_ID FROM Course;


-- Sort - Ascending order (Default)
SELECT * FROM Student 
ORDER BY VTU_Number ASC;
-- Sort - in Descending order
SELECT * FROM Student 
ORDER BY VTU_Number DESC;


SELECT * FROM Student 
WHERE Department = 'CSE';

