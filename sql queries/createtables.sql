CREATE DATABASE fullstack;
USE fullstack;
CREATE TABLE Student (
    VTU_Number VARCHAR(20) PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Department VARCHAR(50)
);
CREATE TABLE Course (
    Course_Code VARCHAR(10) PRIMARY KEY,
    Course_Name VARCHAR(100),
    Faculty_Id INT,
    Student_ID VARCHAR(20),
    Faculty_Email VARCHAR(100),
    FOREIGN KEY (Student_ID) REFERENCES Student(VTU_Number)
);
