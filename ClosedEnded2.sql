SELECT SUM(t.FINAL_SALE) AS Sales, p.brand FROM "Transaction" t
JOIN Product p ON p.BARCODE = t.BARCODE
LEFT JOIN User u ON t.USER_ID = u.ID
WHERE strftime('%m',t.PURCHASE_DATE) - strftime('%m',u.CREATED_DATE) >= 6
GROUP BY p.BRAND
ORDER BY Sales DESC
LIMIT 5;