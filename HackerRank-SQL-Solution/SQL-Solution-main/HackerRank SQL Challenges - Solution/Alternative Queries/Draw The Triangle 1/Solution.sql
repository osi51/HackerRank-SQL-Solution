WITH RECURSIVE TRNGL AS (
    SELECT 
        20 AS T, 
        1 AS R, 
        '* * * * * * * * * * * * * * * * * * * *' AS TRNGL
    UNION ALL
    SELECT 
        20, 
        R + 1, 
        SUBSTRING(TRNGL, 1, LENGTH(TRNGL) - 2) AS TRNGL
    FROM 
        TRNGL
    WHERE 
        T > R
)
SELECT TRNGL
FROM TRNGL
ORDER BY TRNGL DESC;

