# Budget Ledger SQL Project

## Scenario
A Simple personal finance ledger that tracks income (+) and expenses (-).
This project analyzes spending habits, recurring charges, and savings trends.

## Schema 
**Table: transactions
- id (INTEGER, PRIMARY KEY)
- date (DATE)
- category (TEXT)
- merchant (text)
- amount (real) -- income > 0, expense < 0

## Tasks
1. Total inccome and total expenses
2. Net balance by month
3. Top 10 expense merchants
4. Category spend breakdown for the current month
5. Recurring merchants (3+ charges)
6. Largest 5 expenses
7. Savings rate by month
8. Distinct categories used
9. Every 5th record sample (for testing)
10. Weekend vs weekday spending

## What this project shows
- CASE expressions for logic
- Date grouping and trens analysis
- Aggregations, percentages, and filtering
- Practical finance queries with clear results

> **Disclaimer**
> Fictional dataset for educational purposes only.
> No real financial records are included.
