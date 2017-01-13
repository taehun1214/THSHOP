<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<link href="<c:url value='/resources/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet"> 
		<link href="<c:url value='/resources/bootstrap/css/bootstrap-responsive.min.css' />" rel="stylesheet">		
		<link href="<c:url value='/resources/themes/css/bootstrappage.css' />" rel="stylesheet"/>
		
		<!-- global styles -->
		<link href="<c:url value='/resources/themes/css/flexslider.css' />" rel="stylesheet"/>
		<link href="<c:url value='/resources/themes/css/main.css' />" rel="stylesheet"/>

		<!-- scripts -->
		<script src="<c:url value='/resources/themes/js/jquery-1.7.2.min.js' />"></script>
		<script src="<c:url value='/resources/bootstrap/js/bootstrap.min.js' />"></script>				
		<script src="<c:url value='/resources/themes/js/superfish.js' />"></script>	
		<script src="<c:url value='/resources/themes/js/jquery.scrolltotop.js' />"></script>
		<!--[if lt IE 9]>			
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->
	</head>
    <body>		
		<div id="top-bar" class="container">
			<div class="row">
				<div class="span4">
					<form method="POST" class="search_form">
						<input type="text" class="input-block-level search-query" Placeholder="eg. T-sirt">
					</form>
				</div>
				<div class="span8">
					<div class="account pull-right">
						<ul class="user-menu">				
							<!-- ------------------셀러 입장 시작 - 수용이가 수정할 때 참고할 부분---------------------- -->
							<c:if test="${not empty s_login_id and s_login_id ne 'admin'}">
								<li><a href="sellermypage">My Page</a></li>
								<li><a href="sellerHome?s_id=${s_login_id}">My Home</a></li>
								<!-- 마이홈은 판매자홈 말하는거임 -->
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
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="wrapper" class="container">
			<section class="navbar main-menu">
				<div class="navbar-inner main-menu">				
					<a href="../seller/main" class="logo pull-left"><img src="<c:url value='/resources/themes/images//logo.png" class="site_logo'/>" alt=""></a>
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
		<section class="header_text sub">
		 
			<h3 class="titlem"> 
				<span><a href="sellermypage"><strong>MY</strong>  페이지</a></span>  
			</h3> 
			
		</section>
		<section class="main-content">
				
			<div class="row">
			
				<div class="span5 sp">  
				
					<h3 class="title">
						<span class="text"><strong>판매</strong> 정보</span>
					</h3>
					<form action="#" method="post">
						<input type="hidden" name="next" value="/">
						<fieldset>
							<div class="control-group">
								<label class="control-label"><a href="sellermypage_order" id="test">주문 요청 조회</a></label>

							</div>
							<div class="control-group">
								<label class="control-label"><a href="sellermypage_complete">판매 내역</a></label>
							</div>
							<div class="control-group">
								<label class="control-label"><a href="sellermypage_product">상품 등록 내역</a></label>
							</div>
							
							</fieldset>
							
							
				<h3 class="title">
					<span class="text"><strong>개인</strong> 정보</span>
				</h3>
						<fieldset>
							<div class="control-group">
								<label class="control-label"><a
									href="sellermypage_updateinfo?s_id=${s_login_id }">개인 정보 수정</a></label>
							</div>
							<div class="control-group">
								<label class="control-label"><a
									href="sellermypage_drop?s_id=${s_login_id }">회원 탈퇴</a></label>
							</div>
							
						</fieldset>
						
							
					</form> 
					<hr>  
				</div>
				
				<div id="maindi" class="span7">
					<h3 class="title">
						<span class="text"><strong>MY </strong> 상품 현황</span>
					</h3>
					
					<form action="#" method="post" class="form-stacked">
						<fieldset class="cf">
							<div class="control-group">
								<table>
									<tr>
										<th>[새로 들어온 주문 요청]</th>
										<th>[요청 중인 판매물 등록]</th>
									</tr>
									<tr>
										<td id="seller1" onMouseover="this.style.color='#5f5f59';"
											onMouseout="this.style.color='#EA9999';"
											style="text-align: center; color: #EA9999; text-decoration: underline;"></td>
										<td id="seller2" onMouseover="this.style.color='#5f5f59';"
											onMouseout="this.style.color='#EA9999';"
											style="text-align: center; color: #EA9999; text-decoration: underline;"></td>

									</tr>
								</table>
								
							</div>
							<div id="maindiv" class="control-group">
							<table id="ordert">
									<caption><b>[주문 요청 내역] (최근 5건)</b></caption>
									<tr>
										<th>주문번호</th>
										<th>주문일자</th>
										<th>상품명(옵션)</th>
										<th>구매자 ID</th>
										<th>주문상태</th>
									</tr>		
							</table>
							<table id="completet">
									<caption>
										<b>[판매 완료 내역] (최근 5건)</b>
									</caption>
									<tr>
										<th>주문번호</th>
										<th>주문일자</th>
										<th>상품명(옵션)</th>
										<th>구매자 ID</th>
										<th>주문상태</th>
									</tr>
									
							</table>
							<table id="productAcc" style="display: none;">
									<caption>
										<b>[판매물 승인 내역] (최근 5건)</b>
									</caption>
									<tr>
										<th>상품번호</th>
										<th>등록일자</th>
										<th>상품명</th>
										<th>승인 상태</th>
									</tr>
									
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
						<p class="logo"><img src="<c:url value='../resources/themes/images/logo.png' />" class="site_logo" alt=""></p>
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
	
	<input type="hidden" value="${s_login_id}" id="s_login_id">
	

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$(document).ready(function() {
	var s_id = $("#s_login_id").val();
	
	getOrderCount();
	getProductAccCount();
	getOrderlist();
	getCompletelist();
	getProductAcclist();
	
	function getOrderCount() {
		var url = '/shop/sellerid/all/' + s_id;
		$.getJSON(url, function(data) {
			var td = '';  	 
			$(data).each(function(){  
				td += this.count +'건'  
			});
			$('#seller1').html(td);
		});
	};
	
	function getProductAccCount() {
		var url = '/shop/sellerid/all4/' + s_id;
		$.getJSON(url, function(data) {
			var td = '';  	 
			$(data).each(function(){  
				td += this.count +'건'  
			});	
			$('#seller2').html(td);
		});
	};
	
	function getOrderlist() {
		var url = '/shop/sellerid/all2/' + s_id;
		$.getJSON(url, function(data) {
			var td = '';
			
			
			$(data).each(function(){ 
				console.log(this);
				var date = new Date(this.buy_date);
				var year = date.getFullYear();
				var month = date.getMonth();
				var day = date.getDate();
				var dateString = year + '년' + month + '월' + day + '일';
				
				var a = ''; 
				if (this.buy_status == 0){
					a = '입금대기'
				} else if (this.buy_status == 1){
					a = '결제확인중'
				} else if (this.buy_status == 2){
					a = '결제완료'
				} else if (this.buy_status == 3){ 
					a = '배송준비'
				}
				 
				
				 td += '<tr><td>' + this.buy_no + '</td>'
					+ '<td>' + dateString + '</td>'
					+ '<td>' + this.p_name + '&emsp;(' + this.o_cont + ')</td>'
				+ '<td>' + this.b_id + '&emsp;</td>'
				+ '<td>' + a + '</td></tr>';
				
				
			});
			
			$('#ordert > tbody:last').append(td);
		});
	};  
	
	function getCompletelist() {
		var url = '/shop/sellerid/all5/' + s_id;
		$.getJSON(url, function(data) {
			var td = '';
			
			
			$(data).each(function(){ 
				console.log(this);
				var date = new Date(this.buy_date);
				var year = date.getFullYear();
				var month = date.getMonth();
				var day = date.getDate();
				var dateString = year + '년' + month + '월' + day + '일';
				
				var a = ''; 
				if (this.buy_status == 4){
					a = '배송중'
				} else if (this.buy_status == 5){
					a = '배송완료'
				}
				 
				
				 td += '<tr><td>' + this.buy_no + '</td>'
					+ '<td>' + dateString + '</td>'
					+ '<td>' + this.p_name + '&emsp;(' + this.o_cont + ')</td>'
				+ '<td>' + this.b_id + '&emsp;</td>'
				+ '<td>' + a + '</td></tr>';
				
				
			});
			
			$('#completet > tbody:last').append(td);
		});
	};  
	
	function getProductAcclist() {
		var url = '/shop/sellerid/all7/' + s_id;
		$.getJSON(url, function(data) {
			var td = '';
			
			
			$(data).each(function(){ 
				console.log(this);
				var date = new Date(this.p_reg);
				var year = date.getFullYear();
				var month = date.getMonth();
				var day = date.getDate();
				var dateString = year + '년' + month + '월' + day + '일';
				
				var a = ''; 
				if (this.p_acc == 0){
					a = '미승인'
				} else if (this.p_acc == 1){
					a = '승인'
				}
				 
				
				 td += '<tr><td>' + this.p_no + '</td>'
					+ '<td>' + dateString + '</td>'
					+ '<td>' + this.p_name + '</td>'
					+ '<td>' + a + '</td></tr>';
				
				
			});
			
			$('#productAcc > tbody:last').append(td);
		});
	}; 
	
	$('#seller1').click(function () {
		$('#maindiv').children().hide();
		$('#ordert').show();
	});
	
	$('#seller2').click(function () {
		$('#maindiv').children().hide(); 
		$('#productAcc').show();
	});
	
});	
</script>	

</html>