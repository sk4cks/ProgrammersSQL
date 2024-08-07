-- 코드를 입력하세요
SELECT A.USER_ID, A.NICKNAME, SUM(PRICE) AS TOTAL_SALES 
FROM USED_GOODS_USER A
INNER JOIN USED_GOODS_BOARD B
ON ( B.WRITER_ID = A.USER_ID )
WHERE STATUS = 'DONE'
GROUP BY A.USER_ID,A.NICKNAME
HAVING SUM(PRICE) >= 700000
ORDER BY TOTAL_SALES