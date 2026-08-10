# 06 - JOINs and Aggregations

## Problem 26 - Count Employees by Department Name

### Business Scenario
Management wants an employee count for every department with the department name included.

### SQL Solution

```sql
SELECT d.department_name,
       COUNT(e.employee_id) AS total_employees
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.department_id = d.department_id
GROUP BY d.department_name;
```

### Explanation
The tables are joined through `department_id`. The employees are then grouped by the department name and counted.

### Pattern Learned
**JOIN + GROUP BY + COUNT()**

### Interview Tip
Use `COUNT(e.employee_id)` when counting matching employees after a join.

---

## Problem 27 - Average Salary by Department

### Business Scenario
HR wants to compare average salaries across departments.

### SQL Solution

```sql
SELECT d.department_name,
       AVG(e.salary) AS average_salary
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.department_id = d.department_id
GROUP BY d.department_name;
```

### Explanation
Each employee is matched to a department. The employees are grouped by department name, and the average salary is calculated for each group.

### Pattern Learned
**JOIN + GROUP BY + AVG()**

### Interview Tip
When a descriptive column is stored in another table, join first and group by the descriptive column.

---

## Problem 28 - Count Employees Including Empty Departments

### Business Scenario
Management wants every department in the report, even departments that currently have no employees.

### SQL Solution

```sql
SELECT d.department_name,
       COUNT(e.employee_id) AS total_employees
FROM Employees AS e
LEFT JOIN Departments AS d
    ON e.department_id = d.department_id
GROUP BY d.department_name;
```

### Explanation
A `LEFT JOIN` is used so unmatched rows from the department side can be represented. In a report where every department must appear, the safest starting table is normally `Departments`:

```sql
SELECT d.department_name,
       COUNT(e.employee_id) AS total_employees
FROM Departments AS d
LEFT JOIN Employees AS e
    ON d.department_id = e.department_id
GROUP BY d.department_name;
```

This version preserves departments even when they have zero employees.

### Pattern Learned
**LEFT JOIN + COUNT(column) → Include unmatched groups**

### Interview Tip
For zero-count reporting, start from the table containing the categories you must preserve and use `LEFT JOIN`.

---

## Problem 29 - List Employees with Salary, Including Missing Departments

### Business Scenario
HR wants a salary report for every employee, while still keeping employees whose department record is missing.

### SQL Solution

```sql
SELECT e.employee_id,
       e.name,
       d.department_name,
       e.salary
FROM Employees AS e
LEFT JOIN Departments AS d
    ON e.department_id = d.department_id
ORDER BY e.salary DESC;
```

### Explanation
`LEFT JOIN` keeps every employee. `ORDER BY salary DESC` places the highest-paid employees first.

### Pattern Learned
**LEFT JOIN + ORDER BY DESC**

### Interview Tip
The table on the left determines which records are guaranteed to remain in the result.

---

## Problem 30 - Departments with No Employees

### Business Scenario
Management wants a list of departments that currently have no employees.

### SQL Solution

```sql
SELECT d.department_name
FROM Departments AS d
LEFT JOIN Employees AS e
    ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) = 0;
```

### Explanation
All departments are preserved with `LEFT JOIN`. Departments with no matching employees have zero non-NULL employee IDs, so `HAVING COUNT(e.employee_id) = 0` identifies them.

### Pattern Learned
**LEFT JOIN + GROUP BY + HAVING COUNT() = 0**

### Interview Tip
`COUNT(e.employee_id)` is important here. Counting `*` would count the preserved department row and would not produce zero.

---

## Quick Revision

| Requirement | Pattern |
|---|---|
| Count by joined category | `JOIN + GROUP BY + COUNT()` |
| Average by joined category | `JOIN + GROUP BY + AVG()` |
| Include zero-count categories | `LEFT JOIN + COUNT(column)` |
| Keep all employees | `Employees LEFT JOIN Departments` |
| Find empty categories | `LEFT JOIN + HAVING COUNT() = 0` |
