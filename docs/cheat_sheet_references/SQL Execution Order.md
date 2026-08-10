# SQL Execution Order

## Logical Execution Order

|Step|Clause|Purpose|
|---:|---|---|
|1|FROM|Choose source tables|
|2|JOIN|Combine tables|
|3|ON|Join condition|
|4|WHERE|Filter rows|
|5|GROUP BY|Create groups|
|6|HAVING|Filter groups|
|7|WINDOW FUNCTIONS|Calculate window values|
|8|SELECT|Project columns|
|9|DISTINCT|Remove duplicates|
|10|ORDER BY|Sort result|
|11|LIMIT/TOP|Return required rows|

## Visual Flow
FROM → JOIN → ON → WHERE → GROUP BY → HAVING → WINDOW → SELECT → DISTINCT → ORDER BY → LIMIT

## Example
```sql
SELECT department, AVG(salary) AS avg_salary
FROM Employees
WHERE salary>50000
GROUP BY department
HAVING AVG(salary)>60000
ORDER BY avg_salary DESC;
```

## WHERE vs HAVING
- WHERE filters rows.
- HAVING filters grouped results.

## GROUP BY vs PARTITION BY
- GROUP BY reduces rows.
- PARTITION BY keeps all rows while creating logical partitions.

## Common Mistakes
- Aggregate in WHERE.
- Missing GROUP BY.
- Forgetting ORDER BY with ranking.

## Interview Quick Revision
- WHERE before GROUP BY
- HAVING after GROUP BY
- ORDER BY is one of the last logical steps.
