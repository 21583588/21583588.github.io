DROP DATABASE IF EXISTS u21583588_upbank;
CREATE DATABASE u21583588_upbank;
USE u21583588_upbank;

DROP TABLE IF EXISTS CLIENT;
CREATE TABLE CLIENT(
    u_Num CHAR(9) NOT NULL UNIQUE,
    fName VARCHAR(20) NOT NULL,
    mName VARCHAR(20),
    lName VARCHAR(20) NOT NULL,
    email VARCHAR(50),
    SMS VARCHAR(10),
    tel_num VARCHAR(10),
    streetName VARCHAR(15),
    streetNo VARCHAR(5),
    city VARCHAR(15),
    suburb VARCHAR(15),
    ACC_No CHAR(10) NOT NULL UNIQUE,
    PRIMARY KEY (u_Num)
);

INSERT INTO CLIENT VALUES
('u21583588','Andrew','Ben','Park','ABP21@gmail.com','0822344456','0112223425','ViewWay','22','Affies','Burg','444444'),
('u21583556','Boyo','','Roberts','BR55@gmail.com','0856781256','0114448905','RontRoad','35','Lofi','Hifi','556677'),
('u20567699','Nate','Peter','Kandz','NPK44@gmail.com','0709876328','','PointRoad','78','LangeBaan','Trow','569033'),
('u19856554','Piet','Boer','Pompies','PBP111@gmail.com','0604446969','','ViewWay','85','Affies','Burg','222222'),
('u21444420','Christopher','Robins','Peters','CRP45@gmail.com','0723441234','0114445697','GrassLane','1','Crystal','Rocks','709799'),
('u16555890','Loki','Hoki','Poki','LHP1@gmail.com','0824556789','','SesameStreet','69','HiLoBurg','Bunoria','123456'),
('u17345678','Ruth','','deFin','RF@gmail.com','0812346790','','RockyRoad','22','Root','Tinydene','578578'),
('u19375574','Rodney','','Pringles','RP@gmail.com','0643335678','','RockyRoad','44','Root','Tinydene','444333'),
('u13455888','Butter','Bean','Benz','B3x@gmail.com','0824569999','0111111111','LibRoad','34','Libdene','Libre','222333'),
('u15456123','Tommy','','Turtle','TT@gmail.com','0803804452','','SesameStreet','79','HiLoBurg','Bunoria','567444');



DROP TABLE IF EXISTS STUDENT;
CREATE TABLE STUDENT(
    u_Num CHAR(9) NOT NULL UNIQUE,
    degree CHAR(5) NOT NULL,
    PRIMARY KEY (u_Num)
);

INSERT INTO STUDENT VALUES
('u21583588','Bsc'),
('u21583556','BENG'),
('u20567699','BCOM'),
('u19856554','Bsc'),
('u21444420','BENG');

ALTER TABLE STUDENT
ADD FOREIGN KEY (u_Num) REFERENCES CLIENT(u_Num);

DROP TABLE IF EXISTS MEMBER;
CREATE TABLE MEMBER(
    u_Num CHAR(9) NOT NULL UNIQUE,
    Mem_level VARCHAR(6) NOT NULL,
    PRIMARY KEY (u_Num)
);

INSERT INTO MEMBER VALUES
('u19375574','High'),
('u13455888','Medium'),
('u15456123','Medium');

ALTER TABLE MEMBER
ADD FOREIGN KEY (u_Num) REFERENCES CLIENT(u_Num);


DROP TABLE IF EXISTS STAFF;
CREATE TABLE STAFF(
    u_Num CHAR(9) NOT NULL UNIQUE,
    Job VARCHAR(30) NOT NULL,
    PRIMARY KEY (u_Num)
);

INSERT INTO STAFF VALUES
('u16555890','Teaching Assistant'),
('u17345678','Teaching Assistant');

ALTER TABLE STAFF
ADD FOREIGN KEY (u_Num) REFERENCES CLIENT(u_Num);


DROP TABLE IF EXISTS ACCOUNT;
CREATE TABLE ACCOUNT(
    ACC_No CHAR(10) NOT NULL UNIQUE,
    ownerBranch VARCHAR(15),
    balance DECIMAL(10,2),
    u_Num CHAR(9) NOT NULL UNIQUE,
    branch_code VARCHAR(5) NOT NULL,
    PRIMARY KEY (ACC_No)
);

INSERT INTO ACCOUNT VALUES
('444444','Randburg',125000.00,'u21583588','RAND'),
('556677','Randburg',22000.50,'u21583556','RAND'),
('569033','Hatfield',25000.00,'u20567699','HAT'),
('222222','Groenkloof',10000.00,'u19856554','GROEN'),
('709799','Randburg',2000.56,'u21444420','RAND'),
('123456','Groenkloof',150.00,'u16555890','GROEN'),
('578578','Hatfield',57000.75,'u17345678','HAT'),
('444333','Hatfield',420.69,'u19375574','HAT'),
('222333','Hatfield',5000.00,'u13455888','HAT'),
('567444','Groenkloof',2300.99,'u15456123','GROEN');

ALTER TABLE CLIENT
ADD FOREIGN KEY (ACC_No) REFERENCES ACCOUNT(ACC_No);

ALTER TABLE ACCOUNT
ADD FOREIGN KEY (u_Num) REFERENCES CLIENT(u_Num),
ADD FOREIGN KEY (branch_code) REFERENCES BRANCH(branch_code);




