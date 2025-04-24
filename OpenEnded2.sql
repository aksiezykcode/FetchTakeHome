SELECT SUM(t.FINAL_SALE) AS brand_sales, p.BRAND FROM "Transaction" t
JOIN Product p ON p.BARCODE = t.BARCODE
LEFT JOIN User u ON t.USER_ID = u.ID
WHERE CATEGORY_2 = "Dips & Salsa" AND (p.BRAND != '')
GROUP BY p.BRAND
ORDER BY brand_sales DESC;