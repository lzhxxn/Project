-- �װ��� 
create table AIRLINE(
   L_NUMBER NUMBER(6),  
   L_NAME VARCHAR2(30), 
   L_ADDR VARCHAR2(100)
);
alter table AIRLINE add constraint AIRLINE_PK primary key(L_NUMBER);

-- �װ���μ� 
create table AIRLINEDEPT(
   D_CODE NUMBER(6), --�μ��ڵ�(PK) 
   D_NAME VARCHAR2(30), --�μ���
   L_NUMBER NUMBER(6) --�װ����ȣ(FK)
);
alter table AIRLINEDEPT add constraint AIRLINEDEPT_PK primary key(D_CODE);
alter table AIRLINEDEPT add constraint AIRLINEDEPT_AIRLINE_FK foreign key(L_NUMBER) references AIRLINE on delete cascade;

-- ���� 
create table EMP(
   E_NUMBER NUMBER(6),  -- ������ȣ(PK)
   E_NAME VARCHAR2(30), -- �����̸�
   E_RANK VARCHAR2(30), -- ���� 
   D_CODE NUMBER(6)   -- �μ��ڵ�(FK)
);
alter table EMP add constraint EMP_PK primary key(E_NUMBER);
alter table EMP add constraint EMP_AIRLINEDEPT_FK foreign key(D_CODE) references  AIRLINEDEPT on delete cascade;

-- ���ེ����
create table FLIGHTSCHEDULE(
   P_NUMBER NUMBER(6),  -- �����ȣ(PK)
   P_DATE DATE,       -- ��������
   E_NUMBER NUMBER(6), -- ������ȣ(FK)
   A_NUMBER VARCHAR2(30) -- �װ����(FK)
);
alter table FLIGHTSCHEDULE add constraint FLIGHTSCHEDULE_PK primary key(P_NUMBER);
alter table FLIGHTSCHEDULE add constraint FLIGHTSCHEDULE_EMP_FK foreign key(E_NUMBER) references  EMP on delete cascade;
alter table FLIGHTSCHEDULE add constraint FLIGHTSCHEDULE_AIRPLANE_FK foreign key(A_NUMBER) references  AIRPLANE on delete cascade;

-- �����
create table AIRPLANE(
   A_NUMBER VARCHAR2(30),            -- �װ����(PK) 
   A_WEIGHT NUMBER(6),            -- ����
   A_SIZE NUMBER(6),            -- ũ�� 
   A_SPEED NUMBER(6),        -- �ӵ�
   A_RECEIVE NUMBER(6)       -- �����ο�
);
alter table AIRPLANE add constraint AIRPLANE_PK primary key(A_NUMBER);

-- ����
create table OPERATION(
   O_NUMBER NUMBER(6),       -- �����ȣ(PK)  
   O_DATE DATE,             -- ��������
   A_NUMBER VARCHAR2(30),      -- �װ����(FK)
   L_NUMBER NUMBER(6)  -- �װ����ȣ(FK)
);
alter table OPERATION add constraint OPERATION_PK primary key(O_NUMBER);
alter table OPERATION add constraint OPERATION_AIRPLANE_FK foreign key(A_NUMBER) references AIRPLANE;
alter table OPERATION add constraint OPERATION_AIRLINE_FK foreign key(L_NUMBER) references AIRLINE;

-- �¼� 
create table SEAT(
   S_NUMBER NUMBER(6),               -- �¼���ȣ(PK)
   A_NUMBER VARCHAR2(30),                -- �װ����(PK, FK)
   S_GRADE CHAR            -- ���
);
alter table SEAT add constraint SEAT_PK primary key(S_NUMBER, A_NUMBER);
alter table SEAT add constraint SEAT_AIRPLANE_FK foreign key(A_NUMBER) references AIRPLANE;   

-- �����¼�
create table R_SEAT(
    R_S_NUMBER NUMBER(6),             -- �����¼���ȣ(PK)
    S_NUMBER NUMBER(6),             -- �¼���ȣ(FK)
    A_NUMBER VARCHAR2(30)         -- �װ����(FK)
);
alter table R_SEAT add constraint R_SEAT_PK primary key(R_S_NUMBER);
alter table R_SEAT add constraint R_SEAT_AIRPLANE_FK foreign key(A_NUMBER) references AIRPLANE;

-- ���� 
create table RESERVATION(
    R_NUMBER NUMBER(6),          -- ���Ź�ȣ(PK) 
    R_DATE DATE,    -- ��������
    R_AMOUNT NUMBER(10),      -- ���űݾ�
    P_NUMBER NUMBER(6),     -- �°���ȣ(FK)
    R_S_NUMBER NUMBER(6),   -- �����¼���ȣ(FK)
    S_NUMBER NUMBER(6)    -- ������ȣ(FK)
);
alter table RESERVATION add constraint RESERVATION_PK primary key(R_NUMBER);
alter table RESERVATION add constraint RESERVATION_FLIGHTSCHEDULE_FK foreign key(P_NUMBER) references FLIGHTSCHEDULE;
alter table RESERVATION add constraint RESERVATION_R_SEAT_FK foreign key(R_S_NUMBER) references R_SEAT;
alter table RESERVATION add constraint RESERVATION_SCHEDULE_FK foreign key(S_NUMBER) references SCHEDULE;