DROP TABLE IF EXISTS SAVINGS;
CREATE TABLE SAVINGS(
    ACC_No CHAR(10) NOT NULL UNIQUE,
    interest_rate DECIMAL(4,2),
    PRIMARY KEY (ACC_No)
);

INSERT INTO SAVINGS VALUES
('444444',20.22),
('556677',5.00),
('569033',8.79);

ALTER TABLE SAVINGS
ADD FOREIGN KEY (ACC_No) REFERENCES ACCOUNT(ACC_No);

DROP TABLE IF EXISTS CHEQUE;
CREATE TABLE CHEQUE(
    ACC_No CHAR(10) NOT NULL UNIQUE,
    paid DECIMAL(10,2),
    PRIMARY KEY (ACC_No)
);

INSERT INTO CHEQUE VALUES
('222222',4400.00),
('709799',125.15),
('123456',23.99);

ALTER TABLE CHEQUE
ADD FOREIGN KEY (ACC_No) REFERENCES ACCOUNT(ACC_No);

DROP TABLE IF EXISTS DEPOSIT;
CREATE TABLE DEPOSIT(
    ACC_No CHAR(10) NOT NULL UNIQUE,
    notice_period INT,
    PRIMARY KEY (ACC_No)
);

INSERT INTO DEPOSIT VALUES
('578578',32),
('444333',32),
('222333',32),
('567444',32);

ALTER TABLE DEPOSIT
ADD FOREIGN KEY (ACC_No) REFERENCES ACCOUNT(ACC_No);

DROP TABLE IF EXISTS BRANCH;
CREATE TABLE BRANCH(
    branch_code VARCHAR(5) NOT NULL,
    operating_hours INT,
    street_no VARCHAR(4),
    street_name VARCHAR(15),
    city VARCHAR(15),
    suburb VARCHAR(15),
    PRIMARY KEY (branch_code)
);

INSERT INTO BRANCH VALUES
('RAND',10,'22','Aalwyn Street','Randburg','Randpark'),
('GROEN',12,'88','Eeufees Road','Pretoria','Groenkloof'),
('HAT',12,'76','Acacia Street','Pretoria','Hatfield'),
('HSC',8,'42','Markle Road','Hogan','HilSchoor'),
('SABC',7,'2','BC Lane','Reban','Sabcoast'),
('RAC',12,'47','Lala Way','Ramfont','Racinda'),
('BRC',8,'76','Corner Lane','Toent','Brochill');


DROP TABLE IF EXISTS CIT;
CREATE TABLE CIT(
    company_ID VARCHAR(5) NOT NULL,
    companyName VARCHAR(20) NOT NULL,
    startdate DATE,
    enddate DATE,
    branch_code VARCHAR(5) NOT NULL,
    PRIMARY KEY (company_ID)
);

INSERT INTO CIT VALUES
('CIT1','Refill Merchants','2021-03-03','2025-03-04','RAND'),
('CIT2','Filler Thrilla','2019-06-04','2023-06-05','RAND'),
('CIT3','Money Restore','2020-04-07','2024-02-04','GROEN'),
('CIT4','Dolla Packers','2020-09-09','2022-09-08','HAT'),
('CIT5','Moola Men','2021-01-01','2027-03-04','HSC'),
('CIT6','FullUp Trup','2017-03-03','2022-07-03','RAC'),
('CIT7','Randburg Rands','2022-01-01','2026-05-09','RAND');

ALTER TABLE CIT
ADD FOREIGN KEY (branch_code) REFERENCES BRANCH(branch_code);

DROP TABLE IF EXISTS ATM;
CREATE TABLE ATM(
    ATM_ID VARCHAR(10) NOT NULL,
    cash DECIMAL(10,2),
    fill_day DATE,
    fill_company VARCHAR(20),
    branch_code VARCHAR(5) NOT NULL,
    PRIMARY KEY (ATM_ID)
);

INSERT INTO ATM VALUES
('ATM111',100000.61,'2022-03-03','Refill Merchants','RAND'),
('ATM112',1000000.55,'2022-04-09','Filler Thrilla','RAND'),
('ATM113',27900.00,'2022-01-01','Money Restore','GROEN'),
('ATM114',47689.10,'2022-03-03','Dolla Packers','HAT'),
('ATM115',2000000.68,'2022-04-09','Moola Men','HSC'),
('ATM116',2098.22,'2022-01-01','FullUp Trup','RAC'),
('ATM117',456790.74,'2022-02-07','Randburg Rands','RAND');

ALTER TABLE ATM
ADD FOREIGN KEY (branch_code) REFERENCES BRANCH(branch_code);


DROP TABLE IF EXISTS FILLS;
CREATE TABLE FILLS(
    company_ID VARCHAR(5) NOT NULL,
    ATM_ID VARCHAR(10) NOT NULL,
    PRIMARY KEY (company_ID, ATM_ID)
);

INSERT INTO FILLS VALUES
('CIT1','ATM111'),
('CIT2','ATM112'),
('CIT3','ATM113'),
('CIT4','ATM114'),
('CIT5','ATM115'),
('CIT6','ATM116'),
('CIT7','ATM117');

ALTER TABLE FILLS
ADD FOREIGN KEY (company_ID) REFERENCES CIT(company_ID),
ADD FOREIGN KEY (ATM_ID) REFERENCES ATM(ATM_ID);


