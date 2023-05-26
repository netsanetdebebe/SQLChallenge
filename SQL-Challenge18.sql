
SELECT * FROM Employees; 

CREATE TABLE Employees (
    emp_no INT   NOT NULL,
    emp_title VARCHAR   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date DATE   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE Dept_emp (
    emp_no INT   NOT NULL,
    dept_no VARCHAR   NOT NULL,
    CONSTRAINT pk_Dept_emp PRIMARY KEY (
        emp_no,dept_no
     )
);

CREATE TABLE Dept_manager (
    dept_no  NOT NULL,
    emp_no INT   NOT NULL,
    CONSTRAINT pk_Dept_manager PRIMARY KEY (
        dept_no,emp_no
     )
);

CREATE TABLE Salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
    CONSTRAINT pk_Salaries PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Titles (
    title_id VARCHAR   NOT NULL,
    title VARCHAR   NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        title_id
     )
);


ALTER TABLE Employees ADD CONSTRAINT fk_Employees_emp_title FOREIGN KEY(emp_title)
REFERENCES Titles (title_id);

ALTER TABLE Dept_emp ADD CONSTRAINT fk_Dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_emp ADD CONSTRAINT fk_Dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Dept_manager ADD CONSTRAINT fk_Dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Dept_manager ADD CONSTRAINT fk_Dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);




SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM Employees AS e 
LEFT JOIN Salaries AS s 
ON e.emp_no = s.emp_no; 

SELECT first_name, last_name, hire_date
FROM Employees 
WHERE EXTRACT ('Year' FROM hire_date) = 1986; 

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name 
FROM dept_manager AS dm 
LEFT JOIN departments as d 
ON dm.dept_no = d.dept_no 
LEFT JOIN Employees AS e 
ON dm.emp_no = e.emp_no;

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM Employees AS e  
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no 
INNER JOIN Departments AS d 
ON d.dept_no = d.dept_no 
ORDER BY e.emp_no; 

SELECT first_name, last_name, sex
FROM Employees
WHERE first_name  = 'Hercules'
AND last_name LIKE 'B%';

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Employees AS e
INNER JOIN dept_emp AS de 
ON e.emp_no = de.emp_no 
INNER JOIN Departments AS d 
ON de.dept_no = d.dept_no 
WHERE d.dept_name  = 'Sales'
ORDER BY emp_no;  


SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no 
INNER JOIN DEpartments AS d
ON de.dept_no = d.dept_no 
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY e.emp_no; 


SELECT last_name, COUNT(last_name) AS freq_last_name
FROM Employees
GROUP BY last_name
ORDER BY freq_last_name DESC; 
















