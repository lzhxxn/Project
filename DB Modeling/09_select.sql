SELECT A.A_RECEIVE "수용인원", S.S_NUMBER "좌석번호", S.S_GRADE "등급" FROM AIRPLANE A, SEAT S WHERE A.A_NUMBER = S.A_NUMBER;
SELECT P.P_PASSPORT "여권번호", P.P_NAME "승객이름", L.G_NUMBER "수하물 번호" FROM PASSENGER P, LUGGAGE L WHERE P.PA_NUMBER = L.PA_NUMBER;
SELECT A.L_NUMBER "항공사 번호", A.L_NAME "항공사명", D.D_NAME "부서명" FROM AIRLINE A, AIRLINEDEPT D WHERE A.L_NUMBER= D.L_NUMBER;
SELECT O.P_NUMBER "공항번호", O.O_LOC "편의시설 위치", O.O_TIME "운영시간", C.C_CATEGORY "편의시설 분류" FROM OFFER O , CONVENIENT C WHERE O.C_NUMBER = C.C_NUMBER;
SELECT A.A_NUMBER "항공편명", F.P_NUMBER "비행번호", F.P_DATE "비행일자", F.E_NUMBER "직원번호" FROM AIRPLANE A , FLIGHTSCHEDULE F WHERE A.A_NUMBER=F.A_NUMBER;
















에어플레인 테이블하고, 시트테이블에서 각각뽑아내고싶은 데이터가 있어서, 셀렉문을 썼다.
에어플레인 테이블을 A로지정하고, 시트테이블을 S로지정하고
A.A수용인원
 가운데 foreign키 통로가있어서 공통된 A_NUNMBER.