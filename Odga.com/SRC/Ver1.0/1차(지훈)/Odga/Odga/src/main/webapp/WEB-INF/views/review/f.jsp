<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="x-ua-compatible" content="ie=edge">
		<title>어디가조 </title>
		<meta name="description" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
	
	 <!-- CSS here -->
			<link rel="stylesheet" href="assets/css/bootstrap.min.css">
			<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
			<link rel="stylesheet" href="assets/css/slicknav.css">
			<link rel="stylesheet" href="assets/css/animate.min.css">
			<link rel="stylesheet" href="assets/css/magnific-popup.css">
			<link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
			<link rel="stylesheet" href="assets/css/themify-icons.css">
			<link rel="stylesheet" href="assets/css/slick.css">
			<link rel="stylesheet" href="assets/css/nice-select.css">
			<link rel="stylesheet" href="assets/css/style.css">
	</head>
	<body style="text-align:center">
		<div>
			<form action="form.do"  method="post" enctype="multipart/form-data">
				<div class="mt-10 mb-20">
					<input name="b_subject" type="text" placeholder="글제목을 입력해주세요"
					onfocus="this.placeholder = ''" onblur="this.placeholder = '글제목을 입력해주세요'" required
					class="single-input">
				</div>
				<div class="mt-10 mb-20">
					<input name="b_writer" type="text" placeholder="로그인회원 닉네임 자동입력 해결필요"
					onfocus="this.placeholder = ''" onblur="this.placeholder = '로그인회원 닉네임 자동입력 해결필요'" required
					class="single-input">
				</div>
				<div class="input-group-icon mt-10 mb-20">
					<div class="form-select" id="default-select" >
						<select name="b_catgo" style="display: none;" >
							<option value="기타">여행 테마를 골라주세요</option>
							<option value="가족여행">가족여행</option>
							<option value="혼자여행">혼자여행</option>
							<option value="커플여행">커플여행</option>
							<option value="우정여행">우정여행</option>
							<option value="패키지여행">패키지여행</option>
						</select>
					</div>
				</div>
				<div class="mt-10 mb-20">
					<input name='file' type='file' class="genric-btn default"><br/> <!-- Choose File -->
				</div>
				<div class="justify-content-center">
					<textarea  name="b_content" id="ir1" rows="20" style="width: 780px;">사진과 글을 원하는 위치에 이쁘게 꾸며주세요!<br/>사진은 우측 상단 버튼을 이용해서 넣어주세요!</textarea>
				</div>
				<div class="form-group mt-3">
	            	<input type="submit" class="btn btn-sm btn-primary" value="저장" >
		        </div>
			</form>
		</div>
		
			<!-- All JS Custom Plugins Link Here here -->
	        <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
			<!-- Jquery, Popper, Bootstrap -->
			<script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
	        <script src="./assets/js/popper.min.js"></script>
	        <script src="./assets/js/bootstrap.min.js"></script>
		    <!-- Jquery Mobile Menu -->
	        <script src="./assets/js/jquery.slicknav.min.js"></script>
	
			<!-- Jquery Slick , Owl-Carousel Plugins -->
	        <script src="./assets/js/owl.carousel.min.js"></script>
	        <script src="./assets/js/slick.min.js"></script>
			<!-- One Page, Animated-HeadLin -->
	        <script src="./assets/js/wow.min.js"></script>
			<script src="./assets/js/animated.headline.js"></script>
			<script src="./assets/js/jquery.magnific-popup.js"></script>
			
			<!-- Nice-select, sticky -->
	        <script src="./assets/js/jquery.nice-select.min.js"></script>
			<script src="./assets/js/jquery.sticky.js"></script>
	        
	        <!-- contact js -->
	        <script src="./assets/js/contact.js"></script>
	        <script src="./assets/js/jquery.form.js"></script>
	        <script src="./assets/js/jquery.validate.min.js"></script>
	        <script src="./assets/js/mail-script.js"></script>
	        <script src="./assets/js/jquery.ajaxchimp.min.js"></script>
	        
			<!-- Jquery Plugins, main Jquery -->	
	        <script src="./assets/js/plugins.js"></script>
			<script src="./assets/js/main.js"></script>
			
			<script type="text/javascript" src="./se2/js/HuskyEZCreator.js" charset="utf-8"></script>
			
			<script type="text/javascript">
				$(document).ready(function(){
					var oEditors = [];
					nhn.husky.EZCreator.createInIFrame({
						 oAppRef: oEditors,
						 elPlaceHolder: "ir1",
						 sSkinURI: "/se2/SmartEditor2Skin.html",
						 fCreator: "createSEditor2"
					});
					
					$(".btn").on("click", function() {
						oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
						var value = document.getElementById("ir1").value;
						console.log(value);
					});				
				});
				// 필수값 Check 
				function validation(){ 
					var contents = $.trim(oEditors[0].getContents()); 
					if(contents === '<p>&bnsp;</p>' || contents === ''){ // 기본적으로 아무것도 입력하지 않아도 값이 입력되어 있음. 
						alert("내용을 입력하세요."); 
						oEditors.getById['ir1'].exec('FOCUS');
						return false; 
					} 
					return true; 
				}
	
			</script>
			
			<script type="text/javascript">	
			function get_query(){
			    var url = document.location.href;
			    var qs = url.substring(url.indexOf('?') + 1).split('&');
			    for(var i = 0, result = {}; i < qs.length; i++){
			        qs[i] = qs[i].split('=');
			        result[qs[i][0]] = decodeURIComponent(qs[i][1]);
			    }
			    return result;
			}
		</script>
	</body>
</html>