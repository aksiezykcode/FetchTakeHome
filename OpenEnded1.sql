SELECT (strftime('%Y', 'now') - strftime('%Y',u.birth_date)) AS Age, COUNT(t.RECEIPT_ID) AS Recipts_Submitted,  u.ID, u.Gender, u.State, u.Language FROM "Transaction" t 
JOIN "User" u ON u.ID = t.USER_ID
GROUP BY u.ID
ORDER BY Recipts_Submitted DESC;