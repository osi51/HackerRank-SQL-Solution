SELECT 
    CLN.CONID, 
    CLN.HACID, 
    CLN.NAM, 
    SUM(ASS.TS), 
    SUM(ASS.TAS), 
    SUM(AVS.TV), 
    SUM(AVS.TUV)
FROM 
    CHALLENGES CH
LEFT JOIN (
    SELECT 
        CHALLENGE_ID, 
        SUM(TOTAL_SUBMISSIONS) AS TS, 
        SUM(TOTAL_ACCEPTED_SUBMISSIONS) AS TAS
    FROM 
        SUBMISSION_STATS SS 
    GROUP BY 
        CHALLENGE_ID
) ASS ON ASS.CHALLENGE_ID = CH.CHALLENGE_ID
LEFT JOIN (
    SELECT 
        CHALLENGE_ID, 
        SUM(TOTAL_VIEWS) AS TV, 
        SUM(TOTAL_UNIQUE_VIEWS) AS TUV
    FROM 
        VIEW_STATS VS 
    GROUP BY 
        CHALLENGE_ID
) AVS ON CH.CHALLENGE_ID = AVS.CHALLENGE_ID
LEFT JOIN (
    SELECT 
        C.COLLEGE_ID AS COLID, 
        C.CONTEST_ID AS CONID, 
        CO.HACKER_ID AS HACID, 
        CO.NAME AS NAM
    FROM 
        COLLEGES C 
    LEFT JOIN 
        CONTESTS CO ON C.CONTEST_ID = CO.CONTEST_ID
) CLN ON CLN.COLID = CH.COLLEGE_ID
GROUP BY 
    CLN.CONID, 
    CLN.HACID, 
    CLN.NAM
HAVING 
    SUM(ASS.TS) != 0 OR 
    SUM(ASS.TAS) != 0 OR 
    SUM(AVS.TV) != 0 OR 
    SUM(AVS.TUV) != 0
ORDER BY 
    CLN.CONID;
