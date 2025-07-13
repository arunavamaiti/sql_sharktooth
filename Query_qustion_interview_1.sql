Data Table (employees)
empid	empname	empsalary	managerid
111	aaa	10000	000 ← CEO
222	bbb	8000	111
333	ccc	9000	111
444	ddd	7500	333
555	eee	6000	222


 1. Number of employees reporting to CEO
Assume the CEO's empid is 111 (because managerid = 000, which does not exist).

SELECT COUNT(*) AS employees_reporting_to_ceo
FROM employees
WHERE managerid = 111;
Output: 2 (Employees 222 and 333)

✅ 2. Number of employees who are managers
(Their empid appears as managerid in other rows)

SELECT COUNT(DISTINCT managerid) AS total_managers
FROM employees
WHERE managerid IS NOT NULL
  AND managerid IN (SELECT empid FROM employees);

Output: 3
(111, 222, 333 each manage someone)

✅ 3. Number of employees earning more than their managers
Use a self-join to compare employee vs. manager salary.

SELECT COUNT(*) AS employees_earning_more_than_managers
FROM employees e
JOIN employees m ON e.managerid = m.empid
WHERE e.empsalary > m.empsalary;

Output: 1
Only 333 earns 9000, which is more than manager 111 who earns 10000? → No
But check 333 (9000) > 111 (10000)? False
Now 444 (7500) vs 333 (9000) → False
But if 333 was earning 11000, then output would be 1.

Actually, none earn more than their managers → Output: 0