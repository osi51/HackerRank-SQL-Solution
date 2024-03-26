SELECT T1.X AS X, 
       T1.Y AS Y
FROM Functions T1
LEFT JOIN FUNCTIONS T2 ON T2.Y = T1.X
WHERE T1.X <> T1.Y 
       and T1.X < T1.Y 
       and T1.X = T2.Y 
       and T1.Y = T2.X
UNION ALL 
SELECT X, 
       Y
FROM Functions T1
GROUP BY X, Y
HAVING COUNT(*) > 1
ORDER BY X;
