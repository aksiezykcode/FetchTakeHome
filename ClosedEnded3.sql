SELECT  ROUND(
        100 * SUM(t.FINAL_SALE) / (
            SELECT SUM(t.FINAL_SALE)
            FROM "Transaction" t
            JOIN User u ON t.USER_ID = u.ID
            JOIN Product p ON t.BARCODE = p.BARCODE
            WHERE p.CATEGORY_1 = 'Health & Wellness'
        ),
        2
    ) AS Percent_of_Total,
CASE
	WHEN strftime('%Y', u.birth_date) BETWEEN '1928' AND '1945' THEN 'Silent Generation'
	WHEN strftime('%Y', u.birth_date) BETWEEN '1946' AND '1964' THEN 'Baby Boomer'
	WHEN strftime('%Y', u.birth_date) BETWEEN '1965' AND '1980' THEN 'Gen X'
	WHEN strftime('%Y', u.birth_date) BETWEEN '1981' AND '1996' THEN 'Millennial'
	WHEN strftime('%Y', u.birth_date) BETWEEN '1997' AND '2012' THEN 'Gen Z'
	WHEN strftime('%Y', u.birth_date) BETWEEN '2013' AND '2024' THEN 'Gen Alpha'
	ELSE 'Not Known'
END AS Generation
FROM "Transaction" t
JOIN User u ON t.USER_ID = u.ID 
JOIN Product p ON t.BARCODE = p.BARCODE
WHERE p.CATEGORY_1 = "Health & Wellness"
GROUP BY Generation
ORDER BY Percent_of_Total DESC;