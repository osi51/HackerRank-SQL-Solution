SELECT HKRS.DT, 
       DLY_HKRS, 
       HKR_ID, 
       NAME
FROM (
    SELECT HKR_ID, 
           NAME, 
           DT
    FROM (
        SELECT H.HACKER_ID AS HKR_ID,
               NAME, 
               COUNT(SUBMISSION_ID) AS SUBS, 
               SUBMISSION_DATE AS DT, 
               ROW_NUMBER() OVER(PARTITION BY SUBMISSION_DATE ORDER BY COUNT(SUBMISSION_ID) DESC) AS RANK
        FROM SUBMISSIONS S
        LEFT JOIN HACKERS H ON H.HACKER_ID = S.HACKER_ID
        GROUP BY SUBMISSION_DATE, H.HACKER_ID, NAME
        ORDER BY SUBMISSION_DATE, COUNT(SUBMISSION_ID) DESC,         
                 H.HACKER_ID
    )
    WHERE RANK = 1
) HKRS
LEFT JOIN (
         SELECT DAT, DLY_HKRS
         FROM (
             SELECT SUBMISSION_DATE AS DAT, 
             COUNT(DISTINCT HACKER_ID) AS DLY_HKRS
             FROM(
                 SELECT DISTINCT HACKER_ID, 
                 SUBMISSION_DATE, 
                 DENSE_RANK() OVER(PARTITION BY HACKER_ID ORDER BY SUBMISSION_DATE) AS CNSSTNT,    
                 DENSE_RANK() OVER(ORDER BY SUBMISSION_DATE) AS DT
                 FROM SUBMISSIONS
                 GROUP BY SUBMISSION_DATE, HACKER_ID
             )
              WHERE CNSSTNT = DT
              GROUP BY SUBMISSION_DATE
         )
         ORDER BY DAT
) DAILY_HKRS ON DAILY_HKRS.DAT = HKRS.DT;