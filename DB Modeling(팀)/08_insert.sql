-- �װ��� 
insert into AIRLINE values(100, '�����װ�', '���ֵ� ��������');
insert into AIRLINE values(200, '�ƽþƳ��װ�', '����� ������');
insert into AIRLINE values(300, '�����װ�', '����� ������');
insert into AIRLINE values(400, '������', '����� ������');
insert into AIRLINE values(500, 'Ƽ����', '���ֵ� ��������');

-- �װ���μ� 
insert into AIRLINEDEPT values(10, '������', 100 );
insert into AIRLINEDEPT values(20, 'ȫ����', 300);
insert into AIRLINEDEPT values(30, '�λ���', 500);

-- ���� 
insert into EMP values(01, '������', '����', 10);
insert into EMP values(02, '�ֿ���', '����', 20);
insert into EMP values(03, '�̹ο�', '���', 30);
insert into EMP values(04, '�̿���', 'ȸ��', 20);
insert into EMP values(05, '������', '����', 10);

-- ���ེ����
insert into FLIGHTSCHEDULE values(123, '2020-12-12', 01, 'KE999');
insert into FLIGHTSCHEDULE values(1234, '2019-11-15', 02, 'OZ111');
insert into FLIGHTSCHEDULE values(12345, '2016-01-12', 03, 'KE204');
insert into FLIGHTSCHEDULE values(123456, '2015-08-13', 04, 'OZ454');

-- �����
insert into AIRPLANE values('KE999', 555, 234, 99999, 500);
insert into AIRPLANE values('OZ111', 666, 267, 99998, 600);
insert into AIRPLANE values('KE204', 777, 299, 99997, 550);
insert into AIRPLANE values('OZ454', 888, 212, 99996, 800);

-- ���� 
insert into OPERATION values(71, SYSDATE, 'KE999', 100);
insert into OPERATION values(81, '2020-12-12', 'OZ454', 300);
insert into OPERATION values(91, '2016-01-12', 'OZ111', 200);
insert into OPERATION values(61, SYSDATE, 'KE204', 500);

-- �¼� 
insert into SEAT values(11, 'OZ111', 'A');
insert into SEAT values(22, 'KE999', 'B');
insert into SEAT values(33, 'KE999', 'C');
insert into SEAT values(44, 'OZ111', 'P');
insert into SEAT values(55, 'KE204', 'D');
insert into SEAT values(66, 'KE204', 'A');
insert into SEAT values(77, 'OZ454', 'B');

-- �����¼� 
insert into R_SEAT values(2, 22, 'OZ111');
insert into R_SEAT values(3, 55, 'KE999');
insert into R_SEAT values(4, 11, 'KE204');

-- ���� 
insert into RESERVATION values(1122, SYSDATE, 100000, 900, 2, 7000);
insert into RESERVATION values(2233, '2020-12-12', 90000, 901, 3, 7001);

-- �°� 
insert into PASSENGER values(900, '������', '��â', '183321', '02-123-1111', '234234', '����� ���빮��');
insert into PASSENGER values(901, '�ֿ���', '��â', '173553', '02-123-2222', '567567', '����� ������');
insert into PASSENGER values(902, '�̹ο�', '����', '153613', '02-123-3333', '654654', '����� ������');
insert into PASSENGER values(903, '�̿���', '�Ŀ�', '123734', '02-123-4444', '890890', '����� ����');
insert into PASSENGER values(904, '������', '����', '143523', '02-123-5555', '114332', '����� ������');

-- ���Ϲ�
insert into LUGGAGE values(1000, 20, 40000, 901);
insert into LUGGAGE values(1001, 15, 35000, 903);
insert into LUGGAGE values(1002, 40, 70000, 905);

-- �̿�
insert into USES values(71, 901, 99999, 550);
insert into USES values(81, 900, 88888, 660);

-- ����
insert into SCHEDULE values(01, SYSDATE, SYSDATE, 99999, 66666, 'KE204');
insert into SCHEDULE values(02, SYSDATE, SYSDATE, 88888, 77777, 'KE999');
insert into SCHEDULE values(03, SYSDATE, SYSDATE, 77777, 99999, 'OZ111');
insert into SCHEDULE values(04, SYSDATE, SYSDATE, 66666, 88888, 'KE204' );

-- ����
insert into AIRPORT values(99999, '��������', '���ѹα�');
insert into AIRPORT values(88888, '���ְ���', '���ѹα�');
insert into AIRPORT values(77777, '�λ����', '���ѹα�');
insert into AIRPORT values(66666, '��Ŭ����', '��������');

-- ����
insert into OFFER values(77777, 1212, '2F', SYSDATE);
insert into OFFER values(99999, 1313, '4F', SYSDATE);

-- ���ǽü�
insert into CONVENIENT values(1212, '������');
insert into CONVENIENT values(1313, '�����');

commit;

-- Ȯ�� 
select * from AIRLINE;
select * from AIRLINEDEPT;
select * from EMP;
select * from FLIGHTSCHEDULE;
select * from AIRPLANE;
select * from OPERATION;
select * from SEAT;
select * from R_SEAT;
select * from RESERVATION;
select * from PASSENGER;
select * from LUGGAGE;
select * from USES;
select * from SCHEDULE;
select * from AIRPORT;
select * from OFFER;
select * from CONVENIENT;


