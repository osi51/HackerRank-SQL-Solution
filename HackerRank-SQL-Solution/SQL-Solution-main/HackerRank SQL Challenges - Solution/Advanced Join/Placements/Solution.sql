SELECT  MYNAME
FROM
(
    SELECT 
        S.ID AS MYID, 
        S.NAME AS MYNAME, 
        P.SALARY AS MYSALARY, 
        F.FRIEND_ID AS FRNDID
    FROM STUDENTS S
    JOIN FRIENDS F ON S.ID = F.ID
    JOIN PACKAGES P ON P.ID = S.ID
    ORDER BY MYID ASC
) AS MYSALARY
JOIN PACKAGES P ON P.ID = FRNDID
WHERE MYSALARY < P.SALARY
ORDER BY P.SALARY ASC;