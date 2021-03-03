--create user odga identified by java;
--grant connect, resource to odga;
--conn odga/java

--�������ǻ���
ALTER TABLE S_PLANER DROP CONSTRAINT FK_TOURITEMS_TO_S_PLANER;
--���̺� ����
DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP TABLE TOURITEMS CASCADE CONSTRAINTS;
DROP TABLE PLANER CASCADE CONSTRAINTS;
DROP TABLE S_PLANER CASCADE CONSTRAINTS;
DROP TABLE FILE_P CASCADE CONSTRAINTS;
DROP TABLE ADMIN CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE REPLY CASCADE CONSTRAINTS;
DROP TABLE AREA_T CASCADE CONSTRAINTS;
DROP TABLE SIGUNGU_T CASCADE CONSTRAINTS;
DROP TABLE CAT1_T CASCADE CONSTRAINTS;
DROP TABLE CAT2_T CASCADE CONSTRAINTS;
DROP TABLE CAT3_T CASCADE CONSTRAINTS;
DROP TABLE CONTENTTYPE CASCADE CONSTRAINTS;

--������ ����
DROP SEQUENCE BOARD_ID;
DROP SEQUENCE PLANER_ID;
DROP SEQUENCE S_PLANER_ID;
DROP SEQUENCE FILE_P_ID;
DROP SEQUENCE ADMIN_ID;
DROP SEQUENCE MEMBER_ID;
DROP SEQUENCE REPLY_ID;


PURGE RECYCLEBIN;

--���̺� ����/�⺻Ű ����

-- �Խ���
CREATE TABLE BOARD (
      B_ID NUMBER NOT NULL, -- ��id,
      B_WRITER VARCHAR2(20) NOT NULL, -- �ۼ���,
      B_SUBJECT VARCHAR2(100) NULL, -- ����,
      B_CONTENT VARCHAR2(500) NULL, -- ����,
      B_RDATE DATE NULL, -- �ۼ���,
      B_CATGO VARCHAR2(40) NULL, -- ī�װ�
      B_LIKE NUMBER, -- ���ƿ��
      M_ID NUMBER, -- ȸ��id,
      A_ID NUMBER -- ������id
);

-- �Խ���
ALTER TABLE BOARD
   ADD CONSTRAINT "PK_BOARD" -- �Խ��� �⺻Ű
   PRIMARY KEY (
      B_ID -- ��id
   );

-- �÷���
CREATE TABLE "PLANER" (
      "P_ID" NUMBER NOT NULL, --�÷�id
      "P_RDATE" DATE,
      "M_ID" NUMBER  -- ȸ��id
);

-- �÷���
ALTER TABLE "PLANER"
   ADD CONSTRAINT "PK_PLANER" -- �÷��� �⺻Ű
   PRIMARY KEY (
      "P_ID" -- �÷�id
   );


-- �����÷���
CREATE TABLE S_PLANER (
      SP_ID NUMBER NOT NULL, -- �����÷�id,
      SP_DAY NUMBER NULL, -- DAY,
      SP_SDAY DATE NULL, -- ������,
      SP_EDAY DATE NULL, -- ������,
      contentid varchar2(200), -- ������id
      P_ID NUMBER -- �÷���id
);

-- �����÷���
ALTER TABLE "S_PLANER"
   ADD CONSTRAINT "PK_S_PLANER" -- �����÷��� �⺻Ű
   PRIMARY KEY (
      "SP_ID" -- �����÷�id
   );

-- �������ε�
CREATE TABLE "FILE_P" (
      "F_ID" NUMBER NOT NULL, -- ����id,
      "F_FNAME" VARCHAR2(100) NULL, -- �����̸�,
      "F_FSIZE" NUMBER NULL, -- ���ϻ�����,
      "F_DESC" VARCHAR2(300) NULL, -- ��������
      "B_ID" NUMBER NOT NULL -- ��id
);

-- �������ε�
ALTER TABLE "FILE_P"
   ADD CONSTRAINT "PK_FILE_P" -- �������ε� �⺻Ű
   PRIMARY KEY (
      "F_ID" -- ����id
   );

-- ������
CREATE TABLE "ADMIN" (
      "A_ID" NUMBER NOT NULL, -- ������id,
      "A_EMAIL" VARCHAR2(40) NULL, -- �̸���,
      "A_PWD" VARCHAR2(40) NULL, -- ��й�ȣ,
      "A_PHONE" VARCHAR(30) NULL -- ��ȭ��ȣ
);

-- ������
ALTER TABLE "ADMIN"
   ADD CONSTRAINT "PK_ADMIN" -- ������ �⺻Ű
   PRIMARY KEY (
      "A_ID" -- ������id
   );

