<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
  <meta charset="utf-8" />
  <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
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
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="../assets/demo/demo.css" rel="stylesheet" />
  <link href="../assets/css/pointColor.css" rel="stylesheet" />
  <link rel="stylesheet" media="all" href="assets/css/list.css" />
  
</head>

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
            <a class="nav-link" href="myLike.do?m_id=${LOGINUSER.m_id}">
              <i class="fa fa-heart"></i>
              <p>나의 좋아요</p>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./support_mlist.do?m_id=${LOGINUSER.m_id}">
              <i class="material-icons">tables</i>
              <p>나의 문의내역</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="leaveM">
              <i class="material-icons">notifications</i>
              <p>회원탈퇴</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="logout">             
              <p style="margin-left: 22%;color: snow;font-weight: bold;">로그아웃</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <div class="main-panel">
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top " id="navigation-example">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <a class="navbar-brand" href="javascript:void(0)"><i class="material-icons">content_paste</i>  나의 플래너</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation" data-target="#navigation-example">
            <span class="sr-only">Toggle navigation</span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
          </button>          
        </div>
      </nav>
      <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-11">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title">나의 플래너</h4>
                  <p class="card-category">당신의 플래너를 확인하세요!</p>
                </div>
                <div class="card-body">
	                  <div class="card-container">	
	                       	<c:if test="${!empty myPlans}">	
	                      			<c:forEach items="${myPlans}" var="plan">	
	                      				<c:if test="${!empty plan.p_title}">		
										<a class="card-item" href="#">
										  <div class="card" onclick="location.href='plan_detail.do?m_id=${plan.m_id}&p_id=${plan.p_id}';">
										    <div class="side front">
												<div class="img" style='background-image:url(/assets/img/myPlanImg/${plan.randomImg});'></div>   
												<div class="info">
													<h2 class="title">${plan.p_title}</h2>
													<p class="author">${plan.p_msize}</p>
													<p class="content">${plan.p_concept}</p>
												</div>
										    </div>
										  </div>
										</a>
									</c:if>
								</c:forEach>	
							</c:if>
							<c:if test="${empty myPlans}">	
								<div>
									<h3>등록한 플랜이 없습니다.</h3>
								</div>
							</c:if>
					</div>
                </div>
              </div>
            </div>          
          </div>
        </div>
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
  </div>
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
  <script type="text/javascript">
	$(document).ready(function(){
		if(${empty LOGINUSER}){
			swal({
				title: "세션만료 !",
				text: "로그인 후 이용 가능합니다.",
				buttons:{"로그인":"로그인","홈으로":"홈으로"},
				}).then((value) => {
					if(value==="로그인"){
						location.href = "login.do";
					}else if (value==="홈으로"){
						location.href = "index.do";
					}
				});
			}
	});
</script>
</body>

</html>