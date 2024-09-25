-- DML (Data Manipulation Language)
-- Manipulation : 조작
-- 테이블의 값을 삽입, 수정, 삭제하는 SQL 의 한 부분을 의미한다.
-- 삽입 수정 수정의 경우에는 행의 늘린다던가 값을 변경하던가

-- 삽입(INSERT)
-- 새로운 행을 추가하는 구문이다.
-- 테이블의 행(세로)의 수가 증가한다.
-- into 삽입을 어디(어느 테이블)에다 할지 지정

-- tbl_menu 테이블의 값을 insert
-- values() 값을 집어넣는 것
-- 1 row(s) affected

insert into tbl_menu values (null,'바나나해장국',8500,4,'Y');

-- not null 제약조건이 붙은 컬럼은 반드시 값을 넣어주어야 한다
-- Column 'menu_price' 라는 값은 cannot be null 입니다.
-- insert into tbl_menu values (null,'바나나해장국',null,4,'Y'); 


-- tbl_menu 가 어떤 식으로 되어있는지 설명
-- key PRI(PK Primary key) 한 행을 식별하기 위한 열쇠
-- Extra : auto_increment 자동증가 > 우리가 값을 집어넣지 않더라도 마지막행에서 번호를 집어넣어준다는 것입니다.
describe tbl_menu;

-- null 을 집어넣는데 알아서 22번으로 처리되었습니다. 
-- 자동으로 번호를 매겨주고 있습니다.
-- menu 코드에 제약조건이 걸려있는 것입니다.
-- dml 동작 확인용 select 구문
select * from tbl_menu; 

-- 컬럼을 명시하게 된다면, insert 시 데이터 입력 순서를 바꿔도 상관없다
-- 아까는 반드시 순서를 일치시켜주었어야했는데
-- 이렇게 만들면 순서를 바꿀 수 있어여
insert into tbl_menu 
(orderable_status, menu_name, menu_code, menu_price, category_code)
values
('Y', '파인애플탕', null, 5500, 4);

-- menu_code
-- insert 시 auto_increment 가 있는 컬럼이나, null 값을 허용하는 컬럼은
-- 데이터를 집어넣지 않아도 된다.
insert into tbl_menu 
(orderable_status, menu_name, menu_price, category_code)
values
('Y', '초콜렛밥', 1000, 4);

insert into
	   tbl_menu
	   values
	   (null,'참치맛아이스크림',1600,12,	'Y'),
       (null,'해장국맛아이스크림',1900,12,'Y'),
       (null,'멸치맛아이스크림',1200,12,'Y');
       
-- UPDATE
-- 테이블에 기록된 컬럼들의 값을 수정하는 구문이다
-- 테이블의 행 갯수 에는 영향이 없다 

select
	menu_code,
    category_code
from
	tbl_menu
where 
	menu_name = '파인애플탕';

-- 파인애플탕을 update 해요
update tbl_menu
set
	category_code = 7
where
	menu_code = 23;
    
-- delete나 update는 조건을 설정하는 것이에요 조건안정하면 다 바꿔버릴지도
    
