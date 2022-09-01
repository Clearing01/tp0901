SELECT * FROM USER_TABLES;
SELECT * FROM NOVEL;
SELECT * FROM OPINION;
SELECT * FROM MEMBER;
SELECT * FROM REPLY;
SELECT * FROM REPLY_RE;
SELECT * FROM LLIKE;
SELECT * FROM BOARD;

DROP TABLE MEMBER;
DROP TABLE BOARD;
DROP TABLE REPLY;
DROP TABLE REPLY_RE;
DROP TABLE NOVEL;
DROP TABLE LLIKE;
DROP TABLE OPINION;

SELECT * FROM (SELECT A.*, ROWNUM AS RNUM FROM(SELECT * FROM BOARD B JOIN MEMBER M ON B.MID=M.MID  ORDER BY BID DESC) A WHERE ROWNUM < = 20)WHERE RNUM  > = 1

INSERT INTO MEMBER values('lisa','1234','정아림','림','010-5369-4080','wjddkfla20@naver.com','member');
INSERT INTO MEMBER values('admin','12345','어드민','민','010-5369-4080','wjddkfla20@naver.com','admin');
INSERT INTO MEMBER values('dongdong','12345','임명환','환','010-5369-4080','wjddkfla20@naver.com','mvp');
SELECT * FROM (SELECT A.*, ROWNUM AS RNUM FROM(SELECT * FROM NOVEL WHERE NGENRE LIKE '%'||'판타지'||'%'  ORDER BY NID ASC) A WHERE ROWNUM < =100)WHERE RNUM  > = 1;

CREATE TABLE MEMBER(
   MID VARCHAR(20) PRIMARY KEY,
   MPW VARCHAR(100) NOT NULL,
   MNAME VARCHAR(20) NOT NULL,
   NICKNAME VARCHAR(20) NOT NULL,
   MPHONE VARCHAR(20) NOT NULL,
   MEMAIL VARCHAR(50) NOT NULL,
   ROLE VARCHAR(20) NOT NULL
);


CREATE TABLE OPINION(
   OID INT PRIMARY KEY,
   NID INT NOT NULL,
   OCONTENT VARCHAR(500) NOT NULL,
   ODATE  DATE DEFAULT SYSDATE,
   MID VARCHAR(20) NOT NULL,
   OSTAR INT NOT NULL
);

SELECT * FROM REPLY LEFT OUTER JOIN BOARD ON REPLY.BID=BOARD.BID WHERE REPLY.BID=1005 ORDER BY RID DESC;

CREATE TABLE BOARD(
   BID INT PRIMARY KEY,
   BTITLE VARCHAR(50) NOT NULL,
   BCONTENT VARCHAR(4000) NOT NULL,
   BDATE VARCHAR(100) DEFAULT SYSDATE,
   MID VARCHAR(20) NOT NULL
);


CREATE TABLE REPLY(
   RID INT PRIMARY KEY,
   RCONTENT VARCHAR(1000) NOT NULL,
   RDATE DATE DEFAULT SYSDATE,
   MID VARCHAR(20) NOT NULL,
   BID INT NOT NULL,
   CONSTRAINT BOARD_REPLY FOREIGN KEY (BID) REFERENCES BOARD(BID) ON DELETE CASCADE
);


CREATE TABLE REPLY_RE(
   RRID INT PRIMARY KEY,
   RRCONTENT VARCHAR(1000) NOT NULL,
   RRDATE  DATE DEFAULT SYSDATE,
   MID VARCHAR(20) NOT NULL,
   BID INT NOT NULL,
   RID INT NOT NULL,
   CONSTRAINT REPLY_REPLY_RE FOREIGN KEY (RID) REFERENCES REPLY(RID) ON DELETE CASCADE
);


CREATE TABLE NOVEL(
   NID INT PRIMARY KEY,
   NTITLE VARCHAR(70) NOT NULL,
   NCONTENT VARCHAR(1000) NOT NULL,
   NIMG VARCHAR(2000) NOT NULL,
   NGENRE VARCHAR(60) NOT NULL,
   NWRITER VARCHAR(30) NOT NULL,
   OID INT
);


CREATE TABLE LLIKE(
   LID INT PRIMARY KEY,
   MID VARCHAR(20) NOT NULL,
   BID INT NOT NULL,
   LSTATUS INT DEFAULT 0,
   NLSTATUS INT DEFAULT 0,
   REPORT INT DEFAULT 0,
   CONSTRAINT BOARD_LLIKE FOREIGN KEY (BID) REFERENCES BOARD(BID) ON DELETE CASCADE
);

SELECT AVG(OSTAR) AS AVG FROM OPINION LEFT OUTER JOIN NOVEL ON OPINION.OID=NOVEL.OID WHERE OPINION.NID='1';


SELECT * FROM (SELECT * FROM BOARD LEFT OUTER JOIN MEMBER ON BOARD.MID=MEMBER.NICKNAME ORDER BY BID DESC) WHERE ROWNUM < = ?
SELECT * FROM (SELECT * FROM NOVEL WHERE NTITLE LIKE '%'||?||'%' AND NGENRE LIKE '%'||?||'%' AND NWRITER LIKE '%'||?||'%' ORDER BY NID DESC) WHERE ROWNUM < = ?

