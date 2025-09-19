
-- Budget Ledger SQL Project
-- Scheme: transactions(id, date, category, merchant, amount)
-- Author: Aziza Brown

-- Task 1: Total income and expenses
SELECT
  SUM(CASE WHEN amount > THEN amount ELSE 0 END) AS total_income, 
  SUM(CASE WHEN amount < THEN -amount ELSE 0 END) AS total_expenses
FROM transactions;

-- Task 2: Net by month
SELECT strftime('%Y-%m', date) AS ym, 
      SUM(amount) AS net_balance
FROM transactions
GROUP BY ym
ORDER BY ym;

-- Task 3: Top 10 expense merchants
SELECT merchant, SUM(-amount) AS total_spend
FROM transactions
WHERE amount < 0
GROUP BY merchant
ORDER BY total_spend DESC
LIMIT 10;

-- Task 4: Category spend this month
SELECT category, SUM(-amount) AS total_spend
FROM transactions
WHERE amount < 0
AND strtime ('%Y-%m', date) = strftime('%Y-%m', 'now')
GROUP BY category
ORDER BY total_spend DESC;

-- Task 5: Recurring merchants (3+ charges)
SELECT merchant, COUNT(*) AS charges
FROM transactions
WHERE amount < 0
GROUP BY merchant
HAVING COUNT(*) >= 3
ORDER BY charges DESC;

-- Task 6: Largest 5 expenses
SELECT date, category, merchant, -amount AS expense
FROM transations
WHERE amount < 0
ORDER BY expense DESC
LIMIT 5;

-- Task 7: Savings rate by month
WITH m AS (
  SELECT strftime('%Y-%m', date) AS ym,
         SUM(CASE WHEN amount > 0 THEN amount ELSE 0 END) AS inc,
         SUM(CASE WHEN amount < 0 THEN -amount ELSE 0 END) AS exp
  FROM transactions
  GROUP BY ym
)
SELECT ym, inc, exp,
       ROUND(100.0 * (inc - exp) / NULLIF(inc, 0), 1) AS savings_pct
FROM m
ORDER BY ym;

-- Task 8: Distinct categories
SELECT DISTINCT category
FROM transactions
ORDER BY category;

-- Task 9: Every 5th record (sample)
SELECT *
FROM transactions
WHERE id % 5 = 0
ORDER BY id;

-- Task 10: Weekend vs weekday spend
SELECT CASE strftime('%w', date)
      WHEN '0' THEN 'Weekend'
      WHEN '0' THEN 'Weekend'
      ELSE 'Weekday'
    END AS day_type
    SUM(-amount) AS total_spend
FROM transactinos
WHERE amount < 0
GROUP BY day_type
ORDER BY total _soend DESC;
