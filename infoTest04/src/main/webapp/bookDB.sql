create table TBL_BOOK_202301(
  BOOK_CODE    CHAR(3) NOT NULL PRIMARY KEY,
  BOOK_NAME    VARCHAR(30),
  AUTHOR       VARCHAR(15),
  DAY_FEE      INT,
  PUBLISH_DATE VARCHAR(8)
);
create table TBL_READER_202301(
  R_NO    CHAR(5) NOT NULL PRIMARY KEY,
  R_NAME  VARCHAR(15),
  PHONE   VARCHAR(11),
  ADDRESS VARCHAR(50),
  GRADE   VARCHAR(6)
);
create table TBL_RENT_202301(
  RENT_MONTH VARCHAR(6) NOT NULL,
  R_NO       CHAR(5) NOT NULL,
  BOOK_CODE  CHAR(3),
  RENT_DAYS  INT,
  FEE        INT,
  PRIMARY KEY (RENT_MONTH, R_NO)
);

insert into TBL_BOOK_202301 values('B01','자바 프로그래밍','김코딩',500,'20230101');
insert into TBL_BOOK_202301 values('B02','달빛 소설집','이소설',300,'20230102');
insert into TBL_BOOK_202301 values('B03','세계사 여행','박역사',400,'20230103');
insert into TBL_BOOK_202301 values('B04','요리의 정석','정요리',600,'20230104');

insert into TBL_READER_202301 values('10001','김철수','01012341111','부천시 원미구','일반');
insert into TBL_READER_202301 values('10002','이영희','01023452222','수원시 팔달구','일반');
insert into TBL_READER_202301 values('10003','박민수','01034563333','인천시 남동구','일반');
insert into TBL_READER_202301 values('20001','최지우','01045674444','광주시 북구','우수');
insert into TBL_READER_202301 values('20002','정수빈','01056785555','울산시 남구','우수');

insert into TBL_RENT_202301 values('202305','10001','B01',7,3500);
insert into TBL_RENT_202301 values('202305','10002','B02',14,4200);
insert into TBL_RENT_202301 values('202305','10003','B03',7,2800);
insert into TBL_RENT_202301 values('202305','20001','B01',14,4900);
insert into TBL_RENT_202301 values('202305','20002','B04',7,2940);
