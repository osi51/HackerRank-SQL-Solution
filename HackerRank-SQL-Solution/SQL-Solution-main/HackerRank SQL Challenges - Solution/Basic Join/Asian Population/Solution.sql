SELECT SUM(C.POPULATION)
FROM CITY C
JOIN COUNTRY CO ON C.COUNTRYCODE = CO.CODE
WHERE COUNTRY.CONTINENT = 'Asia';
