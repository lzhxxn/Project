<%@ page contentType="text/html; charset=utf-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Bootstrap Core CSS -->
<link href="../assets/css/login.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Odga.com
  </title>

<!DOCTYPE html>
<div class="col-xl-2 col-lg-2 col-md-1" style="position: absolute;">
               <div class="logo">
                 <a href="index.do"><img src="assets/img/logo/logo_b.png" alt=""></a>
               </div>
</div>
<!-- 로그인  -->
<p class="tip"></p>
<div class="cont">
  <div class="form sign-in">
   <form action="findId" method="post" id="findI"  > 
   
    <h2>아이디 찾기</h2>
    <label>
      <span>이름</span>
      <input type="text" name="m_name" id="m_name" />
    </label>
    <label>
      <span>전화번호</span>
      <input type="text" name="m_phone" id="m_phone" />

    </label>
    <!-- <p class="forgot-pass"><a href="findIdPwd">Forgot Id/Password</a></p> -->
    <button type="button" class="submit" onclick="findId()">찾기</button>
   <%--  <center> --%>
    <%-- <button class="loginBtn loginBtn--facebook"  >
  	Login with Facebook
	</button>
	<BR>
	<button class="loginBtn loginBtn--google"  >
	  Login with Google
	  </center>
	</button> --%>
	</form>
  </div>
  
  <div class="sub-cont">
    <div class="img">
      <div class="img__text m--up">
        <h2>비밀번호 찾기</h2>
        <p></p>
      </div>
      <div class="img__text m--in">
        <h2>아이디 찾기</h2>
        <p></p>
      </div>
      
      <div class="img__btn">
        <span class="m--up">Find PWD</span>
        <span class="m--in">Find ID</span>
      </div>
      
    </div>
    
    <!-- 회원가입  -->
    
    <script>
 
	//아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
    var idCheck = 0;
    var pwdCheck = 0;
    //아이디 체크하여 가입버튼 비활성화, 중복확인.
    function checkId() {
    	   	
        //var inputed = $('.m_email').val();
        var inputed = $("#email").val();
		
        $.ajax({
            data : {
                m_email : $("#email").val()
            },
            type : "post",
            url : "checkId.jy",
            success : function(data) {
            	
                if(inputed=="" && data=='1') {
                    $(".submit").prop("disabled", true);
                    $(".submit").css("background-color", "#aaaaaa");
                    $("#email").css("background-color", "#FFCECE");
                    idCheck = 0;
                } else if (data == '1') {
                    $("#email").css("background-color", "#B0F6AC");
                    idCheck = 1;
                    if(idCheck==1 && pwdCheck == 1) {
                        $(".submit").prop("disabled", false);
                        $(".submit").css("background-color", "#4CAF50");
                    } 
                } else if (data == '0') {
                    $(".submit").prop("disabled", true);
                    $(".submit").css("background-color", "#aaaaaa");
                    $("#email").css("background-color", "#FFCECE");
                    idCheck = 0;
                } 
            	
            	
            	console.log(data);
            	
            	
            },
            // 밑에 라인 참조 시작
            type : "POST",
            // 밑에 라인 참조 종료
            error : function(error) {
            	console.log(error);
            	alert("에러");
            }
        });
    }
    
    // 패스워드 확인
    function checkPwd() {
        var inputed = $("#m_pwd").val();
        var reinputed = $("#m_pwdcheck").val();
        if(reinputed=="" && (inputed != reinputed || inputed == reinputed)){
            $(".submit").prop("disabled", true);
            $(".submit").css("background-color", "#aaaaaa");
            $("#m_pwdcheck").css("background-color", "#FFCECE");
        }
        else if (inputed == reinputed) {
            $("#m_pwdcheck").css("background-color", "#B0F6AC");
            pwdCheck = 1;
            if(idCheck==1 && pwdCheck == 1) {
                $(".submit").prop("disabled", false);
                $(".submit").css("background-color", "#4CAF50");
                
            }
        } else if (inputed != reinputed) {
            pwdCheck = 0;
            $(".submit").prop("disabled", true);
            $(".submit").css("background-color", "#aaaaaa");
            $("#m_pwdcheck").css("background-color", "#FFCECE");
       }
    }
	
    // email
    function emailAuth(){
    	
    	if ( confirm("이메일 인증 진행하시겠습니까?") ) {
    		
            $.ajax({
                data : {
                	m_email : $("#email").val()
                },
                type : "post",
                url : "/sign-up",
                success : function(data) {
                	alert("성공");
                	console.log(data);
                	$("#email_auth_chk").css("display","block");
                },
                error : function(error) {
                	console.log(error);
                	alert("에러");
                }
            });
    		
    	} else {
    		alert("취소");
    	}
    	
    }
	function findId(){
		 $.ajax({
             data : {
            	 m_name : $("#m_name").val(),
            	 m_phone : $("#m_phone").val()
             },
             type : "post",
             url : "/findId",
             success : function(data) {
            	 if(data != "??"){
            		 alert("회원님의 아이디는 ' " + data+ " ' 입니다.");
            		 location.reload(true);
            	 }else{
            		console.log(data);
                  	alert("입력하신 정보를 확인해 주세요"); 
                  	location.reload(true);
            	 }

             }
         });
 		
 	}
	
	function findPwd(){
		 $.ajax({
            data : {
           	 m_email : $("#email").val(),
           	 m_pwd : $("#m_pwd").val()
            },
            type : "post",
            url : "/findPwd",
            success : function(data) {
            	if(data=="1"){
            		alert("비밀번호가 변경되었습니다.");
            		location.href="login.do";
            	}else{
            		alert("비밀번호 변경 실패.");
            		location.reload(true);
            	}
            	
            }
        });
		
	}
	
    function emailAuth_key(){
    	
        $.ajax({
            data : {
            	Authkey : $("#email_AuthKey").val()
            },
            type : "post",
            url : "/emailConfirm",
            success : function(data) {
            	alert("인증성공하였습니다.");
            	console.log(data);
            	$("#email_auth_chk").css("display","none");
            	$("#newPwd").css("display","block");
            	
            },
            error : function(error) {
            	console.log(error);
            	alert("에러");
            	alert("이메일인증을 다시하세요");
            }
        });
    }
    
    </script>
   
    <div class="form sign-up">
    <form action="join.do" method="post" id="joinS"  >
    
      <h2>비밀번호 찾기</h2>
      <label>
        <span>이메일</span>
        <input type="text" name="m_email" id="email" oninput="checkId()" required/>
        <input type='button' value='이메일인증' style="float: right;" onclick="emailAuth()">
      </label>
     
      
      <div id="email_auth_chk" style="display:none" >
        <input type="text" name="m_email_AuthKey" id="email_AuthKey" />
        <input type='button' value='인증하기' onclick="emailAuth_key()" />
      </div> 
      
      <div id="newPwd" style="display:none" >
        <label>
	        <span>새로운 비밀번호</span>
	        <input type="password" name="m_pwd" id="m_pwd" oninput="checkPwd()" required/>
     	</label>
     	<label>      
	        <span>새로운 비밀번호 확인</span>
	        <input type="password" name="m_pwdcheck" id="m_pwdcheck" oninput="checkPwd()" />
      	</label>
      </div>       

    <div class="row">
      <button type="button" class="submit" onclick="findPwd()">변경하기</button>
    </div>
    </form>
   </div>  

  </div>
</div>

<a href="https://dribbble.com/shots/3306190-Login-Registration-form" target="_blank" class="icon-link">
  <img src="http://icons.iconarchive.com/icons/uiconstock/socialmedia/256/Dribbble-icon.png">
</a>
<a href="https://instagram.com/m1inyong" target="_blank" class="icon-link icon-link--twitter">
  <img src="https://cdn1.iconfinder.com/data/icons/logotypes/32/twitter-128.png">
</a>

<!-- jQuery-->
    <script src="../assets/js/login.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>