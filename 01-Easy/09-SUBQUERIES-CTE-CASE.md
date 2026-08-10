# 09 - Subqueries, CTEs, and CASE

## Problem 41 - Employees Above Department Average

### Business Scenario
HR wants employees whose salary is higher than the average salary of their own department.

### SQL Solution

```sql
SELECT e.employee_id,
       e.name,
       e.department,
       e.salary
FROM Employees AS e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM Employees AS e2
    WHERE e2.department = e.department
);
```

### Explanation
The correlated subquery calculates the average salary for the current employee's department. The outer query keeps employees whose salary is above that department average.

### Pattern Learned
**Correlated subquery → Compare a row with its group average**

### Interview Tip
The subquery references a column from the outer query, which makes it correlated.

---

## Problem 42 - Employees Who Earn the Department Maximum

### Business Scenario
HR wants every employee who has the highest salary in their department.

### SQL Solution

```sql
SELECT e.employee_id,
       e.name,
       e.department,
       e.salary
FROM Employees AS e
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM Employees AS e2
    WHERE e2.department = e.department
);
```

### Explanation
For each employee, the subquery finds the maximum salary in that employee's department. Employees whose salary equals that maximum are returned.

### Pattern Learned
**Correlated subquery + MAX() → Top value per group**

### Interview Tip
Unlike `ROW_NUMBER()`, this approach can return multiple employees when there is a tie for the highest salary.

---

## Problem 43 - Categorize Employees by Salary

### Business Scenario
HR wants to classify employees into salary bands for reporting.

### SQL Solution

```sql
SELECT
    employee_id,
    name,
    salary,
    CASE
        WHEN salary >= 80000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM Employees;
```

### Explanation
`CASE` evaluates conditions from top to bottom and returns the result for the first matching condition.

### Pattern Learned
**CASE → Conditional logic**

### Interview Tip
The order of `WHEN` conditions matters. Put more specific or higher thresholds first when ranges overlap.

---

## Problem 44 - Mark Employees as Above or Below Average

### Business Scenario
Management wants a simple label showing whether each employee earns above or below the overall company average.

### SQL Solution

```sql
SELECT
    employee_id,
    name,
    salary,
    CASE
        WHEN salary > (SELECT AVG(salary) FROM Employees)
            THEN 'Above Average'
        ELSE 'Below or Equal Average'
    END AS salary_status
FROM Employees;
```

### Explanation
The subquery calculates the overall average salary. `CASE` then converts the comparison into a readable business label.

### Pattern Learned
**Subquery + CASE → Business classification**

### Interview Tip
`CASE` is often used to turn numerical calculations into categories that are easier for business users to understand.

---

## Problem 45 - CTE for Department Average Salary

### Business Scenario
HR wants a reusable result containing each department's average salary and then wants to identify departments whose average exceeds 60,000.

### SQL Solution

```sql
WITH DepartmentSalary AS (
    SELECT
        department,
        AVG(salary) AS average_salary
    FROM Employees
    GROUP BY department
)
SELECT
    department,
    average_salary
FROM DepartmentSalary
WHERE average_salary > 60000;
```

### Explanation
The CTE first calculates one average salary per department. The outer query then filters those calculated averages.

### Pattern Learned
**CTE + GROUP BY + filtering calculated results**

### Interview Tip
A CTE can make a multi-step query easier to read and debug.

---

## Quick Revision

| Requirement | Pattern |
|---|---|
| Compare with group average | Correlated subquery |
| Highest value per group | Correlated subquery + `MAX()` |
| Conditional labels | `CASE` |
| Classification using calculation | `CASE + Subquery` |
| Multi-step aggregation | `CTE` |

### Key Takeaway

```text
Correlated Subquery → Compare each row with its group
CASE                → Apply business rules
CTE                 → Break complex logic into readable steps
```
