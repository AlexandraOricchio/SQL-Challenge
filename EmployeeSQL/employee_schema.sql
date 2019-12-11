DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Titles;
DROP TABLE IF EXISTS Salaries;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Dept_Emp;
DROP TABLE IF EXISTS Dept_Manager;

--Employees Table
CREATE TABLE Employees (
    emp_no INTEGER PRIMARY KEY NOT NULL,
    birth_date DATE,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    gender VARCHAR(10),
    hire_date DATE NOT NULL
);

SELECT * FROM Employees;

--Titles Table
CREATE TABLE Titles (
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	title VARCHAR NOT NULL,
	from_date DATE,
	to_date DATE
);

SELECT * FROM Titles;

ALTER TABLE Titles
ADD COLUMN title_id SERIAL PRIMARY KEY;

--Salaries Table
CREATE TABLE Salaries (
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	salary INTEGER NOT NULL,
	from_date DATE,
	to_date DATE
);

SELECT * FROM Salaries;

ALTER TABLE Salaries
ADD COLUMN salary_id SERIAL PRIMARY KEY;

--Departments Table
CREATE TABLE Departments (
	dept_no VARCHAR PRIMARY KEY, 
	dept_name VARCHAR NOT NULL
);

SELECT * FROM Departments;

--Department employee table
CREATE TABLE Dept_Emp (
	emp_no INTEGER NOT NULL REFERENCES Employees(emp_no),
	dept_no VARCHAR NOT NULL REFERENCES Departments(dept_no),
	from_date DATE,
	to_date DATE,
	PRIMARY KEY (emp_no, dept_no)
);

SELECT * FROM Dept_Emp;

--Department manager table
CREATE TABLE Dept_Manager (
	dept_no VARCHAR NOT NULL REFERENCES Departments(dept_no),
	emp_no INTEGER NOT NULL REFERENCES Employees(emp_no),
	from_date DATE,
	to_date DATE,
	PRIMARY KEY (dept_no, emp_no)
);

SELECT * FROM Dept_Manager;

