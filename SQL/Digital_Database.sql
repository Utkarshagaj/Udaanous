
CREATE DATABASE Digital;
USE Digital;

CREATE TABLE Department_Data_1 (
    Dept_Name VARCHAR(50) PRIMARY KEY
);

INSERT INTO Department_Data_1 (Dept_Name)
VALUES ('DA'), ('Frontend'), ('Backend');

CREATE TABLE Employiess_Data_ (
    Id INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary INT NOT NULL
);

INSERT INTO Employiess_Data_ (Id, Name, Department, Salary)
VALUES 
    (101, 'Vinit', 'DA', 20000),
    (102, 'Piyush', 'DA', 25000),
    (103, 'Kunal', 'Frontend', 25000),
    (104, 'Aman', 'Backend', 40000);

ALTER TABLE Employiess_Data_
ADD CONSTRAINT FK_Department
FOREIGN KEY (Department)
REFERENCES Department_Data_1 (Dept_Name);
