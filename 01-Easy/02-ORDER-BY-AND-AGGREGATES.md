# 02 - ORDER BY and Aggregate Functions

## Problem 6 - Secondary Sorting

### Business Scenario
HR wants employees grouped alphabetically by department. Within each department, the highest-paid employees should appear first.

### Question
Display employee ID, name, department, and salary. Sort by department alphabetically and salary from highest to lowest.

### SQL Solution

```sql
SELECT employee_id, name, department, salary
FROM Employees
ORDER BY department ASC, salary DESC;
```

### Explanation
SQL first sorts by `department` in ascending order. When employees have the same department, `salary DESC` breaks the tie.

### Pattern Learned
**Multiple-column sorting**

### Interview Tip
The second `ORDER BY` column acts as a tie-breaker when values in the first column are equal.

---

## Problem 7 - Count Total Employees

### Business Scenario
HR wants to know how many employees are stored in the employee database.

### Question
Find the total number of employees.

### SQL Solution

```sql
SELECT COUNT(*) AS total_employees
FROM Employees;
```

### Expected Output

| total_employees |
|---:|
| Number of employees |

### Explanation
`COUNT(*)` counts rows in the result set.

### Pattern Learned
**COUNT(*) → Count rows**

### Interview Tip
`COUNT(*)` counts rows even when individual columns contain NULL values.

---

## Problem 8 - Total Salary

### Business Scenario
Finance wants to calculate the total salary expense represented in the employee table.

### Question
Calculate the total salary of all employees.

### SQL Solution

```sql
SELECT SUM(salary) AS total_salary
FROM Employees;
```

### Expected Output

| total_salary |
|---:|
| Sum of all salaries |

### Explanation
`SUM()` adds the non-NULL values in the `salary` column.

### Pattern Learned
**SUM() → Total value**

### Interview Tip
`SUM()` ignores NULL values.

---

## Problem 9 - Average Salary

### Business Scenario
HR wants to understand the average salary across the organization.

### Question
Calculate the average employee salary.

### SQL Solution

```sql
SELECT AVG(salary) AS average_salary
FROM Employees;
```

### Expected Output

| average_salary |
|---:|
| Average salary |

### Explanation
`AVG()` calculates the arithmetic mean of the non-NULL salary values.

### Pattern Learned
**AVG() → Average value**

### Interview Tip
`AVG(column)` ignores NULL values.

---

## Problem 10 - Highest and Lowest Salary

### Business Scenario
HR wants to understand the organization's salary range.

### Question
Find the highest and lowest employee salaries.

### SQL Solution

```sql
SELECT
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM Employees;
```

### Expected Output

| highest_salary | lowest_salary |
|---:|---:|
| Highest salary | Lowest salary |

### Explanation
`MAX()` returns the largest salary and `MIN()` returns the smallest salary.

### Pattern Learned
**MAX() / MIN() → Find extreme values**

### Interview Tip
`MAX()` and `MIN()` can also be combined with `GROUP BY` to find the highest or lowest value for each group.

---

## Quick Revision

| Requirement | SQL Pattern |
|---|---|
| Sort by multiple columns | `ORDER BY col1, col2` |
| Count rows | `COUNT(*)` |
| Calculate total | `SUM()` |
| Calculate average | `AVG()` |
| Highest value | `MAX()` |
| Lowest value | `MIN()` |

### Key Takeaway

```text
COUNT → How many?
SUM   → How much in total?
AVG   → What is the average?
MAX   → What is the highest?
MIN   → What is the lowest?
```
