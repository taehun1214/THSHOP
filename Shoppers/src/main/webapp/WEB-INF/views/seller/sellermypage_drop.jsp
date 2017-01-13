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
					<a href="/shop/buyer/main" class="logo pull-left"><img src="<c:url value='/resources/themes/images//logo.png" class="site_logo'/>" alt=""></a>
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
				<span><a href="buyermypage"><strong>MY</strong>  페이지</a></span>  
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
									href="javascript:window.location.reload(true);">회원 탈퇴</a></label>
							</div>
							
							<hr>
						</fieldset>
				</div> 	
				
				<div id="maindi" class="span7">
					<h3 class="title">
						<span class="text"><strong>회원 </strong> 탈퇴</span>
					</h3>
					<div class = "firstdiv">
						<label for="s_id_first">아이디</label> 
						<input required name="s_id_first" type="text" class="input-xlarge"
						minlength="4" maxlength="16" id="s_id_first" value="${sellerInfo.s_id }" readonly/>
											
						<label for="s_pw_first">비밀번호 입력</label> 
						<input required name="s_pw_first" type="password" class="input-xlarge"
						minlength="4" maxlength="16" id="s_pw_first" style="font-family: verdana" placeholder="비밀번호" />
						<br/>
						
						<button type="button" id="btnfirst">확인</button>
					</div>
					
					<section class="main-content" style="display: none;">
					
					<div>
					사용하고 계신 아이디<strong>(${s_login_id })</strong>는 탈퇴할 경우 재사용 및 복구가 불가능합니다.
					<br/>
					<strong style="color: red;">탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가</strong>하오니 신중하게 선택하시기 바랍니다.
					</div>
					<br/>
					<div style="color: red;">
					탈퇴 후에는 아이디 <strong> (${s_login_id }) </strong>로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다. 
					<br/>게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.
					<br/>또한, 쇼핑몰 아이디를 사용해 다른 서비스에 로그인 할 수 없게 됩니다.
					</div>
					<br/>
					<input type="checkbox" id="chkdrop" required />
					<label for="chkdrop" style="display: inline;">안내 사항을 모두 확인하였으며, 이에 동의합니다.</label><br/>
					<button class="btn" id="btndrop" type="button">회원 탈퇴</button>
					
					</section>
					
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
	<input type="hidden" value="${b_login_id}" id="s_login_id">

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$(document).ready(function() {
	var s_id = $("#s_login_id").val();
	
	$('#btnfirst').click(function() {
		var s_pw = $("#s_pw_first").val();
		var s_id = $('#s_id_first').val();
		$.ajax({
			type : 'post',
			url : 's_checkpw',
			headers:{
	             'Content-Type': 'application/json',
	             'X-HTTP-Method-Override': 'POST'
	         },
			data : JSON.stringify({
				s_pw: s_pw,
				s_id: s_id,
	         }),
			success : function(result) {
				if (result == 1) {
					$('.firstdiv').hide();
					$('.main-content').show();
				} else {
					alert('비밀번호가 틀렸습니다.');
					location.reload();
				}
			}
		});
		
	})
	
	$('#btndrop').click(function() {
		
		if ($("input:checkbox[id='chkdrop']").is(":checked")) {
			
			var s_id = $('#s_id_first').val();

			$.ajax({
				type : 'put',
				url : 'sellermypage_drop_commit',
				headers:{
		             'Content-Type': 'application/json',
		             'X-HTTP-Method-Override': 'PUT'
		         },
				data : JSON.stringify({
					s_id: s_id
		         }),
				success : function(result) {
					if (result == 1) {
						alert('회원 탈퇴 성공하였습니다.');
						location = '../';
						//location.replace = '../';
						document.location.replace("../");
						
					} else {
						alert('회원 탈퇴 실패하였습니다.');
						location.reload();
					}
				}
			});
		} else {
			alert('체크안됨');
		}
		
	})
	
	
});
</script>

</html>