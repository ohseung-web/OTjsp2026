
select u.pk_usage, u.usage_date, r.name, r.price, c.age, c.name, c.free_pass from tbl_usage u 
inner join tbl_customer c on u.fk_customer=c.pk_customer
inner join tbl_ride r on r.pk_ride=u.fk_ride
order by u.pk_usage asc;

select u.usage_date, c.pk_customer, c.age, c.free_pass, r.price from tbl_usage u 
inner join tbl_customer c on u.fk_customer=c.pk_customer
inner join tbl_ride r on r.pk_ride=u.fk_ride
group by u.usage_date;


String sql = "select u.usage_date, "
 + " sum(case when c.free_pass = 'Y' then 0 "
 + "          when c.age <= 14 then r.price * 0.5 "
 + "          when c.age <= 19 then r.price * 0.8 "
 + "          else r.price end) as totalPrice "
 + " from tbl_usage u "
 + " inner join tbl_customer c on u.fk_customer = c.pk_customer "
 + " inner join tbl_ride r on u.fk_ride = r.pk_ride "
 + " group by u.usage_date "
 + " order by u.usage_date";



select c.pk_customer, c.name, c.age, count(*) as count, c.free_pass, sum(r.price) as totalPrice from tbl_usage u 
inner join tbl_customer c on u.fk_customer=c.pk_customer
inner join tbl_ride r on r.pk_ride=u.fk_ride
group by c.pk_customer;

select r.pk_ride, r.name, r.grade, sum(r.price) as totalPrice from tbl_usage u 
inner join tbl_customer c on u.fk_customer=c.pk_customer
inner join tbl_ride r on r.pk_ride=u.fk_ride
group by r.pk_ride;


CREATE TABLE tbl_customer (
  pk_customer INT          NOT NULL primary key,
  name        VARCHAR(100) NOT NULL,
  age         INT          NOT NULL,
  free_pass   CHAR(1)      NOT NULL DEFAULT 'N' CHECK (free_pass IN ('Y','N'))
);

INSERT INTO tbl_customer VALUES
  (1, '강명희', 5, 'N'),
  (2, '이철수', 12, 'N'),
  (3, '흥부', 15, 'N'),
  (4, '놀부', 17, 'Y'),
  (5, '홍길동', 26, 'Y'),
  (6, '장영실', 30, 'N');

CREATE TABLE tbl_ride (
  pk_ride INT           NOT NULL primary key,
  name    VARCHAR(100)  NOT NULL,
  price   DECIMAL(20,0) NOT NULL,
  grade   CHAR(10)      NOT NULL DEFAULT '전체' CHECK (grade IN
    ('어린이','청소년','성인','전체'))
);

INSERT INTO tbl_ride VALUES
  (1, '회전목마', 2000, '전체'),
  (2, '롤러코스터', 5000, '청소년'),
  (3, '유령의집', 3000, '성인'),
  (4, '관람차', 1500, '전체'),
  (5, '범퍼카', 2500, '청소년'),
  (6, '바이킹', 6000, '어린이');

CREATE TABLE tbl_usage (
  pk_usage    INT  NOT NULL primary key,
  usage_date  DATE NOT NULL DEFAULT (CURRENT_DATE),
  fk_customer INT  NOT NULL,
  fk_ride     INT  NOT NULL,
  FOREIGN KEY (fk_customer)
    REFERENCES tbl_customer (pk_customer),
  FOREIGN KEY (fk_ride)
    REFERENCES tbl_ride (pk_ride)
);  

INSERT INTO tbl_usage VALUES
  (1,'2025-05-01',1,1), (2,'2025-05-01',2,2), (3,'2025-05-01',1,3),
  (4,'2025-05-01',3,1), (5,'2025-05-01',5,4), (6,'2025-05-02',1,2),
  (7,'2025-05-02',4,5), (8,'2025-05-02',2,1), (9,'2025-05-02',6,3),
  (10,'2025-05-02',3,2), (11,'2025-05-03',4,1), (12,'2025-05-03',1,5),
  (13,'2025-05-03',2,3), (14,'2025-05-03',5,2), (15,'2025-05-03',6,4),
  (16,'2025-05-04',3,4), (17,'2025-05-04',4,2), (18,'2025-05-04',1,1),
  (19,'2025-05-04',6,5), (20,'2025-05-04',5,1), (21,'2025-05-05',2,4),
  (22,'2025-05-05',4,3), (23,'2025-05-05',3,5), (24,'2025-05-05',6,1),
  (25,'2025-05-05',5,3), (26,'2025-05-06',2,5), (27,'2025-05-06',4,4),
  (28,'2025-05-06',6,2), (29,'2025-05-06',3,1), (30,'2025-05-06',1,4);

