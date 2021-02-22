-- Create tables
CREATE TABLE IF NOT EXISTS departments
(
    dept_no VARCHAR(4) NOT NULL UNIQUE,
    dept_name VARCHAR(20),
    PRIMARY KEY(dept_no)
);

CREATE TABLE IF NOT EXISTS dept_emp
(
    emp_no INTEGER NOT NULL,
    dept_no VARCHAR(5) NOT NULL,
    PRIMARY KEY(emp_no, dept_no)
);

CREATE TABLE IF NOT EXISTS dept_manager
(
    dept_no VARCHAR(4) NOT NULL,
    emp_no INTEGER NOT NULL UNIQUE,
    PRIMARY KEY(emp_no)
);

CREATE TABLE IF NOT EXISTS employees
(
    emp_no INTEGER NOT NULL UNIQUE,
    emp_title_id VARCHAR(5),
    birth_date DATE,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    sex CHARACTER(1),
    hire_date DATE,
    PRIMARY KEY(emp_no)
);

CREATE TABLE IF NOT EXISTS salaries
(
    emp_no INTEGER NOT NULL UNIQUE,
    salary INTEGER,
    PRIMARY KEY(emp_no)
);

CREATE TABLE IF NOT EXISTS titles
(
    title_id VARCHAR(5) NOT NULL UNIQUE,
    title VARCHAR(20),
    PRIMARY KEY(title_id)
);


-- Create FKs
ALTER TABLE employees
    ADD    FOREIGN KEY (emp_title_id)
    REFERENCES titles(title_id)
    MATCH SIMPLE
;
    
ALTER TABLE employees
    ADD    FOREIGN KEY (emp_no)
    REFERENCES salaries(emp_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_emp
    ADD    FOREIGN KEY (emp_no)
    REFERENCES employees(emp_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_emp
    ADD    FOREIGN KEY (dept_no)
    REFERENCES departments(dept_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_manager
    ADD    FOREIGN KEY (dept_no)
    REFERENCES departments(dept_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_manager
    ADD    FOREIGN KEY (emp_no)
    REFERENCES employees(emp_no)
    MATCH SIMPLE
;