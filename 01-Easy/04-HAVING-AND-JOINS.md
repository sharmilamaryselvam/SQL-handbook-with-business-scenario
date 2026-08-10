# 04 - HAVING and JOINs

## Problem 16 - Departments with More Than 2 Employees

### Business Scenario
HR wants to identify departments that have more than two employees.

### SQL Solution

```sql
SELECT department, COUNT(*) AS total_employees
FROM Employees
GROUP BY department
HAVING COUNT(*) > 2;
```

### Explanation
`GROUP BY` creates one group per department. `HAVING` filters those groups based on employee count.

### Pattern Learned
**GROUP BY + HAVING → Filter groups**

### Interview Tip
`WHERE` filters rows; `HAVING` filters groups.

---

## Problem 17 - Average Salary Above 60,000

### Business Scenario
Management wants departments whose average salary is above 60,000.

### SQL Solution

```sql
SELECT department, AVG(salary) AS average_salary
FROM Employees
WHERE department IN ('IT', 'HR')
GROUP BY department
HAVING AVG(salary) > 60000;
```

### Explanation
`WHERE` first limits the rows to IT and HR. `GROUP BY` calculates the average for each department, and `HAVING` keeps averages above 60,000.

### Pattern Learned
**WHERE + GROUP BY + HAVING**

### Interview Tip
Filter rows before aggregation when the business requirement calls for it.

---

## Problem 18 - Departments with Total Salary Above 100,000

### Business Scenario
Finance wants departments whose combined salary expense exceeds 100,000.

### SQL Solution

```sql
SELECT department, SUM(salary) AS total_salary
FROM Employees
GROUP BY department
HAVING SUM(salary) > 100000;
```

### Explanation
Employees are grouped by department, salaries are summed, and `HAVING` filters the resulting groups.

### Pattern Learned
**HAVING with SUM()**

### Interview Tip
An aggregate condition such as `SUM(salary) > 100000` belongs in `HAVING`, not `WHERE`.

---

## Problem 19 - Employees with Department Names

### Business Scenario
The employee table stores a department ID, while department names are stored separately.

### SQL Solution

```sql
SELECT e.employee_id, e.name, d.department_name
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.department_id = d.department_id;
```

### Explanation
`INNER JOIN` returns employees whose `department_id` matches a department record.

### Pattern Learned
**INNER JOIN → Matching records**

### Interview Tip
Always verify that the columns used in the `ON` condition represent the relationship between the tables.

---

## Problem 20 - Employees in the IT Department

### Business Scenario
HR wants employee details only for people working in IT.

### SQL Solution

```sql
SELECT e.employee_id, e.name, d.department_name, e.salary
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.department_id = d.department_id
WHERE d.department_name = 'IT';
```

### Explanation
The tables are joined using `department_id`, then the result is filtered to the IT department.

### Pattern Learned
**JOIN + WHERE**

### Interview Tip
Use table aliases such as `e` and `d` to make joined queries easier to read.

---

## Quick Revision

| Requirement | Pattern |
|---|---|
| Filter rows | `WHERE` |
| Create groups | `GROUP BY` |
| Filter groups | `HAVING` |
| Combine matching tables | `INNER JOIN` |
| Join and filter | `JOIN + WHERE` |

### Key Takeaway

```text
WHERE → Filter rows
GROUP BY → Create groups
HAVING → Filter groups
JOIN → Combine tables
```
