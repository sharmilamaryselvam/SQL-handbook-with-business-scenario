# 01 - WHERE Clause

## Problem 1 - Employees from Chennai or Bangalore

### Business Scenario
HR wants a list of employees working in Chennai or Bangalore.

### SQL
```sql
SELECT employee_id, name, city
FROM Employees
WHERE city IN ('Chennai','Bangalore');
```

### Pattern Learned
`IN` filters multiple values.

### Interview Tip
Use `IN` instead of multiple `OR` conditions.

---

## Problem 2 - Salary Between ₹50,000 and ₹70,000

### Business Scenario
Find employees eligible for a salary review.

### SQL
```sql
SELECT employee_id, name, salary
FROM Employees
WHERE salary BETWEEN 50000 AND 70000;
```

### Pattern Learned
`BETWEEN` includes both boundary values.

---

## Problem 3 - Names Starting with 'A'

### Business Scenario
Marketing needs employees whose names start with A.

### SQL
```sql
SELECT employee_id, name, city
FROM Employees
WHERE name LIKE 'A%';
```

### Pattern Learned
`LIKE 'A%'` matches values beginning with A.

---

## Problem 4 - Sort Salary (Ascending)

### Business Scenario
Display employees from the lowest salary to the highest.

### SQL
```sql
SELECT employee_id, name, salary
FROM Employees
ORDER BY salary ASC;
```

### Pattern Learned
`ORDER BY ASC` sorts from smallest to largest.

---

## Problem 5 - Sort Salary (Descending)

### Business Scenario
Display highest-paid employees first.

### SQL
```sql
SELECT employee_id, name, salary
FROM Employees
ORDER BY salary DESC;
```

### Pattern Learned
`ORDER BY DESC` sorts from largest to smallest.

## Quick Revision

- Multiple values → `IN`
- Range → `BETWEEN`
- Pattern matching → `LIKE`
- Ascending sort → `ORDER BY ASC`
- Descending sort → `ORDER BY DESC`
