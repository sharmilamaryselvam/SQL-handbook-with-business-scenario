# SQL Interview Handbook

A practical SQL practice repository designed for **Data Analyst interview preparation**.

This handbook focuses on solving SQL problems, understanding reusable query patterns, and building strong interview-ready SQL fundamentals through practice.

---

## 🎯 Goal

The goal of this repository is not to memorize SQL syntax.

It is to learn how to:

- Understand a business question
- Identify the required SQL pattern
- Write a clean query
- Understand why the query works
- Explain the solution in an interview
- Reuse the same pattern for different problems

---

## 📚 Repository Structure

```text
sql-handbook/
│
├── 01-Easy/
│   └── 50 Easy SQL Problems
│
├── datasets/
│   ├── employees.sql
│   ├── departments.sql
│   ├── customers.sql
│   ├── orders.sql
│   └── sales.sql
│
├── docs/
│   ├── SQL Execution Order
│   ├── SQL Patterns Cheat Sheet
│   ├── SQL Interview Q&A
│   └── SQL Quick Reference
│
├── CONTRIBUTING.md
├── LICENSE
└── README.md
```

---

## 🟢 Easy SQL — 50 Problems

The Easy section contains **50 practical SQL problems** covering the most important SQL patterns used in Data Analyst interviews.

### Topics Covered

| Topic | What You Practice |
|---|---|
| SELECT | Selecting required columns |
| WHERE | Filtering rows |
| ORDER BY | Sorting results |
| Aggregate Functions | `COUNT`, `SUM`, `AVG`, `MIN`, `MAX` |
| GROUP BY | Creating groups |
| HAVING | Filtering aggregated groups |
| INNER JOIN | Combining matching records |
| LEFT JOIN | Preserving unmatched records |
| IS NULL | Finding missing values |
| COALESCE / ISNULL | Handling NULL values |
| Subqueries | Using query results inside another query |
| Correlated Subqueries | Comparing rows with group-level values |
| CTE | Breaking queries into logical steps |
| CASE | Applying conditional business logic |
| ROW_NUMBER | Unique row numbering |
| RANK | Ranking with gaps |
| DENSE_RANK | Ranking without gaps |
| PARTITION BY | Window calculations within groups |
| Running Total | Cumulative calculations |
| LAG | Accessing previous rows |
| LEAD | Accessing next rows |

---

## 📂 Easy Problems

The 50 problems are organized into topic-based files inside [`01-Easy`](./01-Easy/).

### Problems 1–25

Covers SQL fundamentals, filtering, aggregation, joins, subqueries, and CTEs.

### Problems 26–50

Covers joins and aggregations, window functions, running totals, `LAG`, `LEAD`, correlated subqueries, `CASE`, and mixed interview patterns.

---

## 🗃️ Reusable Datasets

The [`datasets`](./datasets/) folder contains reusable SQL datasets for practicing the problems.

### Available Tables

**Employees**

Used for:
- Employee information
- Departments
- Salaries
- Salary ranking
- Window functions

**Departments**

Used for:
- Department information
- Employee-department joins
- Department-level analysis

**Customers**

Used for:
- Customer analysis
- Customer-level aggregation
- Customers without orders

**Orders**

Used for:
- Order analysis
- Customer spending
- Aggregation and joins

**Sales**

Used for:
- Sales analysis
- Running totals
- Previous and next value analysis

---

## 📖 Documentation

The [`docs`](./docs/) folder contains quick-reference material for SQL learning and interview preparation.

It includes:

- SQL Execution Order
- SQL Patterns Cheat Sheet
- SQL Interview Q&A
- SQL Quick Reference

These documents are intended for **revision**, while the problem files are intended for **practice**.

---

## 🧠 How to Practice

For each problem, follow this process:

```text
1. Read the business scenario
        ↓
2. Identify the SQL pattern
        ↓
3. Try writing the query yourself
        ↓
4. Run the query using the dataset
        ↓
5. Compare with the solution
        ↓
6. Understand WHY it works
        ↓
7. Explain it without looking at the answer
```

### Important

Don't try to memorize all 50 queries.

Instead, recognize the pattern.

For example:

```text
Need highest-paid employee per department?
                ↓
       PARTITION BY department
                ↓
          ROW_NUMBER()
                ↓
             rank = 1
```

The same pattern can be used for products, customers, categories, stores, or any other business entity.

---

## 💼 Data Analyst Interview Focus

This repository is built around common Data Analyst SQL requirements such as:

- Finding top customers
- Finding highest/lowest salaries
- Department-level analysis
- Customers with no orders
- Aggregating sales
- Comparing values with averages
- Finding top N records per group
- Calculating running totals
- Comparing current and previous values
- Creating business classifications

The goal is to move from:

**"I know SQL syntax."**

to:

**"I can solve a business problem using SQL and explain my approach."**

---

## 🛠️ SQL Concepts Used

```text
SELECT
WHERE
ORDER BY
GROUP BY
HAVING
INNER JOIN
LEFT JOIN
IS NULL
COALESCE
ISNULL
COUNT
SUM
AVG
MIN
MAX
CASE
Subqueries
Correlated Subqueries
CTEs
ROW_NUMBER
RANK
DENSE_RANK
PARTITION BY
LAG
LEAD
Window Functions
```

---

## 🚀 Learning Roadmap

```text
Easy SQL
50 Problems
    ↓
Intermediate SQL
    ↓
Advanced SQL
    ↓
Data Analyst SQL Interview Practice
    ↓
Real-world Business Case Studies
```

The repository will grow gradually as new levels are completed.

---

## ⭐ Why This Repository?

This is a **practice-first SQL repository**.

It is intentionally kept simple so that it can be used with free SQL practice environments and local SQL databases without depending on paid tools.

The focus is:

**Learn → Practice → Understand → Explain → Repeat**

---

## 👩‍💻 Author

**Sharmila Mary**

Aspiring Data Analyst with a background in Android development, currently building skills in:

- SQL
- Python
- Pandas
- NumPy
- Excel
- Power BI
- Statistics
- Data Analysis

---

## 📌 Current Progress

| Section | Status |
|---|---|
| Project Foundation | ✅ Complete |
| Reusable Datasets | ✅ Complete |
| SQL Documentation | ✅ Complete |
| Easy SQL Problems 1–50 | ✅ Complete |
| Intermediate SQL | 🔜 Next |
| Advanced SQL | 🔜 Later |
| Real-world Case Studies | 🔜 Later |

---

## 📄 License

This project is available under the license included in this repository.

---

### If you are using this repository to prepare for interviews:

**Don't just copy the query.**

Try it yourself first.

Understand the pattern.

Then explain it as if you are sitting in an interview.
