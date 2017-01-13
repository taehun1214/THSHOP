<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>H-Shopper : 특별함을 전하는</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<!--[if ie]><meta content='IE=8' http-equiv='X-UA-Compatible'/><![endif]-->
		<!-- bootstrap -->
			<!-- <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
		<link href="<c:url value='/resources/bootstrap/css/bootstrap.min.css' />" rel="stylesheet" />     <!--  선생님 수정  --> 
		<link href="<c:url value='/resources/bootstrap/css/bootstrap-responsive.min.css' />" rel="stylesheet">
		
		<link href="<c:url value='/resources/themes/css/bootstrappage.css' />" rel="stylesheet"/>
		
		<!-- global styles -->
		<link href="<c:url value='/resources/themes/css/flexslider.css' />" rel="stylesheet"/>
		<link href="<c:url value='/resources/themes/css/main.css' />" rel="stylesheet"/>

		<!-- scripts -->
		<script src=<c:url value='/resources/themes/js/jquery-1.7.2.min.js'/> ></script>
		<script src=<c:url value='/resources/bootstrap/js/bootstrap.min.js'/> ></script>				
		<script src=<c:url value='/resources/themes/js/superfish.js'/> ></script>	
		<script src=<c:url value='/resources/themes/js/jquery.scrolltotop.js'/> ></script>
		<!--[if lt IE 9]>			
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->

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
							<li><a href="../buyer/buyermypage">My Page</a></li>
							<li><a href="../buyer/selectCart">Cart</a></li>
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
						<li><a href="../buyer/products?p_cate1=home_deco">Home / Deco</a>					
								<ul>
									<li><a href="../buyer/products?p_cate2=furniture">furniture</a></li>	<!-- 가구 -->									
									<li><a href="../buyer/products?p_cate2=pottery">pottery</a></li>		<!-- 도자기 -->		
									<li><a href="../buyer/products?p_cate2=lamp">lamp</a></li>			<!-- 조명 -->									
								</ul>
							</li>															
							<li><a href="../buyer/products?p_cate1=candle_diffuser">Candle / Diffuser</a>
								<ul>
									<li><a href="../buyer/products?p_cate2=candle">candle</a></li>			<!-- 양초 -->										
									<li><a href="../buyer/products?p_cate2=diffuser">diffuser</a></li>			<!-- 디퓨저 -->
									<li><a href="../buyer/products?p_cate2=aromatic oils">aromatic oils</a></li>	<!-- 아로마오일 -->									
								</ul>		
								</li>	
							<li><a href="../buyer/products?p_cate1=art_fancy">Art / Fancy</a>
								<ul>									
									<li><a href="../buyer/products?p_cate2=picture">picture</a></li>		<!-- 사진 -->
									<li><a href="../buyer/products?p_cate2=fancy">fancy</a></li>		<!-- 문구 -->
									<li><a href="../buyer/products?p_cate2=paper">paper</a></li>		<!-- 페이퍼 -->
								</ul>
							</li>							
							<li><a href="../buyer/products?p_cate1=jewellery">Jewellery</a>
								<ul>									
									<li><a href="../buyer/products?p_cate2=earring">earring</a></li>		<!-- 귀걸이 -->
									<li><a href="../buyer/products?p_cate2=necklace">necklace</a></li>		<!-- 목걸이 -->
									<li><a href="../buyer/products?p_cate2=ring">ring</a></li>			<!-- 반지 -->
								</ul>
							</li>
							<li><a href="../products">Event</a></li>
					</ul>
				</nav>
			</div>
		</section>
		<section class="header_text sub">
			<img class="pageBanner"
				src="<c:url value='/resources/themes/images/pageBanner.png' />"
				alt="New products">
			<h4>
				<span>Empty Cart</span>
			</h4>
		</section>
		<section class="main-content">
			<div class="row">
				<div class="span12">
					<div class="accordion" id="accordion2" style="text-align: center">
					
						<!-- -------------------------------------------------------------- -->
					
					
					
					
					
											<!-- ****** TODO ****** -->
											카트에 담긴 물건이 없네요..<br>
											<a href="/shop/buyer/main">메인페이지로</a>
														
						
						
						
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
					<!-- <p>Lorem Ipsum is simply dummy text of the printing and
						typesetting industry. the Lorem Ipsum has been the industry's
						standard dummy text ever since the you.</p> -->
					<br /> <span class="social_icons"> <a class="facebook"
						href="#">Facebook</a> <a class="twitter" href="#">Twitter</a> <a
						class="skype" href="#">Skype</a> <a class="vimeo" href="#">Vimeo</a>
					</span>
				</div>
			</div>
		</section>
		<section id="copyright">
			<span>Copyright 2016. Monday To Friday all rights reserved.</span>
		</section>
	</div>
	<!-- <script src="/shop01/resources/themes/js/common.js"/></script> -->
</body>
</html>