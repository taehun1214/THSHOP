<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>H-Shopper : 특별함을 전하는</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<!--[if ie]><meta content='IE=8' http-equiv='X-UA-Compatible'/><![endif]-->
<!-- bootstrap -->
<link href="<c:url value='/resources/bootstrap/css/bootstrap.min.css'/>"
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
<script
	src="<c:url value='/resources/themes/js/jquery.scrolltotop.js' />"></script>


<!--[if lt IE 9]>			
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->
</head>
<body class="bb">
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
							<c:if test="${s_login_id eq 'admin'}">
							<li><a href="admin/admin_mypage">My Page</a></li>
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
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="wrapper" class="container">
		<section class="navbar main-menu">
			<div class="navbar-inner main-menu">
				<a href="../seller/main" class="logo pull-left"><img
					src="<c:url value='/resources/themes/images//logo.png" class="site_logo'/>"
					alt=""></a>
					<nav id="menu" class="pull-right">
						<ul>
							<li><a href="../products?p_cate1=home_deco">Home / Deco</a>					
								<ul>
									<li><a href="../products?p_cate2=furniture">furniture</a></li>	<!-- 가구 -->									
									<li><a href="../products?p_cate2=pottery">pottery</a></li>		<!-- 도자기 -->		
									<li><a href="../products?p_cate2=lamp">lamp</a></li>			<!-- 조명 -->									
								</ul>
							</li>															
							<li><a href="../products?p_cate1=candle_diffuser">Candle / Diffuser</a>
								<ul>
									<li><a href="../products?p_cate2=candle">candle</a></li>			<!-- 양초 -->										
									<li><a href="../products?p_cate2=diffuser">diffuser</a></li>			<!-- 디퓨저 -->
									<li><a href="../products?p_cate2=aromatic oils">aromatic oils</a></li>	<!-- 아로마오일 -->									
								</ul>		
								</li>	
							<li><a href="../products?p_cate1=art_fancy">Art / Fancy</a>
								<ul>									
									<li><a href="../products?p_cate2=picture">picture</a></li>		<!-- 사진 -->
									<li><a href="../products?p_cate2=fancy">fancy</a></li>		<!-- 문구 -->
									<li><a href="../products?p_cate2=paper">paper</a></li>		<!-- 페이퍼 -->
								</ul>
							</li>							
							<li><a href="../products?p_cate1=jewellery">Jewellery</a>
								<ul>									
									<li><a href="../products?p_cate2=earring">earring</a></li>		<!-- 귀걸이 -->
									<li><a href="../products?p_cate2=necklace">necklace</a></li>		<!-- 목걸이 -->
									<li><a href="../products?p_cate2=ring">ring</a></li>			<!-- 반지 -->
								</ul>
							</li>
							<li><a href="../products">Event</a></li>
						</ul>
					</nav>
			</div>
		</section>
		<section class="header_text sub">
		 
			<h3 class="titlem"> 
				<span><a href="admin_mypage"><strong>관리자</strong> 페이지</a></span> 
			</h3> 
			
		</section>
		<section class="main-content">
				
			<div class="row">
			
				<div class="span5 sp"> 
				
					<h3 class="title">
						<span class="text"><strong>판매</strong> 관리</span>
					</h3>
					<form action="#" method="post">
						<input type="hidden" name="next" value="/">
						<fieldset>
							<div class="control-group">
								<label class="control-label"><a href="buyr" id="test">전체
										주문 요청 내역</a></label>

							</div>
							<div class="control-group">
								<label class="control-label"><a href="buyf">전체 판매 내역</a></label>
							</div>
							<!-- <div class="control-group">
								<label class="control-label"><a href="#">전체 판매
										통계</a></label>
							</div> -->
							</fieldset>
				<h3 class="title">
					<span class="text"><strong>회원</strong> 관리</span>
				</h3>
						<fieldset>
							<div class="control-group">
								<label class="control-label"><a
									href="seller_accept_list">판매자 회원 목록</a></label>
							</div>
							<div class="control-group">
								<label class="control-label"><a
									href="seller_accept_product_list">판매물 등록 승인</a></label>
							</div>
							<div class="control-group">
								<label class="control-label"><a href="buyer_list">구매자
										회원 목록</a></label>
							</div>
							<hr>
						</fieldset>
					</form>
				</div>
				<div id="maindi" class="span7">
					<h3 class="title">
						<span class="text"><strong>쇼핑몰</strong> 현황</span>
					</h3>
					<form action="#" method="post" class="form-stacked">
						<fieldset class="cf">
							<div class="control-group">
								<table>
									<tr>
										<th>[새로운 주문내역]</th>
										<th>[오늘의 판매 내역]</th>
										<th>[판매자 승인 요청]</th>
										<th>[판매몰 승인 요청]</th>
									</tr>
									<tr>
										<td id="newReq" onMouseover="this.style.color='#5f5f59';"
											onMouseout="this.style.color='#EA9999';"
											style="text-align: center; color: #EA9999; text-decoration: underline;">${reqSize}건</td>

										<td id="buyTo" onMouseover="this.style.color='#5f5f59';"
											onMouseout="this.style.color='#EA9999';"
											style="text-align: center; color: #EA9999; text-decoration: underline;">${buyTodaySize}건</td>

										<td id="sel_ACC" onMouseover="this.style.color='#5f5f59';"
											onMouseout="this.style.color='#EA9999';"
					 						style="text-align: center; color: #EA9999; text-decoration: underline;">${accSize}건</td>

										<td id="p_Acc" onMouseover="this.style.color='#5f5f59';"
											onMouseout="this.style.color='#EA9999';"
											style="text-align: center; color: #EA9999; text-decoration: underline;">${pSize}건</td>
									</tr>
								</table>
							</div>
							</fieldset>
							<fieldset class="tabelfieldset">
							<div id="maindiv" class="control-group">
								<table id="totalReq" class="adminmaintable">
									<caption>
										<b>주문 요청 내역(최근 5건)</b>
									</caption>
									<tr>
										<th>주문번호</th>
										<th>주문날짜</th>
										<th>상품명(옵션)</th>
										<th>판매자</th>
										<th>구매자</th>
										<th>주문상태</th>
									</tr>
									<c:forEach var="list" items="${list2 }">
										<tr>
											<td>${list.buy_no }</td>
											<td><fmt:formatDate value="${list.buy_date }"
													pattern="yyyy년 MM월 dd일" />&emsp;</td>
											<td>${list.p_name }&emsp;(${list.o_cont })</td>
											<td>${list.s_id }&emsp;</td>
											<td>${list.b_id }&emsp;</td>
											<c:if test="${list.buy_status eq 0 }">
												<td>입금대기</td>
											</c:if>
											<c:if test="${list.buy_status eq 1 }">
												<td>결제확인중</td>
											</c:if>
											<c:if test="${list.buy_status eq 2 }">
												<td>결제완료</td>
											</c:if>
											<c:if test="${list.buy_status eq 3 }">
												<td>배송준비</td>
											</c:if>
										</tr>
									</c:forEach>
								</table>

								<table id="newTotalReq" class="adminmaintable" style="display: none;">
									<caption>
										<b>[새로운 주문 요청 내역]</b>
									</caption>
									<tr>
										<th>주문번호</th>
										<th>주문날짜</th>
										<th>상품명(옵션)</th>
										<th>판매자</th>
										<th>구매자</th>
										<th>주문상태</th>
									</tr>
									<c:forEach var="listReq" items="${listBuyReq }">
										<tr>
											<td>${listReq.buy_no }</td>
											<td><fmt:formatDate value="${listReq.buy_date }"
													pattern="yyyy년 MM월 dd일" />&emsp;</td>
											<td>${listReq.p_name }&emsp;(${listReq.o_cont })</td>
											<td>${list.s_id }&emsp;</td>
											<td>${listReq.b_id }&emsp;</td>
											<c:if test="${listReq.buy_status eq '0' }">
												<td>입금대기</td>
											</c:if>
											<c:if test="${listReq.buy_status eq '1' }">
												<td>결제확인중</td>
											</c:if>
											<c:if test="${listReq.buy_status eq '2' }">
												<td>결제완료</td>
											</c:if>
											<c:if test="${listReq.buy_status eq '3' }">
												<td>배송준비</td>
											</c:if>
										</tr>
									</c:forEach>
								</table>

								<br /> <br />


								<table id="buySuc" class="adminmaintable">
									<caption>
										<b>최근 판매 완료 내역(최근 5건)</b>
									</caption>
									<tr>
										<th>주문번호</th>
										<th>주문날짜</th>
										<th>상품명(옵션)</th>
										<th>판매자</th>
										<th>구매자</th>
										<th>주문상태</th>
									</tr>
									<c:forEach var="list" items="${listBuyVO }">
										<tr>
											<td>${list.buy_no }</td>
											<td><fmt:formatDate value="${list.buy_date }"
													pattern="yyyy년 MM월 dd일" />&emsp;</td>
											<td>${list.p_name }&emsp;(${list.o_cont })</td>
											<td>${list.s_id }&emsp;</td>
											<td>${list.b_id }&emsp;</td>
											<td>배송완료</td>
										</tr>
									</c:forEach>
								</table>

								<table id="buyToday" class="adminmaintable" style="display: none;">
									<caption>
										<b>[오늘의 판매 내역]</b>
									</caption>
									<tr>
										<th>주문번호</th>
										<th>주문날짜</th>
										<th>상품명(옵션)</th>
										<th>판매자</th>
										<th>구매자</th>
										<th>주문상태</th>
									</tr>
									<c:forEach var="listReq" items="${buyToday }">
										<tr>
											<td>${listReq.buy_no }</td>
											<td><fmt:formatDate value="${listReq.buy_date }"
													pattern="yyyy년 MM월 dd일" />&emsp;</td>
											<td>${listReq.p_name }&emsp;(${listReq.o_cont })</td>
											<td>${list.s_id }&emsp;</td>
											<td>${listReq.b_id }&emsp;</td>
											<c:if test="${listReq.buy_status eq '5' }">
												<td>배송완료</td>
											</c:if>
										</tr>
									</c:forEach>
								</table>

								<table id="sellerAccess" class="adminmaintable" style="display: none;">
									<caption>
										<b>[판매자 승인 요청]</b>
									</caption>
									<tr>
										<th>회원번호</th>
										<th>판매자 ID</th>
										<th>가입일</th>
										<th>이메일</th>
										<th>가입 승인</th>
									</tr>
									<c:forEach var="svo" items="${listAcc }">
										<tr>
											<td>${svo.s_no}</td>
											<td>${svo.s_id}&emsp;</td>
											<td><fmt:formatDate value="${svo.s_reg }"
													pattern="yyyy-MM-dd HH:mm:ss" />&emsp;</td>
											<td>${svo.s_email}&emsp;</td>
											<td><c:if test="${svo.s_acc == 0 }">미승인</c:if> <c:if
													test="${svo.s_acc == 1 }">승인</c:if></td>
										</tr>
									</c:forEach>
								</table>

								<table id="productAccess" class="adminmaintable" style="display: none;">
									<caption>
										<b>[판매물 승인 요청]</b>
									</caption>
									<tr>
										<th>회원번호</th>
										<th>판매자</th>
										<th>상품번호</th>
										<th>상품명(옵션)</th>
										<th>승인여부</th>
									</tr>
									<c:forEach var="pvo" items="${pAcc }">
										<c:forEach var="svo" items="${sel_id }">
											<tr>
												<c:if test="${pvo.s_id == svo.s_id }">
													<td>${svo.s_no}</td>
													<td>${pvo.s_id}</td>
													<td>${pvo.p_no }</td>
													<td>${pvo.p_name}<!--옵션정보 추가해줘야함 정훈이 코드 참고 --></td>
													<td><c:if test="${pvo.p_acc == 0 }">미승인</c:if> <c:if
															test="${pvo.p_acc == 1 }">승인</c:if></td>
												</c:if>
											</tr>
										</c:forEach>
									</c:forEach>
								</table>
							</div>
							</fieldset>


							

						
					</form>
					<hr>
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
						<img src="<c:url value='../resources/themes/images/logo.png' />"
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
	<script src="<c:url value='/resources/themes/js/common.js' />"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#checkout').click(function(e) {
				document.location.href = "checkout.html";
			})
			
			$('#newReq').click(function () {
				$('#maindiv').children().hide();
				$('#newTotalReq').show();
			});
			
			$('#buyTo').click(function () {

				$('#maindiv').children().hide();
				$('#buyToday').show();
			});
			
			$('#sel_ACC').click(function() {
				$('#maindiv').children().hide();
				$('#sellerAccess').show();	
			});

			$('#p_Acc').click(function() {
				$('#maindiv').children().hide();
				$('#productAccess').show();	
			});
			
		});
	</script> 
	

</body>
</html>