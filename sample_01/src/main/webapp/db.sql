CREATE TABLE tbl_bakery (
    pk_bakery VARCHAR(5) NOT NULL PRIMARY KEY,
    name      VARCHAR(20) NOT NULL,
    address   VARCHAR(255),
    etc       VARCHAR(255)
);

INSERT INTO tbl_bakery
    (pk_bakery, name, address, etc)
VALUES
    ('A0001', 'Á¤½É´ç', '´ëÀü', 'Á¤¼ºÀ» ´ÙÇÑ ¸¶À½À¸·Î »§À» ¸¸µå´Â »§Áý'),
    ('A0002', '¼ÂÁê·ç', 'Ãµ¾È', 'Àü¼³ÀÇ ·¹Àüµå ¿øÁ¶ »§Áý'),
    ('A0003', '¿À¼þ»§Áý', '´ë±¸', '°í±¸¸¶ ¸ÀÀ» ±ØÇÑÀ¸·Î ¿Ã¸° »§Áý'),
    ('A0004', 'ÄÚ³¢¸®Á¦°ú', '¾Èµ¿', 'ÄÚ³¢¸® ¾ø´Â ÄÚ³¢¸® »§Áý');
    
CREATE TABLE tbl_bread (
    pk_bread VARCHAR(5) NOT NULL PRIMARY KEY,
    name     VARCHAR(20) NOT NULL,
    price    VARCHAR(10) NOT NULL
);

INSERT INTO tbl_bread (pk_bread, name, price)
VALUES
    ('B0001', '´ëº¸¸§»§', '1000'),
    ('B0002', 'ÀÚ¸®»§', '1500'),
    ('B0003', 'ÄÚ³¢¸®»§', '2000'),
    ('B0004', 'Âý½Òµµ³ÊÃ÷', '2500'),
    ('B0005', '°í±¸¸¶»§', '3000'),
    ('B0006', 'Ä¡Áî»§', '3500'),
    ('B0007', 'ÇÜ»§', '4000');
    

CREATE TABLE tbl_sale (
    pk_sale    VARCHAR(5) NOT NULL PRIMARY KEY,
    deal_date  DATE NOT NULL,
    deal_count INT NOT NULL,
    fk_bakery  VARCHAR(5) NOT NULL,
    fk_bread   VARCHAR(5) NOT NULL,

    -- FOREIGN KEY (fk_bakery)
    --     REFERENCES tbl_bakery(pk_bakery),

    -- FOREIGN KEY (fk_bread)
    --     REFERENCES tb_bread(pk_bread)
);

CREATE TABLE tbl_sale (
    pk_sale    VARCHAR(5) NOT NULL PRIMARY KEY,
    deal_date  DATE NOT NULL,
    deal_count INT NOT NULL,
    fk_bakery  VARCHAR(5) NOT NULL,
    fk_bread   VARCHAR(5) NOT NULL
);

INSERT INTO tbl_sale
    (pk_sale, deal_date, deal_count, fk_bakery, fk_bread)
VALUES
    ('00001', '2025-04-01', 10, 'A0001', 'B0001'),
    ('00002', '2025-04-02', 15, 'A0001', 'B0004'),
    ('00003', '2025-04-03', 10, 'A0001', 'B0005'),
    ('00004', '2025-04-04', 15, 'A0001', 'B0003'),
    ('00005', '2025-04-05', 10, 'A0002', 'B0002'),
    ('00006', '2025-04-06', 15, 'A0002', 'B0004'),
    ('00007', '2025-04-07', 10, 'A0002', 'B0003'),
    ('00008', '2025-04-08', 15, 'A0002', 'B0004'),
    ('00009', '2025-04-09', 10, 'A0003', 'B0002'),
    ('00010', '2025-04-10', 15, 'A0003', 'B0004'),
    ('00011', '2025-04-11', 10, 'A0003', 'B0002'),
    ('00012', '2025-04-12', 15, 'A0004', 'B0001'),
    ('00013', '2025-04-13', 15, 'A0004', 'B0002'),
    ('00014', '2025-04-14', 10, 'A0004', 'B0003'),
    ('00015', '2025-04-15', 15, 'A0004', 'B0005');