<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Odga.com
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="../assets/css/material-dashboard.css?v=2.1.0" rel="stylesheet" />
  <link href="../assets/css/profile.css" rel="stylesheet">
  <link href="../assets/css/myplan.css" rel="stylesheet">
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="../assets/demo/demo.css" rel="stylesheet" />
  <link href="../assets/css/pointColor.css" rel="stylesheet" />
  
  <link rel="stylesheet" media="all" href="assets/css/list.css" />
  <link rel="stylesheet" href="assets/css/detail.css" />
  
  
</head>
<style>
.swal-button--확인:not([disabled]):hover {
    background-color: #ff5235;
}
.swal-button--확인{
	background-color: #ff3d1c;
}
.swal-button--확인:hover{
	background-color: #ff5235;
}
.swal-button--삭제:not([disabled]):hover {
    background-color: #ff5235;
}
.swal-button--삭제{
	background-color: #ff3d1c;
}
.swal-button--삭제:hover{
	background-color: #ff5235;
}
.swal-button--cancel {
 color:#555 !important;
 background-color:#efefef
}
.swal-button--cancel:not([disabled]):hover {
 background-color:#e8e8e8
}
.swal-button--cancel:active {
 background-color:#d7d7d7
}
.swal-button--cancel:focus {
 box-shadow:0 0 0 1px #fff,0 0 0 3px rgba(116,136,150,.29)
}
</style>
<body class="dark-edition">
  <div class="wrapper ">
    <div class="sidebar" data-color="purple" data-background-color="black" data-image="../assets/img/sidebar-2.jpg">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

        Tip 2: you can also add an image using data-image tag
    -->
      <div class="logo"><a href="index.do" class="simple-text logo-normal">
         <img src="assets/img/logo/logo_b.png" alt="" style="max-width: 170px;">
        </a></div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <!-- <li class="nav-item  ">
            <a class="nav-link" href="./dashboard.html">
              <i class="material-icons">dashboard</i>
              <p>Dashboard</p>
            </a>
          </li> -->
          <li class="nav-item">
            <a class="nav-link" href="member.do">
              <i class="material-icons">person</i>
              <p>내 정보</p>
            </a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="member_plan.do?m_id=${LOGINUSER.m_id}">
              <i class="material-icons">content_paste</i>
              <p>나의 플래너</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="member_review.do?m_id=${LOGINUSER.m_id}">
              <i class="material-icons">library_books</i>
              <p>나의 여행후기</p>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./myLike.do">
              <i class="fa fa-heart"></i>
              <p>나의 좋아요</p>
            </a>
          </li>
          <!-- <li class="nav-item ">
            <a class="nav-link" href="./icons.html">
              <i class="material-icons">bubble_chart</i>
              <p>Icons</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="./map.html">
              <i class="material-icons">location_ons</i>
              <p>Maps</p>
            </a>
          </li> -->
          <li class="nav-item ">
            <a class="nav-link" href="leaveM">
              <i class="material-icons">notifications</i>
              <p>회원탈퇴</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="logout">             
              <p style="margin-left: 22%;color: lightpink;font-weight: bold;">로그아웃</p>
            </a>
          </li>
          <!-- <li class="nav-item active-pro ">
                <a class="nav-link" href="./upgrade.html">
                    <i class="material-icons">unarchive</i>
                    <p>Upgrade to PRO</p>
                </a>
            </li> -->
        </ul>
      </div>
    </div>
      <div class="box" style="overflow-y:auto;">
      <c:set value="${planDetail.planer}" var="planer" />
	  <c:set value="${planDetail.s_planer}" var="s_planer" />
	  <c:set value="${planDetail.touritems}" var="touritems" />
	  
	  		<div class="col-lg-12">
				<div class="count mb-35" style="text-align: center; margin-top:20px;">
					<h1 style="font-size: 350%;">${planer.p_title}</h1>
					<div class="buttons" style="margin-left:80%;">
						<button class="fill" onclick="update()">수정</button>
						<button class="fill" onclick="removeCheck(${planer.p_id},${planer.m_id})">삭제</button>
					</div>
				</div>
			</div>
			<div class="grid">
				<c:if test="${!empty s_planer}">
                   		<c:set var="i" value="0"/>
                   		<c:set var="k" value="1"/>	
                   			                       		                      			
                      	<c:forEach items="${s_planer}" var="s_planer" varStatus="status">
                      		<%-- <c:forEach var="i" begin="1" end="3" varStatus="status" >  --%>	 
                      			<c:set value="${s_planer.sp_day}" var="spDay"/>  
                      			<%-- <div><p> ${spDay} + ${i} </p></div> --%>
                      			
                      			<c:if test="${i ne spDay}">
                     						<c:set var="i" value="${i+1}"/> 
                     							
                     						<c:if test="${k ne i}">
	                     						</div>
	                     						<c:set var="k" value="${k+1}"/>
                     						</c:if>
                     						<h2 style="margin-bottom: 22px;color: snow; margin-top: 3%; display: inline-block;margin-left: 3%;font: italic bold 2.5em/1em Georgia, serif;">Day - ${i}</h2>                     							                       						
                       				        <div class="grid-wrap" style="display:flex; max-height: 327px;">    
                       				        
                       			</c:if>       				                     			                        			
                      			<c:if test="${i eq spDay}" >
                      			
                       			<c:forEach items="${touritems}" var="detail">	                       			
                       				<c:set value="${s_planer.contentid}" var="spCon"/>
                       				<c:set value="${detail.contentid}" var="detailCon"/>
                       				<c:if test="${detailCon eq spCon}" >                       					
                       					
									  	<!-- demo 1-->
										  <a class="list-block" href="listing_details.do?contentid=${detailCon}" style="box-shadow: 4px 4px 20px black;">
										    <figure style="margin: 0 auto;object-fit: cover; height: 100%;">
										    	<c:if test="${!empty detail.firstimage}">
										      		<img src="${detail.firstimage}" style="object-fit: cover;height: 100%;" alt="" />
										      		
										      	</c:if>
										      	<c:if test="${empty detail.firstimage}">
			                       					<div style="text-align: center;"><p style="text-decoration:line-through;">사진 없음</p></div>
			                       				</c:if>
										      <figcaption>
										        <h2>#${k} ${detail.title}</h2>
										        <p>여행지 주소 : ${detail.addr1}.</p>
										        
										      </figcaption>
										    </figure>
										  </a>
										  
                       				</c:if>
								</c:forEach>
								</c:if>	
								<c:if test="${status.last}">
									</div>
								</c:if>
								</c:forEach>
						<%-- </c:forEach> --%>
				</c:if>
			</div>
			<!-- <div class="grid-wrap">
			  demo 1
				  <a class="list-block" href="#">
				    <figure>
				      <img src="https://picsum.photos/500/350?random=1" alt="" />
				      <figcaption>
				        <h2>Thumbnail 01</h2>
				        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
				      </figcaption>
				    </figure>
				  </a>
				  <a class="list-block" href="#">
				    <figure>
				      <img src="https://picsum.photos/500/350?random=2" alt="" />
				      <figcaption>
				        <h2>Thumbnail 02</h2>
				        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
				      </figcaption>
				    </figure>
				  </a>
				  <a class="list-block" href="#">
				    <figure>
				      <img src="https://picsum.photos/500/350?random=3" alt="" />
				      <figcaption>
				        <h2>Thumbnail 03</h2>
				        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
				      </figcaption>
				    </figure>
				  </a>
			  </div> -->
      </div>       
      <footer class="footer">
        <div class="container-fluid">
          <nav class="float-left">
            <ul>
              <!-- <li>
                <a href="https://www.creative-tim.com">
                  Creative Tim
                </a>
              </li>
              <li>
                <a href="https://creative-tim.com/presentation">
                  About Us
                </a>
              </li>
              <li>
                <a href="http://blog.creative-tim.com">
                  Blog
                </a>
              </li>
              <li>
                <a href="https://www.creative-tim.com/license">
                  Licenses
                </a>
              </li> -->
            </ul>
          </nav>
          <div class="copyright float-right" id="date">
            copyright <i class="material-icons">favorite</i> by
            <a href="" target="_blank">ODGA</a>
          </div>
        </div>
      </footer>
      <script>
        const x = new Date().getFullYear();
        let date = document.getElementById('date');
        date.innerHTML = '&copy; ' + x + date.innerHTML;
      </script>
    </div>
  <!-- </div> -->
  <div class="fixed-plugin">
    <div class="dropdown show-dropdown">
      <a href="#" data-toggle="dropdown">
        <i class="fa fa-cog fa-2x"> </i>
      </a>
      <ul class="dropdown-menu">
        <li class="header-title"> Sidebar Filters</li>
        <li class="adjustments-line">
          <a href="javascript:void(0)" class="switch-trigger active-color">
            <div class="badge-colors ml-auto mr-auto">
              <span class="badge filter badge-purple active" data-color="purple"></span>
              <span class="badge filter badge-azure" data-color="azure"></span>
              <span class="badge filter badge-green" data-color="green"></span>
              <span class="badge filter badge-warning" data-color="orange"></span>
              <span class="badge filter badge-danger" data-color="danger"></span>
            </div>
            <div class="clearfix"></div>
          </a>
        </li>
        <li class="header-title">Images</li>
        <li>
          <a class="img-holder switch-trigger" href="javascript:void(0)">
            <img src="../assets/img/sidebar-1.jpg" alt="">
          </a>
        </li>
        <li class="active">
          <a class="img-holder switch-trigger" href="javascript:void(0)">
            <img src="../assets/img/sidebar-2.jpg" alt="">
          </a>
        </li>
        <li>
          <a class="img-holder switch-trigger" href="javascript:void(0)">
            <img src="../assets/img/sidebar-3.jpg" alt="">
          </a>
        </li>
        <li>
          <a class="img-holder switch-trigger" href="javascript:void(0)">
            <img src="../assets/img/sidebar-4.jpg" alt="">
          </a>
        </li>
        <li class="button-container">
          <a href="https://www.creative-tim.com/product/material-dashboard-dark" target="_blank" class="btn btn-primary btn-block">Free Download</a>
        </li>
        <!-- <li class="header-title">Want more components?</li>
            <li class="button-container">
                <a href="https://www.creative-tim.com/product/material-dashboard-pro" target="_blank" class="btn btn-warning btn-block">
                  Get the pro version
                </a>
            </li> -->
        <li class="button-container">
          <a href="https://demos.creative-tim.com/material-dashboard-dark/docs/2.0/getting-started/introduction.html" target="_blank" class="btn btn-default btn-block">
            View Documentation
          </a>
        </li>
        <li class="button-container github-star">
          <a class="github-button" href="https://github.com/creativetimofficial/material-dashboard/tree/dark-edition" data-icon="octicon-star" data-size="large" data-show-count="true" aria-label="Star ntkme/github-buttons on GitHub">Star</a>
        </li>
        <li class="header-title">Thank you for 95 shares!</li>
        <li class="button-container text-center">
          <button id="twitter" class="btn btn-round btn-twitter"><i class="fa fa-twitter"></i> &middot; 45</button>
          <button id="facebook" class="btn btn-round btn-facebook"><i class="fa fa-facebook-f"></i> &middot; 50</button>
          <br>
          <br>
        </li>
      </ul>
    </div>
  </div>
  <!--   Core JS Files   -->
  <script src="../assets/js/core/jquery.min.js"></script>
  <script src="../assets/js/core/popper.min.js"></script>
  <script src="../assets/js/core/bootstrap-material-design.min.js"></script>
  <script src="https://unpkg.com/default-passive-events"></script>
  <script src="../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!-- Place this tag in your head or just before your close body tag. -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chartist JS -->
  <script src="../assets/js/plugins/chartist.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="../assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="../assets/js/material-dashboard.js?v=2.1.0"></script>
  <!-- Material Dashboard DEMO methods, don't include it in your project! -->
  <script src="../assets/demo/demo.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script>
  function removeCheck(p_id,m_id){
	  swal({
			text: "해당 글을 삭제 하시겠습니까 ?",
			buttons:{"삭제":true,cancel:"취소"},
			}).then((value) => {
				if(value){
					 swal({
							text: "삭제가 완료 되었습니다.",
							buttons:{"확인":true},
							}).then((value) => {
								if(value){
									location.href="delPlan?p_id="+p_id+"&m_id="+m_id;
								}
							});				
				}
			});
	  
  }
/*   function removeCheck() {
	  if (confirm("정말 삭제하시겠습니까??") == true){    //확인
	     location.href="delPlan?p_id=${planer.p_id}&m_id=${planer.m_id}";
	  }else{   //취소
	     return false;
	  }
  } */
  function update(){
	  location.href="updateplan?p_id=${planer.p_id}&m_id=${planer.m_id}";
  }
  </script>
</body>
 
 

</html>