-- ȸ��
CREATE TABLE "MEMBER" (
      "M_ID" NUMBER NOT NULL, -- ȸ��id,
      "M_EMAIL" VARCHAR2(40) NOT NULL, -- �̸���,
      "M_PWD" VARCHAR2(40) NULL, -- ��й�ȣ
      "M_NICK" VARCHAR2(100) NULL, -- �г���,
      "M_PHONE" VARCHAR2(30) NULL, -- ��ȭ��ȣ,
      "M_GENDER" VARCHAR(10) NULL, -- ����,
      "M_BIRTH" DATE NULL, -- �������,
      "M_RDATE" DATE NULL -- ������
);

-- ȸ��
ALTER TABLE "MEMBER"
   ADD CONSTRAINT "PK_MEMBER" -- ȸ�� �⺻Ű
   PRIMARY KEY (
      "M_ID" -- ȸ��id
   );

-- ���
CREATE TABLE "REPLY" (
      "RE_ID" NUMBER NOT NULL, -- ���id,
      "RE_WRITER" VARCHAR2(20) NULL, -- �ۼ���,
      "RE_CONTENT" VARCHAR2(500) NULL, -- ����,
      "RE_RDATE" DATE NULL, -- �ۼ���,
      "B_ID" NUMBER NOT NULL -- ��id
);

-- ���
ALTER TABLE "REPLY"
   ADD CONSTRAINT "PK_REPLY" -- ��� �⺻Ű
   PRIMARY KEY (
      "RE_ID" -- ���id
   );

-- �����ڵ�
CREATE TABLE AREA_T (
      areacode varchar2(20), -- �����ڵ�id,
      area varchar2(200) -- ������
);

-- �����ڵ�
ALTER TABLE AREA_T
   ADD CONSTRAINT "PK_AREA_T" -- �����ڵ� �⺻Ű
   PRIMARY KEY (
      areacode -- �����ڵ�id
   );
   
-- �ñ����ڵ�
CREATE TABLE SIGUNGU_T (
	SI_NAME varchar2(200), -- �ñ�����
	sigungucode varchar2(20), -- �ñ����ڵ�id
	areacode varchar2(20), -- �����ڵ�id
	CONSTRAINT FK_areacode FOREIGN KEY(areacode)
	REFERENCES AREA_T(areacode)	
);

-- �ñ����ڵ�
ALTER TABLE SIGUNGU_T
   ADD CONSTRAINT "PK_SIGUNGU_T" -- �ñ����ڵ� �⺻Ű
   PRIMARY KEY (
      SI_NAME -- �ñ�����
   );

-- ��з�
CREATE TABLE CAT1_T (
	CAT1 varchar2(20), -- ��з�id 
	C1_NAME varchar2(200) -- ��з���
);

-- ��з�
ALTER TABLE CAT1_T
   ADD CONSTRAINT "PK_CAT1" -- ��з� �⺻Ű
   PRIMARY KEY (
      CAT1 -- ��з�id
   );

-- �ߺз�
CREATE TABLE CAT2_T (
	CAT2 varchar2(200), -- �ߺз�id 
	C2_NAME varchar2(200), -- �ߺз���
	CAT1 varchar2(20), -- ��з�id
	CONSTRAINT FK_CAT1 FOREIGN KEY(cat1)
	REFERENCES CAT1_T(cat1)
);

-- �ߺз�
ALTER TABLE CAT2_T
   ADD CONSTRAINT "PK_CAT2" -- �ߺз� �⺻Ű
   PRIMARY KEY (
      CAT2 -- �ߺз�id
   );

-- �Һз�
CREATE TABLE CAT3_T (
	CAT3 varchar2(200), -- �Һз�id 
	C3_NAME varchar2(200), -- �Һз���
	CAT2 varchar2(200), -- �ߺз�id
	CONSTRAINT FK_CAT2 FOREIGN KEY(CAT2)
	REFERENCES CAT2_T(CAT2)
);

-- �Һз�
ALTER TABLE CAT3_T
   ADD CONSTRAINT "PK_CAT3" -- �Һз� �⺻Ű
   PRIMARY KEY (
      CAT3 -- �Һз�id
   );

-- ������Ÿ��
CREATE TABLE CONTENTTYPE (
	CONTENTTYPEID varchar2(20), -- ������Ÿ��id 
	CT_NAME varchar2(200) -- ������Ÿ�Ը�
);

-- ������Ÿ��
ALTER TABLE CONTENTTYPE
   ADD CONSTRAINT "PK_CONTENTTYPE" -- ������Ÿ�� �⺻Ű
   PRIMARY KEY (
      CONTENTTYPEID -- ������Ÿ��id
   );

