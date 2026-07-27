-- CASE Statement

| id | name  | age |
| -- | ----- | --: |
| 1  | Rahul |  22 |
| 2  | Ankit |  17 |
| 3  | Priya |  18 |
| 4  | Neha  |  15 |
| 5  | Aman  |  25 |

SELECT name,
CASE
    WHEN age >= 18 THEN 'Adult'
    ELSE 'Minor'
END AS status
FROM users;

| name  | status |
| ----- | ------ |
| Rahul | Adult  |
| Ankit | Minor  |
| Priya | Adult  |
| Neha  | Minor  |
| Aman  | Adult  |

-- Find Duplicate Records

| id | name   | email                                     |
| -- | ------ | ----------------------------------------- |
| 1  | Ankit  | [ankit@gmail.com](mailto:ankit@gmail.com) |
| 2  | Rahul  | [rahul@gmail.com](mailto:rahul@gmail.com) |
| 3  | Priya  | [priya@gmail.com](mailto:priya@gmail.com) |
| 4  | Ankit2 | [ankit@gmail.com](mailto:ankit@gmail.com) |
| 5  | Rahul2 | [rahul@gmail.com](mailto:rahul@gmail.com) |
| 6  | Neha   | [neha@gmail.com](mailto:neha@gmail.com)   |

SELECT email, COUNT(*) FROM users
GROUP BY email
HAVING COUNT(*) > 1;

| email                                     | COUNT(*) |
| ----------------------------------------- | -------: |
| [ankit@gmail.com](mailto:ankit@gmail.com) |        2 |
| [rahul@gmail.com](mailto:rahul@gmail.com) |        2 |

-- Find the Second Highest Salary

| id | name  | salary |
| -- | ----- | -----: |
| 1  | Rahul |  50000 |
| 2  | Ankit |  70000 |
| 3  | Priya |  90000 |
| 4  | Neha  |  60000 |
| 5  | Aman  |  70000 |

SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);

| second_highest_salary |
| --------------------: |
|                 70000 |

-- Find Employees with Highest Salary in Each Department or Display the highest-paid employee from every department.

| id | name  | department | salary |
| -- | ----- | ---------- | -----: |
| 1  | Rahul | IT         |  50000 |
| 2  | Ankit | IT         |  70000 |
| 3  | Priya | HR         |  60000 |
| 4  | Neha  | HR         |  55000 |
| 5  | Aman  | Sales      |  65000 |
| 6  | Riya  | Sales      |  80000 |

  
SELECT department, MAX(salary) AS highest_salary
FROM employees
GROUP BY department;

| department | highest_salary |
| ---------- | -------------: |
| IT         |          70000 |
| HR         |          60000 |
| Sales      |          80000 |

-- Count Records by Category

| id | name  | department |
| -- | ----- | ---------- |
| 1  | Rahul | IT         |
| 2  | Ankit | IT         |
| 3  | Priya | HR         |
| 4  | Neha  | HR         |
| 5  | Aman  | IT         |
| 6  | Riya  | Sales      |
| 7  | Mohit | Sales      |

SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;
  
| department | total_employees |
| ---------- | --------------: |
| HR         |               2 |
| IT         |               3 |
| Sales      |               2 |

-- INNER JOIN
-- Show employee names with their department names.

| employee_id | name  | department_id |
| ----------- | ----- | ------------: |
| 1           | Rahul |           101 |
| 2           | Ankit |           102 |
| 3           | Priya |           103 |
| 4           | Neha  |           101 |
| 5           | Aman  |           102 |

| department_id | department_name |
| ------------: | --------------- |
|           101 | IT              |
|           102 | HR              |
|           103 | Sales           |

SELECT e.name,
       d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;

| name  | department_name |
| ----- | --------------- |
| Rahul | IT              |
| Ankit | HR              |
| Priya | Sales           |
| Neha  | IT              |
| Aman  | HR              |

-- Find Employees Whose Salary is Above Average Find Employees Earning More Than Average Salary

| id | name  | salary |
| -- | ----- | -----: |
| 1  | Ankit |  50000 |
| 2  | Rahul |  70000 |
| 3  | Neha  |  60000 |
| 4  | Priya |  80000 |
| 5  | Aman  |  40000 |

SELECT *FROM employees
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
);

| id | name  | salary |
| -- | ----- | -----: |
| 2  | Rahul |  70000 |
| 4  | Priya |  80000 |

-- Find the Top 3 Highest Salaries

| id | name  | salary |
| -- | ----- | -----: |
| 1  | Rahul |  70000 |
| 2  | Ankit |  90000 |
| 3  | Priya |  80000 |
| 4  | Neha  |  60000 |
| 5  | Aman  |  70000 |
| 6  | Riya  |  90000 |

SELECT DISTINCT salary
FROM Employee
ORDER BY salary DESC
LIMIT 3;

| salary |
| -----: |
|  90000 |
|  80000 |
|  70000 |

-- Find Customers Who Never Placed an Order

-- Customers Table
| id | name  |
| -: | ----- |
|  1 | Rahul |
|  2 | Ankit |
|  3 | Priya |
|  4 | Shivangi  |
|  5 | Aman  |

-- Orders Table
| order_id | customer_id |
| -------: | ----------: |
|      101 |           1 |
|      102 |           3 |
|      103 |           5 |

SELECT c.name FROM Customers c
LEFT JOIN Orders o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL;

| name  |
| ----- |
| Ankit |
| Shivangi  |















