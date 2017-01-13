<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Bootstrap E-commerce Templates</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<!--[if ie]><meta content='IE=8' http-equiv='X-UA-Compatible'/><![endif]-->
<!-- bootstrap -->
<link
	href="<c:url value='/resources/bootstrap/css/bootstrap.min.css' />"
	rel="stylesheet">
	
<link
	href="<c:url value='/resources/bootstrap/css/bootstrap-responsive.min.css' />"
	rel="stylesheet">
<link href="<c:url value='/resources/themes/css/bootstrappage.css' />"
	rel="stylesheet" />

<!-- global styles -->
<link href="<c:url value='/resources/themes/css/flexslider.css' />"
	rel="stylesheet" />
<link href="<c:url value='/resources/themes/css/main.css' />"
	rel="stylesheet" />

<!-- scripts -->
<script src="<c:url value='/resources/themes/js/jquery-1.7.2.min.js' />"></script>
<script src="<c:url value='/resources/bootstrap/js/bootstrap.min.js' />"></script>
<script src="<c:url value='/resources/themes/js/superfish.js' />"></script>
<script src="<c:url value='/resources/themes/js/jquery.scrolltotop.js' />"></script>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>


</head><!-- -------------------------------------------------------------- -->


<body>

	<div id="top-bar" class="container">
		<div class="row">
			<div class="span4">
				<form method="POST" class="search_form">
					<input type="text" class="input-block-level search-query"
						Placeholder="eg. T-sirt">
				</form>
			</div>
			<div class="span8">
				<div class="account pull-right">
					<ul class="user-menu">
						 <!-- 김태훈 코드 시작, 로그인한 사용자별 상단 메뉴 정렬--><!-- TODO: 마이페이지, 장바구니 링크 걸고, 인터셉터 걸어야함 -->
							<!-- ---------------visitor 입장----------------------------- -->
							<c:if test="${empty s_login_id && empty b_login_id }">
							<li><a href="">My Page</a></li>
							<li><a href="cart/selectCart">Cart</a></li>
							</c:if>
							<!-- ------------바이어 입장 시작-------------------------- -->
							<c:if test="${not empty b_login_id }">
							<li><a href="">My Page</a></li>	
							<li><a href="../cart/selectCart">Cart</a></li>
							</c:if>
							<!-- ------------------셀러 입장시작------------------------------- -->
							<c:if test="${not empty s_login_id and s_login_id ne 'admin'}">
							<li><a href="">My Page</a></li>
							<li><a href="sellerHome?s_id=${s_login_id}">My Home</a></li><!-- 마이홈은 판매자홈 말하는거임 -->
							</c:if>
							<!-- ----------------어드민 입장 시작--------------------------------------->	
							<c:if test="${s_login_id eq 'admin'}">
							<li><a href="">My Page</a></li>
							</c:if>
							<c:if test="${empty s_login_id && empty b_login_id }">
								<c:url value="login" var="login" />
								<li><a href="${login}">Login</a></li>	
							</c:if>
							<c:if test="${not empty s_login_id || not empty b_login_id }">
								<!-- 세션에 로그인 정보가 있는 경우 -->
								<c:url value="../logout" var="logout" />
								<li><a href="${logout }">Logout</a></li>		
							</c:if>
<!-- 김태훈 코드 끝 -------------------------------------------------------------------> 			
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="wrapper" class="container">
		<section class="navbar main-menu">
			<div class="navbar-inner main-menu">
				<a href="index.html" class="logo pull-left">
				<img src="<c:url value='/resources/themes/images/logo.png' />"
					class="site_logo" alt=""></a>
				<nav id="menu" class="pull-right">
					<ul>
						<li><a href="./products.html">Woman</a>
							<ul>
								<li><a href="./products.html">Lacinia nibh</a></li>
								<li><a href="./products.html">Eget molestie</a></li>
								<li><a href="./products.html">Varius purus</a></li>
							</ul></li>
						<li><a href="./products.html">Man</a></li>
						<li><a href="./products.html">Sport</a>
							<ul>
								<li><a href="./products.html">Gifts and Tech</a></li>
								<li><a href="./products.html">Ties and Hats</a></li>
								<li><a href="./products.html">Cold Weather</a></li>
							</ul></li>
						<li><a href="./products.html">Hangbag</a></li>
						<li><a href="./products.html">Best Seller</a></li>
						<li><a href="./products.html">Top Seller</a></li>
					</ul>
				</nav>
			</div>
		</section>
		<section class="header_text sub">
			<img class="pageBanner"
				src="<c:url value='/resources/themes/images/pageBanner.png' />"
				alt="New products">
			<h4>
				<span>주문 완료</span>
			</h4>
		</section>
		<section class="main-content">
		<div style="text-align: center">
									
													주문번호 : ${buyNO} <br> <br>
											주문상태 : 입금대기중<br>
											<a href="../buyer/main">메인으로 가기</a>
											</div>
			<div class="row">
				<div class="span12">
					<div class="accordion" id="accordion2">
					
						<!-- -------------------------------------------------------------- -->



						<!-- -------------------------------------------------------------- -->
									
					</div><!-- #### -->
				</div>
			</div>
		</section>
		<section id="footer-bar">
			<div class="row">
				<div class="span3">
					<h4>Navigation</h4>
					<ul class="nav">
						<li><a href="./index.html">Homepage</a></li>
						<li><a href="./about.html">About Us</a></li>
						<li><a href="./contact.html">Contac Us</a></li>
						<li><a href="./cart.html">Your Cart</a></li>
						<li><a href="./register.html">Login</a></li>
					</ul>
				</div>
				<div class="span4">
					<h4>My Account</h4>
					<ul class="nav">
						<li><a href="#">My Account</a></li>
						<li><a href="#">Order History</a></li>
						<li><a href="#">Wish List</a></li>
						<li><a href="#">Newsletter</a></li>
					</ul>
				</div>
				<div class="span5">
					<p class="logo">
						<img src="<c:url value='/resources/themes/images/logo.png' />"
							class="site_logo" alt="">
					</p>
					<p>Lorem Ipsum is simply dummy text of the printing and
						typesetting industry. the Lorem Ipsum has been the industry's
						standard dummy text ever since the you.</p>
					<br /> <span class="social_icons"> <a class="facebook"
						href="#">Facebook</a> <a class="twitter" href="#">Twitter</a> <a
						class="skype" href="#">Skype</a> <a class="vimeo" href="#">Vimeo</a>
					</span>
				</div>
			</div>
		</section>
		<section id="copyright">
			<span>December 2016 Web Project All right.</span>
		</section>
	</div>
	<a href="javascript:window.location.replace('buyer/readyForBill');"></a>
	<!-- <script src="/shop01/resources/themes/js/common.js"/></script> -->
	<script type="text/javascript">
	$(docuemnt).ready(function(){
		document.location.replace("../");
	})
	</script>
</body>
</html>