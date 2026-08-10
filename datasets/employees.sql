CREATE TABLE Employees(
employee_id INT PRIMARY KEY,
name VARCHAR(50),
department_id INT,
department VARCHAR(30),
city VARCHAR(30),
salary INT);
INSERT INTO Employees VALUES
(1,'Alice',1,'HR','Chennai',45000),
(2,'Bob',2,'IT','Bangalore',70000),
(3,'Charlie',2,'IT','Chennai',65000),
(4,'David',3,'Sales','Hyderabad',50000),
(5,'Emma',1,'HR','Bangalore',55000),
(6,'Frank',3,'Sales','Chennai',60000);
