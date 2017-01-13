<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<style>

</style>
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
	</head>
    <body>		
		<div id="top-bar" class="container">
			<div class="row">
				<div class="span4">
					<form method="POST" class="search_form" action="search_form">
						<input type="text" class="input-block-level search-query" Placeholder="eg. T-sirt" name="searching">
					</form>
				</div>
				<div class="span8">
					<div class="account pull-right">
						<ul class="user-menu">				

 <!-- 김태훈 코드 시작, 로그인한 사용자별 상단 메뉴 정렬--><!-- TODO: 마이페이지, 장바구니 링크 걸고, 인터셉터 걸어야함 -->
							<!-- ---------------visitor 입장----------------------------- -->
							<c:if test="${empty s_login_id && empty b_login_id }">
							<li><a href="buyer/buyermypage">My Page</a></li>
							<li><a href="buyer/selectCart">Cart</a></li>
							</c:if>
							<!-- ------------바이어 입장 시작-------------------------- -->
							<c:if test="${not empty b_login_id }">
							<li><a href="../buyer/buyermypage">My Page</a></li>	
							<li><a href="../buyer/selectCart">Cart</a></li>
							</c:if>
							<!-- ------------------셀러 입장시작------------------------------- -->
							<c:if test="${not empty s_login_id and s_login_id ne 'admin'}">
							<li><a href="../seller/sellermypage">My Page</a></li>
							<li><a href="sellerHome?s_id=${s_login_id}">My Home</a></li><!-- 마이홈은 판매자홈 말하는거임 -->
							</c:if>
							<!-- ----------------어드민 입장 시작--------------------------------------->	
							<c:if test="${s_login_id eq 'admin'}">
							<li><a href="../admin/admin_mypage">My Page</a></li>
							</c:if>
							<c:if test="${empty s_login_id && empty b_login_id }">
								<c:url value="login" var="login" />
								<li><a href="${login}">Login</a></li>	
							</c:if>
							<c:if test="${not empty s_login_id || not empty b_login_id }">
								<!-- 세션에 로그인 정보가 있는 경우 -->
								<c:url value="logout" var="logout" />
								<li><a href="${logout }">Logout</a></li>		
							</c:if>
