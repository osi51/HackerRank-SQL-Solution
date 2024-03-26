SELECT 
    CASE 
        WHEN (A + B <= C OR B + C <= A OR A + C <= B) THEN 'Not A Triangle' 
        WHEN (A = B AND B = C) THEN 'Equilateral' 
        WHEN (A != B AND B != C AND C != A) THEN 'Scalene' 
        ELSE 'Isosceles' 
    END
FROM TRIANGLE;
