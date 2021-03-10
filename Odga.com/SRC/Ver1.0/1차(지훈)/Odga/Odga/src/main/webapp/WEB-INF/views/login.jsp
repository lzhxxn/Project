<%@ page contentType="text/html; charset=utf-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Bootstrap Core CSS -->
<link href="../assets/css/login.css" rel="stylesheet">


<!DOCTYPE html>
<!-- 구글 로그인  -->
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="346896411605-njt8dd4vg0qd99mvqd5r8baio9t12ku5.apps.googleusercontent.com">
    <!-- Google -->
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <!-- Naver -->
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>

    <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark" ></div>
    <script>
        function onSignIn(googleUser) {
            // Useful data for your client-side scripts:
            var profile = googleUser.getBasicProfile();
           // The ID token you need to pass to your backend:
            var id_token = googleUser.getAuthResponse().id_token;
	            console.log("ID: " + profile.getId()); // Don't send this directly to your server!
	            console.log("ID Token: " + id_token);
				console.log('Full Name: ' + profile.getName());
	            console.log("Email: " + profile.getEmail());
	            	
        };
    </script>
    	<!-- 네이버아이디로로그인 버튼 노출 영역 -->
  		<div id="naver_id_login"></div>
   		<!-- 네이버아이디로로그인 버튼 노출 영역 -->
		<script type="text/javascript">
 		var naver_id_login = new naver_id_login("3peaahDHXS2EooanIoAb", "http://localhost:8080");	// Client ID, CallBack URL 삽입
											// 단 'localhost'가 포함된 CallBack URL
 		var state = naver_id_login.getUniqState();
		
 		naver_id_login.setButton("white", 2, 40);
 		naver_id_login.setDomain("http://localhost:8080");	//  URL
 		naver_id_login.setState(state);
 		naver_id_login.setPopup();
 		naver_id_login.init_naver_id_login();
	</script>
	
		<script type="text/javascript">
		var naver_id_login = new naver_id_login("3peaahDHXS2EooanIoAb ID", "http://localhost:8080"); // 역시 마찬가지로 'localhost'가 포함된 CallBack URL
		
		// 접근 토큰 값 출력
		alert(naver_id_login.oauthParams.access_token);
		
		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		function naverSignInCallback() {
			alert(naver_id_login.getProfileData('email'));
			alert(naver_id_login.getProfileData('nickname'));
			alert(naver_id_login.getProfileData('age'));
		}
	</script>

</body>
</html>

<p class="tip"></p>
<div class="cont">
  <div class="form sign-in">
   <form action="login.do" method="post" id="LoginS"  > 
    <h2>여행시작하기,</h2>
    <label>
      <span>이메일</span>
      <input type="text" name="m_email" id="l_email" />
    </label>
    <label>
      <span>비밀번호</span>
      <input type="password" name="m_pwd" id="l_pwd" />
    </label>
    <p class="forgot-pass">비밀번호를 잊으셨나요?</p>
    <button type="submit" class="submit">시작</button>
    <center>
	<button class="loginBtn LoginBtn--naver" id="naver_id_login" >
	Login with Naver
	<BR>
	<button class="loginBtn loginBtn--google" data-onsuccess="onSignIn"  >
	  Login with Google
	  </center>
	</button>
	</form>
  </div>
  
  <div class="sub-cont">
    <div class="img">
      <div class="img__text m--up">
        <h2>처음 오셨나요?</h2>
        <p></p>
      </div>
      <div class="img__text m--in">
        <h2>가입하기</h2>
        <p></p>
      </div>
      
      <div class="img__btn">
        <span class="m--up">가입하기</span>
        <span class="m--in">로그인 하기</span>
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
            	
                if(inputed=="" && data=='0') {
                    $(".submit").prop("disabled", true);
                    $(".submit").css("background-color", "#aaaaaa");
                    $("#email").css("background-color", "#FFCECE");
                    idCheck = 0;
                } else if (data == '0') {
                    $("#email").css("background-color", "#B0F6AC");
                    idCheck = 1;
                    if(idCheck==1 && pwdCheck == 1) {
                        $(".submit").prop("disabled", false);
                        $(".submit").css("background-color", "#4CAF50");
                    } 
                } else if (data == '1') {
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
    <form action="join.do" method="post" id="joinS" enctype="multipart/form-data"  >
    
      <h2>두근두근 여행,</h2>
       <label>
        <span>프로필사진등록</span>
        <input type="file" name="file" id="m_fname" required/>
      </label>
      <label>
        <span>이메일</span>
        <input type="text" name="m_email" id="email" oninput="checkId()" required/>
        <input type='button' value='이메일인증' style="float: right;" onclick="emailAuth()">
      </label>
 
      <div id="email_auth_chk" style="display:none" >
        <input type="text" name="m_email_AuthKey" id="email_AuthKey" />
        <input type='button' value='인증하기' onclick="emailAuth_key()" />
      </div>      
      
      <label>
        <span>닉네임</span>
        <input type="text" name="m_nick" id="m_nick"  required/>
      </label>
      <label>
        <span>비밀번호</span>
        <input type="password" name="m_pwd" id="m_pwd" oninput="checkPwd()" required/>
      </label>
      <label>
      
        <span>비밀번호 확인</span>
        <input type="password" name="m_pwd" id="m_pwdcheck" oninput="checkPwd()" />
      </label>
       
      <label>
        <span>휴대폰번호</span>
        <input type="text" name="m_phone" id="m_phone"  required/>
      </label>
      <BR>
      <label>
      <span>생년월일</span>
        <input type="date" name="m_birth" id="m_birth"  required/>
        
        
      </label>
      
      <div class="gender">
      <CENTER>
	    <!-- 
	    <input type="radio" value="male" name="m_gender" />
	    <label for="male" class="radio" checked>Male</label>
	    <label for="female" class="radio">Female</label>
	    <input type="radio" value="female" name="m_gender" />
	     -->
	    <input type="radio" id="male" name="m_gender" value="male" checked>
		<label for="male" class="radio">Male</label><br>
		<input type="radio" id="female" name="m_gender" value="female">
		<label for="female" class="radio">Female</label><br>
      </CENTER>
      </div>
    <div class="row">
      <button type="submit" class="submit" >가입하기</button>
      <button type="button" class="fb-btn" >Join with <span>facebook</span></button>
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