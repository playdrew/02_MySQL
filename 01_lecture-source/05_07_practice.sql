
-- 1. 영어영문학과(학과코드 002) 학생들의 학번과 이름, 입학 년도를 입학 년도가 빠른순으로 표시하는 SQL 문장을 작성하시오.

select
	STUDENT_NO as 학번
	,STUDENT_NAME as 이름
    ,ENTRANCE_DATE as 입학년도
from
	tb_student
order by
	ENTRANCE_DATE asc;
    
-- 2. 춘 기술대학교의 교수 중 이름이 세 글자가 아닌 교수가 두 명 있다고 한다. 그 교수의 이름과 주민번호를 화면에 출력하는 SQL 문장을 작성해 보자. 

select
	 PROFESSOR_NAME 교수이름
    ,PROFESSOR_SSN 주민번호
from
	tb_professor
where
    CHAR_LENGTH(PROFESSOR_NAME) <> 3;
    
-- CHAR_LENGTH(STRING)길이를 반환하는 함수
-- 3. 춘 기술대학교의 남자 교수들의 이름과 나이를 출력하는 SQL 문장을 작성하시오. 단 이때 나이가 적은 사람에서 많은 사람 순서로 화면에 출력되도록 만드시오. 
-- (단, 교수 중 2000 년 이후 출생자는 없으며 출력 헤더는 "교수이름", "나이"로 한다. 나이는 ‘만’으로 계산한다.)

select
	PROFESSOR_NAME 교수이름
    ,PROFESSOR_SSN 주민번호
    ,CURDATE()  현재날짜
from
	tb_professor
where
	concat(19,substring());