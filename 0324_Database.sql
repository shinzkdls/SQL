SELECT *
FROM(SELECT DEPTNO
	      ,MAX(DECODE(JOB,'CLECK', SAL)) AS  CLERK
	      ,MAX(DECODE(JOB,'ANALYST', SAL)) AS  ANALYST
	      ,MAX(DECODE(JOB,'SALESMAN', SAL)) AS  SALESMAN
	      ,MAX(DECODE(JOB,'MANAGER', SAL)) AS  MANAGER
	      ,MAX(DECODE(JOB,'PRESIDENT', SAL)) AS  PRESIDENT
	FROM EMP
	GROUP BY DEPTNO 
	ORDER BY DEPTNO)
UNPIVOT(SAL FOR JOB IN(CLERK, SALESMAN, PRESIDENT, MANAGER, ANALYST))
ORDER BY DEPTNO , JOB;
;

SELECT * 
FROM EMPLOYEES E
    ,DEPARTMENTS D
    ,JOBS J
    ,LOCATIONS L
    ,COUNTRIES C
    ,REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID 
AND D.LOCATION_ID = L.LOCATION_ID 
AND L.COUNTRY_ID = C.COUNTRY_ID 
AND C.REGION_ID  = R.REGION_ID 
AND J.JOB_ID = E.JOB_ID 
;


CREATE VIEW VW_EMP_DETAILS AS
SELECT E.EMPLOYEE_ID 
      ,E.JOB_ID
      ,E.DEPARTMENT_ID 
      ,D.LOCATION_ID 
      ,L.COUNTRY_ID 
      ,E.FIRST_NAME 
      ,E.LAST_NAME 
      ,E.SALARY 
      ,E.COMMISSION_PCT 
      ,D.DEPARTMENT_NAME 
      ,J.JOB_TITLE 
      ,L.CITY 
      ,L.STATE_PROVINCE 
      ,C.COUNTRY_NAME 
      ,R.REGION_NAME 
FROM EMPLOYEES E
    ,DEPARTMENTS D
    ,JOBS J
    ,LOCATIONS L
    ,COUNTRIES C
    ,REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID 
AND D.LOCATION_ID = L.LOCATION_ID 
AND L.COUNTRY_ID = C.COUNTRY_ID 
AND C.REGION_ID  = R.REGION_ID 
AND J.JOB_ID = E.JOB_ID 
;

SELECT *
FROM EMP e 
JOIN DEPT d 
ON e.DEPTNO = d.DEPTNO 
;

SELECT E.EMPNO 
      ,E.ENAME 
      ,D.DEPTNO 
      ,D.LOC 
FROM EMP E
JOIN DEPT D 
ON E.DEPTNO = D.DEPTNO 
;


SELECT *
FROM EMP E
JOIN SALGRADE S 
ON E.SAL BETWEEN S.LOSAL AND S.HISAL 
;


SELECT *
FROM EMP A
JOIN EMP B
ON A.MGR = B.EMPNO 
;

--RIGHT JOIN
SELECT E1.EMPNO 
      ,E1.ENAME 
      ,E1.MGR
      ,E2.EMPNO AS MGR_EMPNO
      ,E2.ENAME AS MGR_ENAME
FROM EMP E1
RIGHT JOIN EMP E2  -- E2가 기준테이블임
ON E1.MGR = E2.EMPNO 
;



SELECT *
FROM EMP E
RIGHT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO 
LEFT JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL 
LEFT JOIN EMP E2
ON E.MGR = E2.EMPNO 
;


/*
 * 서브쿼리 결과: 단일 값 출력, 다중행(하나의 컬럼에 행 배열)
 *            다중열(두 개 이상의 컬럼별 행 배열)
 */

SELECT *
FROM EMP
WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL)
						FROM EMP
						GROUP BY DEPTNO)
;

DROP TABLE EMP_NEW;

CREATE TABLE EMP_NEW(
	EMPNO		NUMBER(4),
	ENAME 		VARCHAR2(10),
	JOB 		VARCHAR2(9),
	MGR 		NUMBER(4),
	HIREDATE 	DATE,
	SAL 		NUMBER(7,2),
	COMM 		NUMBER(7,2),
	DEPTNO 		NUMBER(2)
);


SELECT *
FROM EMP_NEW
;

ALTER TABLE EMP_NEW
ADD TEL VARCHAR2(20)
;

COMMIT;

ALTER TABLE EMP_NEW
MODIFY EMPNO NUMBER(5)
;

ALTER TABLE EMP_NEW
DROP COLUMN TEL
;

ALTER TABLE EMP_NEW 
RENAME TO EMP_NEW_RENAMED
;

/*
 * SEQUENCE 생성
 * 
 * 필요한 일련번호를 만들어 사용하거나, 일련번호를 PK로 사용하는 경우에 사용
 */
CREATE SEQUENCE SEQ_DEPT
	INCREMENT BY 1
	START  WITH 1
	MAXVALUE 9999999999
	MINVALUE 1
	NOCYCLE
	NOCACHE
;

SELECT *
FROM DEPT_TEMP2 dt 
;

INSERT INTO DEPT_TEMP2 
VALUES (SEQ_DEPT.NEXTVAL, 'DB', 'BUSAN')
;




