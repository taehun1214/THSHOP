<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

<!-- Latest compiled and minified CSS -->


<!--[if lt IE 9]>			
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->
		
<style>
/* The Modal (background) */
.modal {
	 margin: auto;
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    -webkit-animation-name: fadeIn; /* Fade in the background */
    -webkit-animation-duration: 0.4s;
    animation-name: fadeIn;
    animation-duration: 0.4s
}

/* Modal Content */
.modal-content {
    position: fixed;
    bottom: 0;
    background-color: #fefefe;
    width: 100%;
    -webkit-animation-name: slideIn;
    -webkit-animation-duration: 0.4s;
    animation-name: slideIn;
    animation-duration: 0.4s
}

/* The Close Button */
.close {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.modal-header {
    padding: 2px 16px;
    background-color: #ff6666;
    color: white;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
    padding: 2px 16px;
    background-color: #ff6666;
    color: white;
}

/* Add Animation */
@-webkit-keyframes slideIn {
    from {bottom: -300px; opacity: 0} 
    to {bottom: 0; opacity: 1}
}

@keyframes slideIn {
    from {bottom: -300px; opacity: 0}
    to {bottom: 0; opacity: 1}
}

@-webkit-keyframes fadeIn {
    from {opacity: 0} 
    to {opacity: 1}
}

@keyframes fadeIn {
    from {opacity: 0} 
    to {opacity: 1}
}
</style>		
		
</head>
<body>

	<!-- The Modal -->
<div id="myModal" class="modal">
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2 style="text-align: center">로그인 실패</h2>
    </div>
    <div class="modal-body">
      <p style="text-align: center">아이디 또는 비밀번호가 일치하지 않습니다</p>
    </div>
  </div>
</div>
<!-- modal end -->

<!-- The Modal -->
<div id="accModal" class="modal">
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2 style="text-align: center">승인 되지 않은 회원</h2>
    </div>
    <div class="modal-body">
      <p style="text-align: center">관리자가 승인하기 전까지 로그인 할 수 없습니다.</p>
    </div>
        <div class="modal-footer">
    	<p style="text-align: center">관리자에게 문의하세요.</p>
    </div>
  </div>
</div>
<!-- modal end -->

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
							<li><a href="mypage/buyermypage">My Page</a></li>
							<li><a href="cart/selectCart">Cart</a></li>
							</c:if>
							<!-- ------------바이어 입장 시작-------------------------- -->
							<c:if test="${not empty b_login_id }">
							<li><a href="../mypage/buyermypage">My Page</a></li>	
							<li><a href="../cart/selectCart">Cart</a></li>
							</c:if>
							<!-- ------------------셀러 입장시작------------------------------- -->
							<c:if test="${not empty s_login_id and s_login_id ne 'admin'}">
							<li><a href="../mypage/sellermypage">My Page</a></li>
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
		<section class="header_text sub">
			<img class="pageBanner"
				src="<c:url value='/resources/themes/images/pageBanner.png'/>"
				alt="New products">
			<h4>
				<span>Login or Regsiter</span>
			</h4>
		</section>
		<section class="main-content">
			<div class="row">

				<!-- *************** -->
				<div class="span5">
					<h4 class="title">
						<span class="text"><strong>Login</strong> Form</span>
					</h4>
					<!-- ---------------------- -->
					<ul id="myTab" class="nav nav-tabs">
						<li class=""><a href="#buyerLogin" data-toggle="tab">구매자
								로그인</a></li>
						<li class="active"><a href="#sellerLogin" data-toggle="tab">판매자
								로그인</a></li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade" id="buyerLogin">
							<form action="buyer/login" method="post">
								<input type="hidden" name="next" value="/">
								<fieldset>
									<div class="control-group">
										<label class="control-label">아이디</label>
										<div class="controls">
											<input type="text" placeholder="아이디 입력" id="username"
												class="input-xlarge" name="b_id">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">비밀번호</label>
										<div class="controls">
											<input type="password" name="b_pw" placeholder="비밀번호 입력"
												id="password" class="input-xlarge" style="font-family: verdana">
										</div>
									</div>
									<div class="control-group">
										<input tabindex="3" class="btn btn-inverse large"
											type="submit" value="구매자 로그인"> <input type="hidden"
											name="query" value="<%=request.getQueryString()%>" />
										<hr>
										<p class="reset">
											구매자 <a tabindex="4" href="#"
												title="Recover your username or password">아이디/비밀번호 찾기</a>
										</p>
									</div>
								</fieldset>
							</form>

						</div>
						<div class="tab-pane fade active in" id="sellerLogin">
							<form action="seller/login" method="post" id="loginBuyerOrSeller">
								<input type="hidden" name="next" value="/">
								<fieldset>
									<div class="control-group">
										<label class="control-label">아이디</label>
										<div class="controls">
											<input type="text" placeholder="아이디 입력" id="username"
												class="input-xlarge" name="s_id">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">비밀번호</label>
										<div class="controls">
											<input type="password" name="s_pw" placeholder="비밀번호 입력"
												id="password" class="input-xlarge" style="font-family: verdana">
										</div>
									</div>
									<div class="control-group">
										<input tabindex="3" class="btn btn-inverse large"
											type="submit" value="판매자 로그인">
										<hr>
										<p class="reset">
											판매자 <a tabindex="4" href="#"
												title="Recover your username or password">아이디/비밀번호 찾기</a>
										</p>
									</div>
								</fieldset>
							</form>
						</div>
						<!-- class = tab-pane -->
					</div>
					<!-- myTabContent -->

				</div><!-- end span5 -->

				<div class="span7">
					<h4 class="title">
						<span class="text"><strong>Register</strong> Select</span>
					</h4>
					<a href="buyer/register"><img alt="구매자 회원가입"
						src="http://i.imgur.com/LCGiJiy.png"
						style="width: 300px"></a>
						<a href="seller/register"><img
						alt="판매자 회원가입"
						src="http://i.imgur.com/7JadaOo.png"
						style="width: 300px"
						></a>
				</div><!-- span7 -->
			</div><!-- end row -->
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
						<img src="<c:url value='resources/themes/images/logo.png' />"
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
	<input type="hidden" value="${loginFail}" id="failCheck">
	

	
	<!-- --------------------Alert------------- -->
	<script src="<c:url value='/resources/themes/js/common.js' />"></script>
	<script>
		$(document).ready(function() {
			var modal = document.getElementById('myModal');
			var accmodal = document.getElementById('accModal');
			var span = document.getElementsByClassName("close")[0];
			var btn = document.getElementById("myBtn");
			
			$('#checkout').click(function(e) {
				document.location.href = "checkout.html";
			})
			var fail = $("#failCheck").val();
			if (fail=="fail"){
				modal.style.display = "block";
				span.onclick = function() {
				    modal.style.display = "none";
			}
				<%request.getSession().removeAttribute("loginFail");%>
				$("#failCheck").val("");
			} else if (fail=="acc") {
				accmodal.style.display = "block";
				span.onclick = function() {
				    modal.style.display = "none";
				}
				<%request.getSession().removeAttribute("loginFail");%>
				$("#failCheck").val("");
			}
			window.onclick = function(event) {
			    if (event.target == modal) {
			        modal.style.display = "none";
			    }
			    if (event.target == accmodal){
			    	accmodal.style.display = "none";
			    }
			}
		});
	</script>
	
	
</body>
</html>