-- ������
create table TOURITEMS (
    addr1 varchar2(200),
    addr2 varchar2(200),
    areacode varchar2(20),
    cat1 varchar2(20),
    cat2 varchar2(200),
    cat3 varchar2(200),
    contentid varchar2(200) primary key,
    contenttypeid varchar2(20),
    createdtime varchar2(200),
    firstimage varchar2(600),
    firstimage2 varchar2(600),
    mapx varchar2(200),
    mapy varchar2(200),
    mlevel varchar2(20),
    modifiedtime varchar2(200),
    readcount varchar2(200),
    sigungucode varchar2(20),
    tel varchar2(200),
    title varchar2(200),
    zipcode varchar2(200),
    CONSTRAINT FK_ITEMS_AREACODE FOREIGN KEY(areacode)
    REFERENCES AREA_T(areacode),
    CONSTRAINT FK_ITEMS_CAT1  FOREIGN KEY(cat1)
    REFERENCES CAT1_T(cat1),
    CONSTRAINT FK_ITEMS_CAT2 FOREIGN KEY(cat2)
    REFERENCES CAT2_T(cat2),
    CONSTRAINT FK_ITEMS_CAT3 FOREIGN KEY(cat3)
    REFERENCES CAT3_T(cat3)
);

--�ܷ�Ű

-- �Խ���
ALTER TABLE "BOARD"
   ADD CONSTRAINT "FK_MEMBER_TO_BOARD" -- ȸ�� -> �Խ���
   FOREIGN KEY (
      "M_ID" -- ȸ��id
   )
   REFERENCES "MEMBER" ( -- ȸ��
      "M_ID" -- ȸ��id
   );

-- �Խ���
ALTER TABLE "BOARD"
   ADD CONSTRAINT "FK_ADMIN_TO_BOARD" -- ������ -> �Խ���
   FOREIGN KEY (
      "A_ID" -- ������id
   )
   REFERENCES "ADMIN" ( -- ������
      "A_ID" -- ������id
   );


-- �÷���
ALTER TABLE "PLANER"
   ADD CONSTRAINT "FK_MEMBER_TO_PLANER" -- ȸ�� -> �÷���
   FOREIGN KEY (
      "M_ID" -- ȸ��id
   )
   REFERENCES "MEMBER" ( -- ȸ��
      "M_ID" -- ȸ��id
   );
 
 -- �����÷���
ALTER TABLE S_PLANER
   ADD CONSTRAINT "FK_TOURITEMS_TO_S_PLANER" -- ������ -> �����÷���
   FOREIGN KEY (
      contentid -- ������id
   )
   REFERENCES TOURITEMS ( -- ������
      contentid -- ������id
   );

-- �����÷���
ALTER TABLE "S_PLANER"
   ADD CONSTRAINT "FK_PLANER_TO_S_PLANER" -- �÷��� -> �����÷���
   FOREIGN KEY (
      "P_ID" -- �÷���id
   )
   REFERENCES "PLANER" ( -- �÷���
      "P_ID"
   );

-- �������ε�
ALTER TABLE "FILE_P"
   ADD CONSTRAINT "FK_BOARD_TO_FILE_P" -- �Խ��� -> �������ε�
   FOREIGN KEY (
      "B_ID" -- ��id
   )
   REFERENCES "BOARD" ( -- �Խ���
      "B_ID" -- ��id
   );

-- ���
ALTER TABLE "REPLY"
   ADD CONSTRAINT "FK_BOARD_TO_REPLY" -- �Խ��� -> ���
   FOREIGN KEY (
      "B_ID" -- ��id
   )
   REFERENCES "BOARD" ( -- �Խ���
      "B_ID" -- ��id
   );


--������ ����

--������
CREATE SEQUENCE ADMIN_ID
INCREMENT BY 1
START WITH 1
nocache;

--���
CREATE SEQUENCE REPLY_ID
INCREMENT BY 1
START WITH 1
nocache;

--÷������
CREATE SEQUENCE FILE_P_ID
INCREMENT BY 1
START WITH 1
nocache;

--�Խ���
CREATE SEQUENCE BOARD_ID
INCREMENT BY 1
START WITH 1
nocache;

--�÷���
CREATE SEQUENCE PLANER_ID
INCREMENT BY 1
START WITH 1
nocache;

--�����÷���
CREATE SEQUENCE S_PLANER_ID
INCREMENT BY 1
START WITH 1
nocache;

--ȸ��
CREATE SEQUENCE MEMBER_ID
INCREMENT BY 1
START WITH 1
nocache;
