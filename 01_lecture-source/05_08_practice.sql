USE CHUNDB;

-- 1. 학생이름과 주소지를 표시하시오. 단, 출력 헤더는 "학생 이름", "주소지"로 하고, 정렬은 이름으로 오름차순 표시하도록 한다

select
	STUDENT_NAME AS 학생이름,
    STUDENT_ADDRESS AS 주소지
FROM
	tb_student
order by
	STUDENT_NAME ASC;
    
-- 2. 휴학중인 학생들의 이름과 주민번호를 나이가 적은 순서로 화면에 출력하시오.

select
	STUDENT_NAME AS 학생이름,
    STUDENT_SSN AS 주민번호
FROM 
	tb_student
where
	ABSENCE_YN = 'Y'
order by
	YEAR(NOW()) - IF(substring(STUDENT_SSN,1,2) between 50 AND 99, 1900 + substring(STUDENT_SSN,1,2), 2000 + substring(STUDENT_SSN,1,2));
    
use chundb;
    
-- 3. 주소지가 강원도나 경기도인 학생들 중 2020년대 학번을 가진 학생들의 이름과 학번, 주소를 이름의 오름차순으로 화면에 출력하시오. 단, 출력헤더에는 "학생이름","학번", "거주지 주소" 가 출력되도록 한다

select
	STUDENT_NO AS 학번,
    STUDENT_NAME AS 이름,
    STUDENT_ADDRESS AS 주소
from 
	tb_student s
where
	year(ENTRANCE_DATE) >= 2020 and
	STUDENT_ADDRESS LIKE '강원%' or STUDENT_ADDRESS LIKE '경기%'
order by
	이름;

-- 4. 현재 법학과 교수 중 가장 나이가 많은 사람부터 이름을 확인할 수 있는 SQL 문장을 작성하시오. (법학과의 '학과코드'는 학과 테이블(TB_DEPARTMENT)을 조회해서 찾아 내도록 하자)
-- PROFESSOR_NAME PROFESSOR_SSN
-- -------------------- --------------
-- 홍남수 540304-1112251
-- 김선희 551030-2159000
-- 임진숙 640125-1143548
-- 이미경 741016-2103506
SELECT
	PROFESSOR_NAME AS 교수이름
    ,PROFESSOR_SSN AS 주민번호
FROM
	TB_PROFESSOR
WHERE 
	DEPARTMENT_NO = ( SELECT 
						DEPARTMENT_NO
					 FROM
                     TB_DEPARTMENT
                     WHERE
                     DEPARTMENT_NAME = '법학과'
                     )
ORDER BY
	주민번호;
    
-- 2022 년 2학기에 C3118100 과목을 수강한 학생들의 학점을 조회하려고 한다. 학점이 높은 학생부터 표시하고, 학점이 같으면 학번이 낮은 학생부터 표시하는 구문을 작성해보시오.
-- STUDENT_NO POINT
-- ---------- -----
-- A331076	4.50
-- A213128	4.00
-- A219089	1.50
-- -----------------
-- 3 rows selected

select 
 student_no,
 POINT
from
TB_GRADE
WHERE
substring(TERM_NO,1,6) = 202202 AND CLASS_NO = 'C3118100' 
ORDER BY
 POINT DESC; 
 
-- 학생 번호, 학생 이름, 학과 이름을 학생 이름으로 오름차순 정렬하여 출력하는 SQL 문을 작성하시오
-- STUDENT_NO STUDENT_NAME         DEPARTMENT_NAME
-- ---------- -------------------- --------------------
-- A411001 감현제 치의학과
-- A131004 강동연 디자인학과
-- ...
-- ...
-- A411335 황형철 사회학과
-- A511332 황효종 컴퓨터공학과
-- ----------------------------------------------------
-- 588 rows selected

SELECT
	s.STUDENT_NO,
	s.STUDENT_NAME,
    d.DEPARTMENT_NAME
FROM
	TB_STUDENT s JOIN tb_department d on s.department_no = d.department_no
where
	s.department_no = d.department_no
order by
	s.student_name;
    
--  기술대학교의 과목 이름과 과목의 학과 이름을 출력하는 SQL 문장을 작성하시오
-- CLASS_NAME                     DEPARTMENT_NAME
-- ------------------------------ --------------------
-- 가족상담과 정신간호             간호학과
-- 가족상담실습                    간호학과
-- ...
-- ...
-- 자본시장회계연구                회계학과
-- 회계학연구방법론1               회계학과
-- ---------------------------------------------------
--  882 rows selected

select
	c.class_name
    ,d. department_name
from
	tb_class c join tb_department d using (DEPARTMENT_NO)
order by
	d.department_name;

-- 과목별 교수 이름을 찾으려고 한다. 과목 이름과 교수 이름을 출력하는 SQL 문을 작성하시오.
-- CLASS_NAME PROFESSOR_NAME
-- ------------------------------ --------------------
-- 19C미국소설 제상철
-- 19C미국소설 이지현
-- ...
-- ...
-- 환경생리학연구 유용석
-- 회계학연구방법론1 김봉건
-- --------------------------------------------------
-- 776 rows selected

select
	c.class_name
    ,p.professor_name
from
	tb_class c join tb_professor p using (DEPARTMENT_NO)
order by
	class_name;
    
-- 8 번의 결과 중 ‘인문사회’ 계열에 속한 과목의 교수 이름을 찾으려고 한다. 이에 해당하는 과목 이름과 교수 이름을 출력하는 SQL 문을 작성하시오.
-- CLASS_NAME PROFESSOR_NAME
-- ------------------------------ --------------------
-- 고전시가론특강 김선정
-- 국어어휘론특강 김선정
-- ...
-- ...
-- --------------------------------------------------
-- 197 rows selected

select
	c.class_name
    ,p.professor_name
from
	tb_class c join tb_professor p using (DEPARTMENT_NO),
    tb_class c join tb_department d using (DEPARTMENT_NO)
where
	d.CATEGORY = '인문사회';
                        
                        
	



