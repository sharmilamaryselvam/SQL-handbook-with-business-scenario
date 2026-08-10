# 07 - Window Functions

## Problem 31 - Assign a Salary Row Number

### Business Scenario
HR wants employees numbered from the highest salary to the lowest salary.

### SQL Solution
```sql
SELECT *,
       ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num
FROM Employees;
```

### Explanation
`ROW_NUMBER()` assigns a unique sequential number according to salary order.

### Pattern Learned
**ROW_NUMBER() → Unique row numbering**

### Interview Tip
Even employees with equal salaries receive different row numbers.

---

## Problem 32 - Rank Employees by Salary

### Business Scenario
HR wants employees ranked by salary, allowing employees with the same salary to share a rank.

### SQL Solution
```sql
SELECT employee_id, name, salary,
       RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM Employees;
```

### Explanation
Equal salaries receive the same rank. The next rank can contain a gap.

### Pattern Learned
**RANK() → Ranking with gaps**

### Interview Tip
If two employees share rank 1, the next employee receives rank 3.

---

## Problem 33 - Dense Rank Employees by Salary

### Business Scenario
HR wants salary rankings without gaps after ties.

### SQL Solution
```sql
SELECT employee_id, name, salary,
       DENSE_RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM Employees;
```

### Explanation
Equal salaries receive the same rank, but the next rank remains consecutive.

### Pattern Learned
**DENSE_RANK() → Ranking without gaps**

### Interview Tip
`DENSE_RANK()` is useful for questions such as second-highest salary when duplicate salaries should share the same rank.

---

## Problem 34 - Rank Employees Within Each Department

### Business Scenario
HR wants each employee's salary position within their own department.

### SQL Solution
```sql
SELECT employee_id, name, department, salary,
       ROW_NUMBER() OVER(
           PARTITION BY department
           ORDER BY salary DESC
       ) AS dept_rank
FROM Employees;
```

### Explanation
`PARTITION BY department` creates a separate ranking sequence for each department.

### Pattern Learned
**PARTITION BY + ROW_NUMBER() → Rank within groups**

### Interview Tip
`PARTITION BY` does not reduce rows like `GROUP BY` does.

---

## Problem 35 - Highest-Paid Employee in Each Department

### Business Scenario
Management wants the highest-paid employee from each department.

### SQL Solution
```sql
WITH DepartmentRank AS (
    SELECT employee_id, name, department, salary,
           ROW_NUMBER() OVER(
               PARTITION BY department
               ORDER BY salary DESC
           ) AS dept_rank
    FROM Employees
)
SELECT employee_id, name, department, salary
FROM DepartmentRank
WHERE dept_rank = 1;
```

### Explanation
The CTE assigns a salary position within each department. The outer query keeps rank 1.

### Pattern Learned
**CTE + ROW_NUMBER() + PARTITION BY**

### Interview Tip
This is a key SQL interview pattern for finding the top record in each group.

---

## Quick Revision

| Requirement | Pattern |
|---|---|
| Unique numbering | `ROW_NUMBER()` |
| Ranking with gaps | `RANK()` |
| Ranking without gaps | `DENSE_RANK()` |
| Rank within groups | `PARTITION BY` |
| Top 1 per group | `ROW_NUMBER() + PARTITION BY` |
