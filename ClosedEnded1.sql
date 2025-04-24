SELECT COUNT(t.receipt_id) AS receipts, p.brand FROM "Transaction" t
JOIN Product p ON p.BARCODE = t.BARCODE
LEFT JOIN User u ON t.USER_ID = u.ID
WHERE strftime('%Y',t.PURCHASE_DATE) - strftime('%Y',u.birth_date) >= 21 AND p.brand IS NOT NULL
GROUP BY p.brand
ORDER BY receipts DESC
LIMIT 5;