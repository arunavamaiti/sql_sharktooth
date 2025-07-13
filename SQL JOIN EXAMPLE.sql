 TableA
value
1
1
1
1
1

🔸 TableB
value
1
1
1
1
1

1. INNER JOIN

SELECT A.col1, B.col1
FROM TableA A
INNER JOIN TableB B
ON A.col1 = B.col1;
All values are 1 in both tables:

Every row in A matches every row in B (5×5 = 25 rows)
✅ 2. LEFT JOIN

SELECT A.col1, B.col1
FROM TableA A
LEFT JOIN TableB B
ON A.col1 = B.col1;
Again, all values match → no NULLs → same 25 rows as inner join

🔸 Output: 25 rows (identical to INNER JOIN)

✅ 3. RIGHT JOIN

SELECT A.col1, B.col1
FROM TableA A
RIGHT JOIN TableB B
ON A.col1 = B.col1;
Same logic → still 25 rows.

✅ 4. FULL OUTER JOIN


SELECT A.col1, B.col1
FROM TableA A
FULL OUTER JOIN TableB B
ON A.col1 = B.col1;
Still all rows match → still 25 rows

📊 Final Summary:
Join Type	Rows	NULLs?	Description
INNER JOIN	25	No	5×5 matches
LEFT JOIN	25	No	All rows in A matched in B
RIGHT JOIN	25	No	All rows in B matched in A
FULL OUTER JOIN	25	No	All matched, no unmatched rows



🔢 Row-by-Row Breakdown
Let’s label rows for understanding:

TableA
Row	col1
A1	1
A2	1
A3	1
A4	1
A5	1

TableB
Row	col1
B1	1
B2	1
B3	1
B4	1
B5	1

Now, each of the 5 rows in A will match with all 5 rows in B:

A Row	B Row	Result
A1	B1	(1, 1)
A1	B2	(1, 1)
A1	B3	(1, 1)
A1	B4	(1, 1)
A1	B5	(1, 1)
A2	B1	(1, 1)
A2	B2	(1, 1)
A2	B3	(1, 1)
A2	B4	(1, 1)
A2	B5	(1, 1)
A3	B1	(1, 1)
A3	B2	(1, 1)
A3	B3	(1, 1)
A3	B4	(1, 1)
A3	B5	(1, 1)
A4	B1	(1, 1)
A4	B2	(1, 1)
A4	B3	(1, 1)
A4	B4	(1, 1)
A4	B5	(1, 1)
A5	B1	(1, 1)
A5	B2	(1, 1)
A5	B3	(1, 1)
A5	B4	(1, 1)
A5	B5	(1, 1)

🧮 Total Rows Returned:
Each row from A (5 rows) × each row from B (5 rows) =
5 × 5 = 25 rows

✅ That’s how INNER JOIN (and LEFT/RIGHT/FULL when all values match) returns 25 identical-looking rows.