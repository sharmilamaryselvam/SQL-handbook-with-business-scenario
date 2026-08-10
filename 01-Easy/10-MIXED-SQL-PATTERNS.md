# 10 - Mixed SQL Interview Patterns

## Problem 46 - Top 2 Salaries in Each Department

### Business Scenario
HR wants the two highest-paid employees from every department.

### SQL Solution

```sql
WITH DepartmentRank AS (
    SELECT
        employee_id,
        name,
        department,
        salary,
        ROW_NUMBER() OVER(
            PARTITION BY department
            ORDER BY salary DESC
        ) AS dept_rank
    FROM Employees
)
SELECT
    employee_id,
    name,
    department,
    salary
FROM DepartmentRank
WHERE dept_rank <= 2;
```

### Explanation
The window function creates a separate salary ranking inside every department. The outer query keeps ranks 1 and 2.

### Pattern Learned
**Top N per group → ROW_NUMBER() + PARTITION BY**

### Interview Tip
For ties to be included, consider `DENSE_RANK()` instead of `ROW_NUMBER()`.

---

## Problem 47 - Customers with Orders Above 1,000

### Business Scenario
The sales team wants customers whose total order value exceeds 1,000.

### SQL Solution

```sql
SELECT
    c.customer_id,
    c.customer_name,
    SUM(o.amount) AS total_amount
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
HAVING SUM(o.amount) > 1000;
```

### Explanation
Orders are joined to customers, grouped by customer, and summed. `HAVING` filters the aggregated customer totals.

### Pattern Learned
**JOIN + GROUP BY + SUM() + HAVING**

### Interview Tip
When selecting a non-aggregated column with an aggregate, include it in the `GROUP BY`.

---

## Problem 48 - Total Order Amount for Every Customer

### Business Scenario
Management wants a customer report that includes customers who have never placed an order.

### SQL Solution

```sql
SELECT
    c.customer_id,
    c.customer_name,
    COALESCE(SUM(o.amount), 0) AS total_amount
FROM Customers AS c
LEFT JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name;
```

### Explanation
`LEFT JOIN` preserves every customer. Customers without orders have no matching order amount, so `COALESCE()` converts the resulting NULL total to 0.

### Pattern Learned
**LEFT JOIN + SUM() + COALESCE() → Include zero-activity records**

### Interview Tip
In SQL Server, `ISNULL(SUM(o.amount), 0)` can be used instead of `COALESCE()`.

---

## Problem 49 - Employees Outside the IT Department

### Business Scenario
HR wants employees who do not belong to the IT department.

### SQL Solution

```sql
SELECT
    employee_id,
    name
FROM Employees
WHERE department_id NOT IN (
    SELECT department_id
    FROM Departments
    WHERE department_name = 'IT'
);
```

### Explanation
The subquery finds the department ID belonging to IT. The outer query returns employees whose department ID is not that value.

### Pattern Learned
**Subquery + NOT IN → Exclude a related category**

### Interview Tip
Be careful with `NOT IN` when the subquery can return NULL. In such cases, `NOT EXISTS` is often safer.

---

## Problem 50 - Complete Department Salary Report

### Business Scenario
Management wants a department-level salary report showing employee count, average salary, total salary, and the highest salary.

### SQL Solution

```sql
SELECT
    d.department_name,
    COUNT(e.employee_id) AS total_employees,
    AVG(e.salary) AS average_salary,
    SUM(e.salary) AS total_salary,
    MAX(e.salary) AS highest_salary
FROM Departments AS d
LEFT JOIN Employees AS e
    ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;
```

### Explanation
The department table is used as the starting point so every department can appear in the report. The `LEFT JOIN` preserves departments with no employees. Aggregate functions calculate the department-level metrics.

### Pattern Learned
**LEFT JOIN + GROUP BY + Multiple Aggregates**

### Interview Tip
This is a realistic reporting query because it combines joins, grouping, and several aggregate functions in one result.

---

## Quick Revision

| Requirement | Pattern |
|---|---|
| Top N per department | `ROW_NUMBER() + PARTITION BY` |
| Customers above total threshold | `GROUP BY + HAVING SUM()` |
| Include customers with zero orders | `LEFT JOIN + COALESCE()` |
| Exclude a category | `NOT IN (subquery)` |
| Department summary report | `LEFT JOIN + GROUP BY + aggregates` |

# 🎉 Easy SQL Problems 1–50 Complete

You have now completed the full Easy SQL section.

## Skills Covered

- `SELECT`
- `WHERE`
- `IN`
- `BETWEEN`
- `LIKE`
- `ORDER BY`
- Aggregate functions
- `GROUP BY`
- `HAVING`
- `INNER JOIN`
- `LEFT JOIN`
- `IS NULL`
- `COALESCE()` / `ISNULL()`
- Subqueries
- Correlated subqueries
- CTEs
- `CASE`
- `ROW_NUMBER()`
- `RANK()`
- `DENSE_RANK()`
- `PARTITION BY`
- `SUM() OVER()`
- `LAG()`
- `LEAD()`

## The Main Interview Patterns

```text
Filter          → WHERE
Sort            → ORDER BY
Summarize       → GROUP BY + aggregate
Filter groups   → HAVING
Combine tables  → JOIN
Find missing    → LEFT JOIN + IS NULL
Compare values  → Subquery
Simplify steps  → CTE
Conditional     → CASE
Top N per group → ROW_NUMBER() + PARTITION BY
Running total   → SUM() OVER()
Previous row    → LAG()
Next row        → LEAD()
```

**Next milestone: Part 6 – Final Repository Polish.**