<!-- 김태훈 코드 끝 -------------------------------------------------------------------> 	
	
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="wrapper" class="container">
	<div class="navbar-inner main-menu">				
					<!-- 방문객 입장 -->
					<c:if test="${empty s_login_id && empty b_login_id }">

					<a href="./" class="logo pull-left"><img src=<c:url value='/resources/themes/images/logo.png' /> class="site_logo" alt=""></a>
					</c:if>

					<c:if test="${not empty b_login_id }">
					<a href="main" class="logo pull-left"><img src=<c:url value='/resources/themes/images/logo.png' /> class="site_logo" alt=""></a>
					</c:if>
					<c:if test="${not empty s_login_id and s_login_id ne 'admin'}">
					<a href="main" class="logo pull-left"><img src=<c:url value='/resources/themes/images/logo.png' /> class="site_logo" alt=""></a>
					</c:if>
					<c:if test="${s_login_id eq 'admin'}">
					<a href="main" class="logo pull-left"><img src=<c:url value='/resources/themes/images/logo.png' /> class="site_logo" alt=""></a>
					</c:if>
					
					<!-- 셀러 입장 -->
					<c:if test="${not empty s_login_id and s_login_id ne 'admin'}">
					<a href="../seller/main" class="logo pull-left"><img src=<c:url value='/resources/themes/images/logo.png' /> class="site_logo" alt=""></a>
					</c:if>
					<!-- 바이어 입장 -->
					<c:if test="${not empty b_login_id }">
					<a href="../buyer/main" class="logo pull-left"><img src=<c:url value='/resources/themes/images/logo.png' /> class="site_logo" alt=""></a>
					</c:if>

					<nav id="menu" class="pull-right">
						<ul>
							<li><a href="./products?p_cate1=home_deco">Home / Deco</a>					
								<ul>
									<li><a href="./products?p_cate2=furniture">furniture</a></li>	<!-- 가구 -->									
									<li><a href="./products?p_cate2=pottery">pottery</a></li>		<!-- 도자기 -->		
									<li><a href="./products?p_cate2=lamp">lamp</a></li>			<!-- 조명 -->									
								</ul>
							</li>															
							<li><a href="./products?p_cate1=candle_diffuser">Candle / Diffuser</a>
								<ul>
									<li><a href="./products?p_cate2=candle">candle</a></li>			<!-- 양초 -->										
									<li><a href="./products?p_cate2=diffuser">diffuser</a></li>			<!-- 디퓨저 -->
									<li><a href="./products?p_cate2=aromatic oils">aromatic oils</a></li>	<!-- 아로마오일 -->									
								</ul>		
								</li>	
							<li><a href="./products?p_cate1=art_fancy">Art / Fancy</a>
								<ul>									
									<li><a href="./products?p_cate2=picture">picture</a></li>		<!-- 사진 -->
									<li><a href="./products?p_cate2=fancy">fancy</a></li>		<!-- 문구 -->
									<li><a href="./products?p_cate2=paper">paper</a></li>		<!-- 페이퍼 -->
								</ul>
							</li>							
							<li><a href="./products?p_cate1=jewellery">Jewellery</a>
								<ul>									
									<li><a href="./products?p_cate2=earring">earring</a></li>		<!-- 귀걸이 -->
									<li><a href="./products?p_cate2=necklace">necklace</a></li>		<!-- 목걸이 -->
									<li><a href="./products?p_cate2=ring">ring</a></li>			<!-- 반지 -->
								</ul>
							</li>
							<li><a href="./products">Event</a></li>
						</ul>
					</nav>
				</div>
			</section>
			<section  class="homepage-slider" id="home-slider">
				<div class="flexslider">
					<ul class="slides">
						<li>
							<!-- <img src=<c:url value='/resources/themes/images/carousel/banner-1.jpg'/> alt="" /> -->
							<img src="http://image.thefingers.co.kr/main/201612/999/999_18853.jpg" alt="" /><!-- 메인 광고 -->
						</li>
						<li>
							<!-- <img src=<c:url value='/resources/themes/images/carousel/banner-2.jpg'/> alt="" /> -->
							<img src="http://image.thefingers.co.kr/main/201612/999/999_18856.jpg" alt="" />
							<!-- <div class="intro">
								<h1>Mid season sale</h1>
								<p><span>Up to 50% Off</span></p>
								<p><span>On selected items online and in stores</span></p>
							</div> -->
						</li>
						<li>
							<!-- <img src=<c:url value='/resources/themes/images/carousel/banner-2.jpg'/> alt="" /> -->
							<img src="http://image.thefingers.co.kr/main/201612/999/999_18852.jpg" alt="" />
							<!-- <div class="intro">
								<h1>Mid season sale</h1>
								<p><span>Up to 50% Off</span></p>
								<p><span>On selected items online and in stores</span></p>
							</div> -->
						</li>
					</ul>
				</div>			
			</section>
			<section class="header_text">
				<!-- We stand for top quality templates. Our genuine developers always optimized bootstrap commercial templates. 
				<br/>Don't miss to use our cheap abd best bootstrap templates. -->
			</section>
			<section class="main-content">
				<div class="row">
					<div class="span12">
																		
						<div class="row">
							<div class="span12">
								<h4 class="title">
									<span class="pull-left"><span class="text"><span class="line">New <strong>Products</strong></span></span></span>
									<span class="pull-right">
										<a class="left button" href="#myCarousel" data-slide="prev"></a><a class="right button" href="#myCarousel" data-slide="next"></a>
									</span>
								</h4>
								
								
								<!-- /////////////////////////////////////////////////////////////////////////////////////// -->
								
								<!-- 1번째 리스트 라인 -->
								<div id="myCarousel" class="myCarousel carousel slide">
									<div class="carousel-inner">
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->	
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
		
								
				 <!-- ** 마지막 페이지 다음에 오는 페이지는 다시 첫번째 페이지 ** -->			
					 
				<!-- 첫번째 페이지 -->
				<div class="active item">		
					<ul class="thumbnails">	
						<c:forEach begin="0" end="0" var="page">
						<c:forEach begin="0" end="3" varStatus="status" items="${productList }"><!-- 1번째 // 4 개씩 출력 -->
								<li class="span3">
								<div class="product-box">
									<span class="sale_tag"><%--  #index : ${4 * page + status.index} --%> </span>
										<p><a href="pDetail?p_no=${productList[4 * page + status.index].p_no }"><img src="${productList[4 * page + status.index].p_img }" /></a></p>
										<a href="pDetail?p_no=${productList[4 * page + status.index].p_no }" class="title">${productList[4 * page + status.index].p_name }</a><br>
										<a href="pDetail?p_no=${productList[4 * page + status.index].p_no }" class="category">${productList[4 * page + status.index].p_cate1}</a><!-- 카테고리 -->
										<%-- <p class="price">₩ ${productList[4 * page + status.index].p_price }</p>	  --%>
										<p class="price"><fmt:formatNumber value="${productList[4 * page + status.index].p_price}" groupingUsed="true"/> 원</p>	
									</div>
								</li>
						</c:forEach>
						</c:forEach> 
					</ul>
				</div>
	
	
	
				<c:if test="${numOfPage >= 2}">
				<!-- 두번째 페이지 이상 ~ -->
				
					<c:if test="${numOfPage >= 3}">
					<%-- <c:forEach begin="1" end="${numOfPage-1 }" var="page"> --%>
						<c:forEach begin="1" end="${numOfPage-2 }" var="page">
						<div class="item">		
							<ul class="thumbnails">	
								<%-- <c:forEach begin="0" end="4" var="i"> --%>
									<%-- ${productList.list[4 * page + i] } --%>
								<c:forEach begin="0" end="3" varStatus="status" items="${productList }"><!-- 2번째 // 4 개씩 출력 -->
									<li class="span3">
									<div class="product-box">
										<span class="sale_tag"><%--  #index : ${4 * page + status.index} --%> </span>
											<p><a href="pDetail?p_no=${productList[4 * page + status.index].p_no }"><img src="${productList[4 * page + status.index].p_img }" /></a></p>
											<a href="pDetail?p_no=${productList[4 * page + status.index].p_no }" class="title">${productList[4 * page + status.index].p_name }</a><br>
											<a href="pDetail?p_no=${productList[4 * page + status.index].p_no }" class="category">${productList[4 * page + status.index].p_cate1}</a><!-- 카테고리 -->
											<p class="price"><fmt:formatNumber value="${productList[4 * page + status.index].p_price}" groupingUsed="true"/> 원</p> 
											
									</div>
									</li>
								</c:forEach>
								
								</ul>
							</div>
						</c:forEach>
					</c:if>
					
					
				<!-- 마지막 페이지 -->
					<c:if test="${remainder != 0}">
						<c:forEach begin="${numOfPage-1}" end="${numOfPage-1}" var="page">
							<div class="item">		
								<ul class="thumbnails">	
									<%-- <c:forEach begin="0" end="4" var="i"> --%>
										<%-- ${productList.list[4 * page + i] } --%>
									<c:forEach begin="0" end="${remainder-1}" varStatus="status" items="${productList }"><!-- 3번째 // 4 개씩 출력 -->
										<li class="span3">
										<div class="product-box">
											<span class="sale_tag"><%--  #index : ${4 * page + status.index} --%> </span>
												<p><a href="pDetail?p_no=${productList[4 * page + status.index].p_no }"><img src="${productList[4 * page + status.index].p_img }" /></a></p>
												<a href="pDetail?p_no=${productList[4 * page + status.index].p_no }" class="title">${productList[4 * page + status.index].p_name }</a><br>
												<a href="pDetail?p_no=${productList[4 * page + status.index].p_no }" class="category">${productList[4 * page + status.index].p_cate1}</a><!-- 카테고리 -->
												<p class="price"><fmt:formatNumber value="${productList[4 * page + status.index].p_price}" groupingUsed="true"/> 원</p> 
												
											</div>
										</li>
									</c:forEach>
									
								</ul>
							</div>
						</c:forEach> 
					</c:if>
					<c:if test="${remainder == 0}">
						<c:forEach begin="${numOfPage-1}" end="${numOfPage-1}" var="page">
							<div class="item">		
								<ul class="thumbnails">	
									<%-- <c:forEach begin="0" end="4" var="i"> --%>
										<%-- ${productList.list[4 * page + i] } --%>
									<c:forEach begin="0" end="3" varStatus="status" items="${productList }"><!-- 3번째 // 4 개씩 출력 -->
										<li class="span3">
										<div class="product-box">
											<span class="sale_tag"><%--  #index : ${4 * page + status.index} --%> </span>
												<p><a href="pDetail?p_no=${productList[4 * page + status.index].p_no }"><img src="${productList[4 * page + status.index].p_img }" /></a></p>
												<a href="pDetail?p_no=${productList[4 * page + status.index].p_no }" class="title">${productList[4 * page + status.index].p_name }</a><br>
												<a href="pDetail?p_no=${productList[4 * page + status.index].p_no }" class="category">${productList[4 * page + status.index].p_cate1}</a><!-- 카테고리 -->
												<p class="price"><fmt:formatNumber value="${productList[4 * page + status.index].p_price}" groupingUsed="true"/> 원</p> 
												
											</div>
										</li>
									</c:forEach>
									
								</ul>
							</div>
						</c:forEach> 
					</c:if>
				
				</c:if>
				
		
										
	<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->		
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->


										

										
									</div>							
								</div>
							</div>						
						</div>
						
						<br/>
						<div class="row">
							<div class="span12">
								<h4 class="title">
									<span class="pull-left"><span class="text"><span class="line">Event <strong>Products</strong></span> <span style="font-size:10px">not available now</span></span></span>
									<span class="pull-right">
										<a class="left button" href="#myCarousel-2" data-slide="prev"></a><a class="right button" href="#myCarousel-2" data-slide="next"></a>
									</span>
								</h4>
								
								
								<!-- /////////////////////////////////////////////////////////////////////////////////////// -->
								
								<!-- 2번째 리스트 라인 -->
								<div id="myCarousel-2" class="myCarousel carousel slide">
									<div class="carousel-inner">
									
										<!-- 1페이지 --><!--  TODO : 나중에 할인률 적용되는 상품들을 로직으로 불러오는 것으로 대체 -->
										<div class="active item">
											<ul class="thumbnails">		
																					
												<li class="span3">
													<div class="product-box">
														<span class="sale_tag"></span>
														<p><a href="#"><img src="http://image.thefingers.co.kr/diyitem/webimage/list120/00/C000008255.jpg"/></a></p>
														<a href="product_detail.html" class="title">드라이플라워박스</a><br/>
														<a href="products.html" class="category">SANSANGGOT</a>
														<p class="price">34,900 원</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="#"><img src="http://image.thefingers.co.kr/diyitem/webimage/list120/00/C000008243.jpg"/></a></p>
														<a href="product_detail.html" class="title">크리스마스 양말</a><br/>
														<a href="products.html" class="category">Mellow</a>
														<p class="price">18,000 원</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="#"><img src="http://image.thefingers.co.kr/diyitem/webimage/list120/00/C000008063.jpg"/></a></p>
														<a href="product_detail.html" class="title">해피홀리데이카드</a><br/>
														<a href="products.html" class="category">BASRAK</a>
														<p class="price">9,000 원</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="#"><img src="http://image.thefingers.co.kr/diyitem/webimage/list120/00/C000008040.jpg"/></a></p>
														<a href="product_detail.html" class="title">홀리데이 밍크 드롭 귀걸이</a><br/>
														<a href="products.html" class="category">Sara and Rosa</a>
														<p class="price">15,900 원</p>
													</div>
												</li>
												
											</ul>
										</div>
										
										<!-- 2페이지 -->
										<div class="item">
											<ul class="thumbnails">
												<li class="span3">
													<div class="product-box">
														<span class="sale_tag"></span>
														<p><a href="#"><img src="http://image.thefingers.co.kr/diyitem/webimage/list120/00/C000008255.jpg"/></a></p>
														<a href="product_detail.html" class="title">크리스마스 드라이플라워박스</a><br/>
														<a href="products.html" class="category">SANSANGGOT</a>
														<p class="price">34,900 원</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="#"><img src="http://image.thefingers.co.kr/diyitem/webimage/list120/00/C000008243.jpg"/></a></p>
														<a href="product_detail.html" class="title">크리스마스 양말</a><br/>
														<a href="products.html" class="category">Mellow</a>
														<p class="price">18,000 원</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="#"><img src="http://image.thefingers.co.kr/diyitem/webimage/list120/00/C000008063.jpg"/></a></p>
														<a href="product_detail.html" class="title">해피홀리데이카드</a><br/>
														<a href="products.html" class="category">BASRAK</a>
														<p class="price">9,000 원</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="#"><img src="http://image.thefingers.co.kr/diyitem/webimage/list120/00/C000008040.jpg"/></a></p>
														<a href="product_detail.html" class="title">홀리데이 밍크 드롭 귀걸이 (2colors)</a><br/>
														<a href="products.html" class="category">Sara and Rosa</a>
														<p class="price">15,900 원</p>
													</div>
												</li>																																
											</ul>
										</div>
									</div>							
								</div>
							</div>						
						</div>
						<div class="row feature_box">						
							<div class="span4">
								<div class="service">
									<div class="responsive">	
										<img src=<c:url value='/resources/themes/images/feature_img_2.png'/> alt="" />
										<h4>SPECIAL <strong>DESIGN</strong></h4>
										<!-- <p>Lorem Ipsum is simply dummy text of the printing and printing industry unknown printer.</p> -->									
									</div>
								</div>
							</div>
							<div class="span4">	
								<div class="service">
									<div class="customize">			
										<img src=<c:url value='/resources/themes/images/feature_img_1.png'/> alt="" />
										<h4>FREE <strong>SHIPPING</strong></h4>
										<!-- <p>Lorem Ipsum is simply dummy text of the printing and printing industry unknown printer.</p> -->
									</div>
								</div>
							</div>
							<div class="span4">
								<div class="service">
									<div class="support">	
										<img src=<c:url value='/resources/themes/images/feature_img_3.png'/> alt="" />
										<h4>24/7 LIVE <strong>SUPPORT</strong></h4>
										<!-- <p>Lorem Ipsum is simply dummy text of the printing and printing industry unknown printer.</p> -->
									</div>
								</div>
							</div>	
						</div>		
					</div>				
				</div>
			</section>
			<section class="our_client">
				<h4 class="title"><span class="text">Cooperator</span></h4>
				<div class="row">					
					<div class="span2">
						<a href="./sellerHome?s_id=s1"><img  onMouseOver="this.style.opacity='.6'; this.style.filter='alpha(opacity=60)'" onMouseOut="this.style.opacity='1.0'; this.style.filter='alpha(opacity=100)'" alt="" src=<c:url value='/resources/themes/images/clients/co1.png'/>></a>
					</div>
					<div class="span2">
						<a href="#"><img onMouseOver="this.style.opacity='.6'; this.style.filter='alpha(opacity=60)'" onMouseOut="this.style.opacity='1.0'; this.style.filter='alpha(opacity=100)'" src=<c:url value='/resources/themes/images/clients/co2.png'/>></a>
					</div>
					<div class="span2">
						<a href="#"><img alt="" src=<c:url value='/resources/themes/images/clients/co3.png'/>></a>
					</div>
					<div class="span2">
						<a href="#"><img alt="" src=<c:url value='/resources/themes/images/clients/co4.png'/>></a>
					</div>
					<div class="span2">
						<a href="#"><img alt="" src=<c:url value='/resources/themes/images/clients/co5.png'/>></a>
					</div>
					<div class="span2">
						<a href="#"><img alt="" src=<c:url value='/resources/themes/images/clients/co6.png'/>></a>
					</div>
				</div>
			</section>
			<section id="footer-bar">
				<div class="row">
					<div class="span3">
						<h4>Navigation</h4>
						<ul class="nav">
							<li><a href="#">Homepage</a></li>  
							<li><a href="#">About Us</a></li>
							<li><a href="#">Contac Us</a></li>
							<li><a href="#">Your Cart</a></li>
						<!-- ------------------------------------------------------  -->	
							<li><a href="#">Login.</a></li>							
						<!-- ------------------------------------------------------  -->
						</ul>					
					</div>
					<div class="span4">
						<h4>My Account</h4>
						<ul class="nav">
							<li><a href="#">My Account</a></li>
							<li><a href="#">Order History</a></li>
							<li><a href="#">Wish List</a></li>
							<li><a href="#">Newsletter</a></li>
							<li><a href="seller/pRegister">pRegister</a></li>
						</ul>
					</div>
					<div class="span5">
						<p class="logo"><img src=<c:url value='/resources/themes/images/logo.png'/> class="site_logo" alt=""></p>
						<!-- <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. the  Lorem Ipsum has been the industry's standard dummy text ever since the you.</p> -->
						<br/>
						<span class="social_icons">
							<a class="facebook" href="#">Facebook</a>
							<a class="twitter" href="#">Twitter</a>
							<a class="skype" href="#">Skype</a>
							<a class="vimeo" href="#">Vimeo</a>
						</span>
					</div>					
				</div>	
			</section>
			<section id="copyright">
				<span>Copyright 2016. Monday To Friday all rights reserved.</span>
			</section>
		</div>
		<!-- 김태훈 백버튼 리프레시 -->
		<input type="hidden" id="refreshed" value="no" style="display: none">
		<script src=<c:url value='/resources/themes/js/common.js'/>></script>
		<script src=<c:url value='/resources/themes/js/jquery.flexslider-min.js'/>></script>
		<script type="text/javascript">
			$(function() {
				$(document).ready(function() {
					$('.flexslider').flexslider({
						animation: "fade",
						slideshowSpeed: 4000,
						animationSpeed: 600,
						controlNav: false,
						directionNav: true,
						controlsContainer: ".flex-container" // the container that holds the flexslider
					});
				});
			});
			
			// 김태훈 백버튼 리프레시 코드
			onload=function(){
			var e=document.getElementById("refreshed");
			if(e.value=="no")e.value="yes";
			else{e.value="no";location.reload();}
			}
						
		</script>
    </body>
</html>