-- �°� 
create table PASSENGER( 
    PA_NUMBER NUMBER(6),   -- �°���ȣ(PK)
    P_NAME VARCHAR2(30),     -- �°��̸�
    P_ID VARCHAR2(20),         -- ���̵�
    P_PWD VARCHAR2(20), -- ��й�ȣ
    P_CALL VARCHAR2(20), -- ��ȭ��ȣ
    P_PASSPORT VARCHAR2(20), -- ���ǹ�ȣ
    P_ADDR VARCHAR2(20) -- �ּ�
);
alter table PASSENGER add constraint PASSENGER_PK primary key(PA_NUMBER);

-- ���Ϲ�
create table LUGGAGE( 
    G_NUMBER NUMBER(6),   -- ���Ϲ���ȣ(PK)
    G_WEIGHT NUMBER(6),     -- ����
    G_PRICE NUMBER(10),         -- ����
    PA_NUMBER NUMBER(6) -- �°���ȣ(FK)
);
alter table LUGGAGE add constraint LUGGAGE_PK primary key(G_NUMBER);
alter table LUGGAGE add constraint LUGGAGE_PASSENGER_FK foreign key(PA_NUMBER) references PASSENGER;

-- �̿�
create table USES( 
    U_NUMBER NUMBER(6),   -- �̿��ȣ(PK)
    U_P_NUMBER NUMBER(6),     -- �°���ȣ(FK)
    P_NUMBER NUMBER(6),         -- ���׹�ȣ(FK)
    C_NUMBER NUMBER(6) -- ���ǽü���ȣ(FK)
);
alter table USES add constraint USES_PK primary key(U_NUMBER);
alter table USES add constraint USES_PASSENGER_FK foreign key(U_P_NUMBER) references PASSENGER;
alter table USES add constraint USES_AIRPORT_FK foreign key(P_NUMBER) references AIRPORT;
alter table USES add constraint USES_CONVENIENT_FK foreign key(C_NUMBER) references CONVENIENT;

-- ����
create table SCHEDULE( 
    S_NUMBER NUMBER(6),   -- ������ȣ(PK)
    S_DEPARTURE DATE,     -- ��߽ð�
    S_ARRIVE DATE,        -- �����ð�
    S_D_NUMBER NUMBER(6),         -- ��߰��׹�ȣ(FK)
    S_A_NUMBER NUMBER(6), -- �������׹�ȣ(FK)
    F_NUMBER VARCHAR2(30)   -- �װ����(FK)
);
alter table SCHEDULE add constraint SCHEDULE_PK primary key(S_NUMBER);
alter table SCHEDULE add constraint SCHEDULE_AIRPORT_FK foreign key(S_D_NUMBER) references AIRPORT;
alter table SCHEDULE add constraint SCHEDULE_AIRPORT_FK foreign key(S_A_NUMBER) references AIRPORT;
alter table SCHEDULE add constraint SCHEDULE_AIRPLANE_FK foreign key(F_NUMBER) references AIRPLANE;

-- ����
create table AIRPORT( 
    P_NUMBER NUMBER(6),   -- ���׹�ȣ(PK)
    P_NAME VARCHAR2(30),     -- ���׸�
    P_NATION VARCHAR2(30)         -- ������
);
alter table AIRPORT add constraint AIRPORT_PK primary key(P_NUMBER);

-- ����
create table OFFER( 
    P_NUMBER NUMBER(6),   -- ���׹�ȣ(PK, FK)
    C_NUMBER NUMBER(6),     -- ���ǽü���ȣ(PK, FK)
    O_LOC VARCHAR2(20),         -- ��ġ
    O_TIME DATE -- �̿밡�ɽð�
);
alter table OFFER add constraint OFFER_PK primary key(P_NUMBER, C_NUMBER);
alter table OFFER add constraint OFFER_AIRPORT_FK foreign key(P_NUMBER) references AIRPORT;
alter table OFFER add constraint OFFER_CONVENIENT_FK foreign key(C_NUMBER) references CONVENIENT;

-- ���ǽü�
create table CONVENIENT( 
    C_NUMBER NUMBER(6),   -- ���ǽü���ȣ(PK)
    C_CATEGORY VARCHAR2(10)     -- �з�
);
alter table CONVENIENT add constraint CONVENIENT_PK primary key(C_NUMBER);


-- Ȯ�� 
select TNAME from TAB;
select SEQUENCE_NAME from SEQ;
select CONSTRAINT_NAME, CONSTRAINT_TYPE from user_constraints order by CONSTRAINT_NAME;