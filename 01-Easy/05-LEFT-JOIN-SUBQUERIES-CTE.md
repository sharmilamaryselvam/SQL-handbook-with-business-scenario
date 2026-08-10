# 05 - LEFT JOIN, Subqueries, and CTE

## Problem 21 - Keep All Employees with Department Names

### Business Scenario
HR wants every employee in the report, including employees whose department information is missing.

### SQL Solution

```sql
SELECT e.employee_id, e.name, d.department_name
FROM Employees AS e
LEFT JOIN Departments AS d
    ON e.department_id = d.department_id;
```

### Explanation
A `LEFT JOIN` keeps every row from `Employees`. If an employee has no matching department, `department_name` is `NULL`.

### Pattern Learned
**LEFT JOIN → Keep all rows from the left table**

### Interview Tip
Use `LEFT JOIN` when the left table's records must not be lost because of missing matches.

---

## Problem 22 - Customers Without Orders

### Business Scenario
The sales team wants to identify customers who have never placed an order.

### SQL Solution

```sql
SELECT c.customer_id, c.customer_name
FROM Customers AS c
LEFT JOIN Orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
```

### Explanation
The `LEFT JOIN` keeps every customer. Customers with no matching order have `NULL` in the order columns. Filtering with `IS NULL` returns only those customers.

### Pattern Learned
**LEFT JOIN + IS NULL → Find missing matches**

### Interview Tip
This is a common SQL interview pattern for finding records that do not have a related record.

---

## Problem 23 - Employees Above Overall Average Salary

### Business Scenario
HR wants employees whose salary is higher than the company's average salary.

### SQL Solution

```sql
SELECT employee_id, name, salary
FROM Employees
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees
);
```

### Explanation
The subquery calculates the overall average salary. The outer query returns employees whose salary is greater than that value.

### Pattern Learned
**Scalar subquery → Compare rows with one calculated value**

### Interview Tip
A single-value subquery can be used directly with comparison operators such as `>`, `<`, and `=`.

---

## Problem 24 - Employee with the Lowest Salary

### Business Scenario
HR wants to identify the employee or employees receiving the lowest salary.

### SQL Solution

```sql
SELECT employee_id, name, salary
FROM Employees
WHERE salary = (
    SELECT MIN(salary)
    FROM Employees
);
```

### Explanation
The subquery finds the minimum salary. The outer query returns every employee whose salary equals that minimum.

### Pattern Learned
**Aggregate subquery → Find rows matching an extreme value**

### Interview Tip
This can return multiple employees when more than one employee shares the lowest salary.

---

## Problem 25 - Employees with Salary Above 60,000 Using a CTE

### Business Scenario
HR wants a reusable intermediate result containing higher-paid employees.

### SQL Solution

```sql
WITH HighSalaryEmployees AS (
    SELECT employee_id, name, department_id, salary
    FROM Employees
    WHERE salary > 60000
)
SELECT *
FROM HighSalaryEmployees;
```

### Explanation
The CTE creates a temporary named result set called `HighSalaryEmployees`. The outer query reads from that result.

### Pattern Learned
**CTE → Build a readable intermediate result**

### Interview Tip
A CTE does not permanently create a table. It exists for the duration of the statement.

---

## Quick Revision

| Requirement | Pattern |
|---|---|
| Keep all left-table rows | `LEFT JOIN` |
| Find records without a match | `LEFT JOIN + IS NULL` |
| Compare with overall average | Scalar subquery |
| Find minimum/maximum row | Subquery + `MIN()` / `MAX()` |
| Break a query into logical steps | CTE |

### Key Takeaway

```text
LEFT JOIN + IS NULL → Missing related records
Subquery            → Calculate a value for comparison
CTE                 → Make multi-step SQL readable
```

## Easy SQL 1–25 Complete

The first 25 Easy SQL problems are now documented.

Next milestone:

**Part 5 — Easy SQL Problems 26–50**
