# hw7-employeeSQL-project

For this assignment, I was given six csv files containing data regarding employees at a corporation in the 1980s and 1990s. The task was to generate a ERD (entity relationship diagram) for the database, run specific queries on the data, and make simple graphs using Python Pandas library. The following sections describe that work.

### Database ERD

Using GenMyModel, I first generated my entities (each csv) with its attributes as the columns from each file. I identified a primary key(s) for each entity by determining which column was a unique value in that table. (Note: dept_emp is a junction table between employees and departments, and thus required a composite key). 
After indentifying primary keys, I linked the entities together using foreign keys. Every table had columns that existed in other tables such as employee id and department number, so they could be identified as foreign keys. By linking those to other primary keys where they were present, I generated the complete diagram, shown here:

![Database](https://raw.github.com/tkadamson/hw7-employeeSQL-project/main/DatabaseDiagram.png)
### Importing Tables into PostgreSQL
Once the diagram was complete, GenMyModel generated SQL code to generate the tables and their foreign key constraints. That code can be found in the schema.sql file. 
First, I ran only the CREATE TABLE statements to ensure that each table was properly generated. I used pgAdmin to import each csv into the table. I then ran each ALTER TABLE statement to ccreate the foreign keys identified in the ERD. 

### SQL Queries
After generating the complete databse in PostgreSQL, I began working on the specific queries. The instructions for each query are list below along with my thought process behind completing each. The SQL code can be found in the queries.sql file.

1. List the following details of each employee: employee number, last name, first name, sex, and salary.
     
     This required joining the employee and salary tables to get the necessary fields for the query.

2. List first name, last name, and hire date for employees who were hired in 1986.
     
     This required the employees table and a WHERE BETWEEN  statement to limit the query to the specified date range. 

3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
      
      This required a double join consisting of the following tables: dept_manager, employees, and departments for the query.

4. List the department of each employee with the following information: employee number, last name, first name, and department name.
      
      This required a double join consisting of the following tables: dept_emp, employees, and departments for the query. Dept_emp served as the junction 
      between employyes and departments

5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
    
    This required a WHERE statement specifying the first name and a LIKE statement with a wildcard to get all 'B' last names.

6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
    
    This query was the same as query 4, with a WHERE statment to narrow to only the Sales Department.

7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
    
    This query was the same as query 6, adding Development to the WHERE clause.
    
8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
    
    This required the last name column and a COUNT statment to group all employees by last name. Lastly, it requred an ORDER BY statement to get the results listed
    in decending order
    
### Analysis in Pandas
Using SQLAlchemy, I generated an engine that connected Python to my Postrgres databse. From there, I imported the necessary tables to create two graphs: a histogram of salaries and a bar graph of average salery by title. 

The first graph only required passing the salary column into a histogram for the visualization. I cleaned up the xticks and labels, as shown below. 

![histogram](https://raw.github.com/tkadamson/hw7-employeeSQL-project/main/graphs/histogram.png)

The second graph required merging the three tables employees, salaries, and titles. Once completed, I dropped all but the relevant fields (salary and title) then grouped the table by title and aggregated by mean. Then I was able to pass those values into a bar chart, shown below.

![bar](https://raw.github.com/tkadamson/hw7-employeeSQL-project/main/graphs/bar.png)
