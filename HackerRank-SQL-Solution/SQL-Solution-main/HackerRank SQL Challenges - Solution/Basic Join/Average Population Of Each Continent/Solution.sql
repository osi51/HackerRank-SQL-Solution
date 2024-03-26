SELECT CO.CONTINENT, FLOOR(AVG(C.POPULATION), 0)
FROM CITY C
JOIN COUNTRY CO ON C.COUNTRYCODE = CO.CODE
GROUP BY CO.CONTINENT;
