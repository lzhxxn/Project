-- 항공사 
insert into AIRLINE values(100, '대한항공', '제주도 서귀포시');
insert into AIRLINE values(200, '아시아나항공', '서울시 강서구');
insert into AIRLINE values(300, '제주항공', '서울시 강서구');
insert into AIRLINE values(400, '진에어', '서울시 강서구');
insert into AIRLINE values(500, '티웨이', '제주도 서귀포시');

-- 항공사부서 
insert into AIRLINEDEPT values(10, '개발팀', 100 );
insert into AIRLINEDEPT values(20, '홍보팀', 300);
insert into AIRLINEDEPT values(30, '인사팀', 500);

-- 직원 
insert into EMP values(01, '이지훈', '과장', 10);
insert into EMP values(02, '최우재', '팀장', 20);
insert into EMP values(03, '이민용', '사원', 30);
insert into EMP values(04, '이옥석', '회장', 20);
insert into EMP values(05, '유진복', '차장', 10);

-- 비행스케줄
insert into FLIGHTSCHEDULE values(123, '2020-12-12', 01, 'KE999');
insert into FLIGHTSCHEDULE values(1234, '2019-11-15', 02, 'OZ111');
insert into FLIGHTSCHEDULE values(12345, '2016-01-12', 03, 'KE204');
insert into FLIGHTSCHEDULE values(123456, '2015-08-13', 04, 'OZ454');

-- 비행기
insert into AIRPLANE values('KE999', 555, 234, 99999, 500);
insert into AIRPLANE values('OZ111', 666, 267, 99998, 600);
insert into AIRPLANE values('KE204', 777, 299, 99997, 550);
insert into AIRPLANE values('OZ454', 888, 212, 99996, 800);

-- 운행 
insert into OPERATION values(71, SYSDATE, 'KE999', 100);
insert into OPERATION values(81, '2020-12-12', 'OZ454', 300);
insert into OPERATION values(91, '2016-01-12', 'OZ111', 200);
insert into OPERATION values(61, SYSDATE, 'KE204', 500);

-- 좌석 
insert into SEAT values(11, 'OZ111', 'A');
insert into SEAT values(22, 'KE999', 'B');
insert into SEAT values(33, 'KE999', 'C');
insert into SEAT values(44, 'OZ111', 'P');
insert into SEAT values(55, 'KE204', 'D');
insert into SEAT values(66, 'KE204', 'A');
insert into SEAT values(77, 'OZ454', 'B');

-- 예약좌석 
insert into R_SEAT values(2, 22, 'OZ111');
insert into R_SEAT values(3, 55, 'KE999');
insert into R_SEAT values(4, 11, 'KE204');

-- 예매 
insert into RESERVATION values(1122, SYSDATE, 100000, 900, 2, 7000);
insert into RESERVATION values(2233, '2020-12-12', 90000, 901, 3, 7001);

-- 승객 
insert into PASSENGER values(900, '이지훈', '헬창', '183321', '02-123-1111', '234234', '서울시 서대문구');
insert into PASSENGER values(901, '최우재', '롤창', '173553', '02-123-2222', '567567', '서울시 마포구');
insert into PASSENGER values(902, '이민용', '샤이', '153613', '02-123-3333', '654654', '서울시 강서구');
insert into PASSENGER values(903, '이옥석', '파워', '123734', '02-123-4444', '890890', '서울시 은평구');
insert into PASSENGER values(904, '유진복', '오더', '143523', '02-123-5555', '114332', '서울시 강남구');

-- 수하물
insert into LUGGAGE values(1000, 20, 40000, 901);
insert into LUGGAGE values(1001, 15, 35000, 903);
insert into LUGGAGE values(1002, 40, 70000, 905);

-- 이용
insert into USES values(71, 901, 99999, 550);
insert into USES values(81, 900, 88888, 660);

-- 일정
insert into SCHEDULE values(01, SYSDATE, SYSDATE, 99999, 66666, 'KE204');
insert into SCHEDULE values(02, SYSDATE, SYSDATE, 88888, 77777, 'KE999');
insert into SCHEDULE values(03, SYSDATE, SYSDATE, 77777, 99999, 'OZ111');
insert into SCHEDULE values(04, SYSDATE, SYSDATE, 66666, 88888, 'KE204' );

-- 공항
insert into AIRPORT values(99999, '김포공항', '대한민국');
insert into AIRPORT values(88888, '제주공항', '대한민국');
insert into AIRPORT values(77777, '부산공항', '대한민국');
insert into AIRPORT values(66666, '오클랜드', '뉴질랜드');

-- 제공
insert into OFFER values(77777, 1212, '2F', SYSDATE);
insert into OFFER values(99999, 1313, '4F', SYSDATE);

-- 편의시설
insert into CONVENIENT values(1212, '편의점');
insert into CONVENIENT values(1313, '라운지');

commit;

-- 확인 
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


