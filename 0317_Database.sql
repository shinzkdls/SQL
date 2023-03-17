SELECT ENAME --ename
	  ,SAL*3 --quartely
	  ,COMM  --commition : why? when?
FROM EMP;

-- 실습 3-1
ALTER USER SCOTT
IDENTIFIED BY tiger
ACCOUNT UNLOCK;

-- 실습 3-2
CONN scott/tiger;

-- 실습 3-3
DESC EMP;

-- 실습 3-4
EXIT;

-- 실습 3-5
SQLPLUS scott/tiger;

SELECT ENAME
	  ,B.DEPTNO 
FROM EMP A
    ,DEPT B
;

SELECT 100+5, 10-3, 30*2, 10/3
FROM DUAL
;

SELECT dbms_random.value() * 100
FROM DUAL
;

SELECT *
FROM NLS_DATABASE_PARAMETERS
;