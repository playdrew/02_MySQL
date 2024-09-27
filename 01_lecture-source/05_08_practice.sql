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
order by
	SUBSTRING(STUDENT_SSN,1,2) ASC;
    
-- 3. 주소지가 강원도나 경기도인 학생들 중 2020년대 학번을 가진 학생들의 이름과 학번, 주소를 이름의 오름차순으로 화면에 출력하시오. 단, 출력헤더에는 "학생이름","학번", "거주지 주소" 가 출력되도록 한다

select
	STUDENT_NO AS 학번,
    STUDENT_NAME AS 이름,
    STUDENT_ADDRESS AS 주소
from 
	tb_student s
where
	STUDENT_ADDRESS LIKE '%강원도%' OR STUDENT_ADDRESS LIKE '%경기도%';