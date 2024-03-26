SELECT 
    T4.HACKER_ID, 
    T4.NAME, 
    T4.CNT
FROM (
    SELECT 
        T3.HACKER_ID, 
        T3.MXCNT, 
        T3.NAME, 
        T3.CNT, 
        T3.RN, 
        MAX(T3.RN) OVER(PARTITION BY T3.CNT ORDER BY T3.CNT DESC) AS RNMX
    FROM (
        SELECT 
            T2.*, 
            ROW_NUMBER() OVER(PARTITION BY T2.CNT ORDER BY T2.CNT DESC) AS RN
        FROM (
            SELECT 
                T1.*, 
                MAX(CNT) OVER() AS MXCNT
            FROM (
                SELECT 
                    HACKERS.HACKER_ID, 
                    HACKERS.NAME, 
                    COUNT(CHALLENGES.CHALLENGE_ID) AS CNT
                FROM 
                    HACKERS
                LEFT JOIN 
                    CHALLENGES ON HACKERS.HACKER_ID = CHALLENGES.HACKER_ID
                GROUP BY 
                    HACKERS.HACKER_ID, 
                    HACKERS.NAME
            ) T1
        ) T2
    ) T3
) T4
WHERE 
    T4.MXCNT = T4.CNT OR T4.RNMX = 1
ORDER BY 
    T4.CNT DESC, 
    T4.HACKER_ID;

