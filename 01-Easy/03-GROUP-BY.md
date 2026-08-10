# 03 - GROUP BY

## Problem 11 - Employees per Department

### Business Scenario
HR wants to understand how many employees belong to each department.

### Question
Count the number of employees in each department.

### SQL Solution

```sql
SELECT department, COUNT(*) AS total_employees
FROM Employees
GROUP BY department;
```

### Expected Output

| department | total_employees |
|---|---:|
| Department name | Employee count |

### Explanation
`GROUP BY department` creates one group for each department. `COUNT(*)` then counts the employees in each group.

### Pattern Learned
**GROUP BY + COUNT() → Count records by category**

### Interview Tip
Every selected column that is not aggregated generally needs to appear in the `GROUP BY` clause.

---

## Problem 12 - Total Salary per Department

### Business Scenario
Finance wants to compare total salary expenses across departments.

### Question
Calculate the total salary for each department.

### SQL Solution

```sql
SELECT department, SUM(salary) AS total_salary
FROM Employees
GROUP BY department;
```

### Expected Output

| department | total_salary |
|---|---:|
| Department name | Department salary total |

### Explanation
Employees are grouped by department, and `SUM(salary)` calculates the salary total for each group.

### Pattern Learned
**GROUP BY + SUM() → Total by category**

### Interview Tip
Check whether NULL salary values should be treated specially before interpreting totals.

---

## Problem 13 - Average Salary per Department

### Business Scenario
HR wants to compare average compensation between departments.

### Question
Calculate the average salary for each department.

### SQL Solution

```sql
SELECT department, AVG(salary) AS average_salary
FROM Employees
GROUP BY department;
```

### Expected Output

| department | average_salary |
|---|---:|
| Department name | Average salary |

### Explanation
`GROUP BY department` creates one group per department, and `AVG(salary)` calculates the average salary within each group.

### Pattern Learned
**GROUP BY + AVG() → Average by category**

### Interview Tip
Average salary can be affected by NULL values because `AVG()` ignores NULL salary values.

---

## Problem 14 - Highest Salary per Department

### Business Scenario
HR wants to identify the highest salary offered in each department.

### Question
Find the highest salary for every department.

### SQL Solution

```sql
SELECT department, MAX(salary) AS highest_salary
FROM Employees
GROUP BY department;
```

### Expected Output

| department | highest_salary |
|---|---:|
| Department name | Highest salary |

### Explanation
Each department becomes a group, and `MAX(salary)` returns the largest salary within that group.

### Pattern Learned
**GROUP BY + MAX() → Maximum by category**

### Interview Tip
`MAX()` tells you the value, not which employee earned it. To return the employee details, you need another pattern such as a window function or subquery.

---

## Problem 15 - Lowest Salary per Department

### Business Scenario
HR wants to understand the minimum salary level in each department.

### Question
Find the lowest salary for every department.

### SQL Solution

```sql
SELECT department, MIN(salary) AS lowest_salary
FROM Employees
GROUP BY department;
```

### Expected Output

| department | lowest_salary |
|---|---:|
| Department name | Lowest salary |

### Explanation
Employees are grouped by department, and `MIN(salary)` returns the smallest salary in each group.

### Pattern Learned
**GROUP BY + MIN() → Minimum by category**

### Interview Tip
As with `MAX()`, `MIN()` returns the value only. It does not automatically return the employee associated with that value.

---

## Quick Revision

| Requirement | Pattern |
|---|---|
| Count by department | `GROUP BY + COUNT()` |
| Total by department | `GROUP BY + SUM()` |
| Average by department | `GROUP BY + AVG()` |
| Highest by department | `GROUP BY + MAX()` |
| Lowest by department | `GROUP BY + MIN()` |

### Key Takeaway

`GROUP BY` changes an aggregate calculation from an overall calculation into a calculation for each group.

```text
Without GROUP BY
→ One result for the whole table

With GROUP BY department
→ One result for each department
```
