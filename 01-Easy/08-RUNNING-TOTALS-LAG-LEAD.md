# 08 - Running Totals and Previous / Next Values

## Problem 36 - Running Total of Sales

### Business Scenario
Finance wants to see how total sales accumulate over time.

### SQL Solution

```sql
SELECT
    sale_id,
    sale_date,
    amount,
    SUM(amount) OVER(ORDER BY sale_date) AS running_total
FROM Sales;
```

### Explanation
`SUM() OVER(ORDER BY sale_date)` calculates a cumulative total. Each row contains the sales amount up to that point in time.

### Pattern Learned
**SUM() OVER(ORDER BY) → Running total**

### Interview Tip
A running total is different from a normal `SUM()`: the window function keeps every individual row.

---

## Problem 37 - Previous Day's Sales

### Business Scenario
Finance wants to compare each day's sales with the previous sales record.

### SQL Solution

```sql
SELECT
    sale_id,
    sale_date,
    amount,
    LAG(amount) OVER(ORDER BY sale_date) AS previous_day_amount
FROM Sales;
```

### Explanation
`LAG()` looks backward in the ordered result and returns the previous row's amount.

The first row has no previous row, so its `previous_day_amount` is `NULL`.

### Pattern Learned
**LAG() → Access a previous row**

### Interview Tip
`LAG()` is commonly used for period-over-period comparisons.

---

## Problem 38 - Next Day's Sales

### Business Scenario
Finance wants to see the next sales value alongside each current sales record.

### SQL Solution

```sql
SELECT
    sale_id,
    sale_date,
    amount,
    LEAD(amount) OVER(ORDER BY sale_date) AS next_day_amount
FROM Sales;
```

### Explanation
`LEAD()` looks forward in the ordered result and returns the next row's amount.

The last row has no next row, so its `next_day_amount` is `NULL`.

### Pattern Learned
**LEAD() → Access a following row**

### Interview Tip
Use `LEAD()` when the comparison requires information from a future row.

---

## Problem 39 - Salary Difference from Previous Employee

### Business Scenario
HR wants to compare each employee's salary with the salary of the employee immediately above them when employees are ordered by salary.

### SQL Solution

```sql
SELECT
    employee_id,
    name,
    salary,
    salary - LAG(salary) OVER(ORDER BY salary DESC) AS salary_difference
FROM Employees;
```

### Explanation
The employees are ordered by salary from highest to lowest. `LAG(salary)` returns the previous salary in that ordering. Subtracting it from the current salary gives the difference.

### Pattern Learned
**LAG() + arithmetic → Difference from previous row**

### Interview Tip
Always define the `ORDER BY` inside the window carefully because it determines what "previous" means.

---

## Problem 40 - Sales Change from Previous Record

### Business Scenario
A sales analyst wants to identify how much sales changed compared with the previous sales record.

### SQL Solution

```sql
SELECT
    sale_id,
    sale_date,
    amount,
    amount - LAG(amount) OVER(ORDER BY sale_date) AS sales_change
FROM Sales;
```

### Explanation
`LAG(amount)` retrieves the previous sales amount. Subtracting it from the current amount shows the change.

A positive result means sales increased compared with the previous record. A negative result means sales decreased.

### Pattern Learned
**Current value - LAG(value) → Change from previous record**

### Interview Tip
This pattern is a foundation for calculating day-over-day, month-over-month, or year-over-year changes.

---

## Quick Revision

| Requirement | Pattern |
|---|---|
| Running total | `SUM() OVER(ORDER BY ...)` |
| Previous value | `LAG()` |
| Next value | `LEAD()` |
| Difference from previous | `value - LAG(value)` |
| Period comparison | `LAG()` + arithmetic |

### Key Takeaway

```text
SUM() OVER() → Accumulate
LAG()        → Look backward
LEAD()       → Look forward
```
