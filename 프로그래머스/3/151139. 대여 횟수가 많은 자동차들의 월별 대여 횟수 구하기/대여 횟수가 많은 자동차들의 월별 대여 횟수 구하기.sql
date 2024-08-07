-- 코드를 입력하세요
SELECT EXTRACT(MONTH FROM START_DATE) AS MONTH, CAR_ID, COUNT(CAR_ID) AS RECORDS 
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE CAR_ID IN (
        SELECT CAR_ID FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
        WHERE START_DATE BETWEEN TO_DATE('2022-08-01','YYYY-MM-DD') AND TO_DATE('2022-10-31','YYYY-MM-DD')
        GROUP BY CAR_ID
        HAVING COUNT(CAR_ID) >=5
    ) 
    AND START_DATE BETWEEN TO_DATE('2022-08-01','YYYY-MM-DD') AND TO_DATE('2022-10-31','YYYY-MM-DD')
GROUP BY EXTRACT(MONTH FROM START_DATE),CAR_ID
ORDER BY MONTH, CAR_ID DESC