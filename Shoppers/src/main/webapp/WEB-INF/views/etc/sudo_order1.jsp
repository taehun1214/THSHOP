<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>H-Shopper : 특별함을 전하는</title>
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
<script
	src="<c:url value='/resources/themes/js/jquery.scrolltotop.js' />"></script>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>


</head>
<!-- -------------------------------------------------------------- -->


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
						<!-- 김태훈 코드 시작, 로그인한 사용자별 상단 메뉴 정렬-->
						<!-- TODO: 마이페이지, 장바구니 링크 걸고, 인터셉터 걸어야함 -->
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
							<li><a href="pList?s_id=${s_login_id}">My Home</a></li>
							<!-- 마이홈은 판매자홈 말하는거임 -->
						</c:if>
						<!-- ----------------어드민 입장 시작--------------------------------------->
						<c:if test="${s_login_id eq 'admin'}">
							<li><a href="">My Page</a></li>
						</c:if>
						<c:if test="${empty s_login_id && empty b_login_id }">
							<c:url value="..login" var="login" />
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
				<a href="../buyer/main" class="logo pull-left"> <img
					src="<c:url value='/resources/themes/images/logo.png' />"
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
				<span>Shopping List</span>
			</h4>
		</section>

		<section class="main-content">
			<div class="row">
				<div class="span12">
					<div class="accordion" id="accordion2">
						<h4 class="title">
							<span class="text"><strong>Your</strong> Order</span>
						</h4>
						
						<!-- -------------------------------------------------------------- -->
						
						
						<h1>주문 리스트</h1>
						
						
						<form action="/shop/order/readyForBill" method="get" name="frm">
							<table>
								<tr> 
									<th>제품번호</th>
									<th>그림</th>
									<th>제품</th>
									<th>옵션</th>
									<th>가격</th>
								</tr>
								<c:forEach var="vo" items="${ListForOrder}">
									<tr>
										<td><span></span>${vo.p_no}</td>
										<!-- 제품 이미지 -->
										<td><img src="${vo.p_img }" style="width: 50px" /></td>
										<td><span>제품명 : </span>${vo.p_name }<span>(${vo.buy_cnt }개)</span></td>
										<td><span>옵션 : </span>${vo.o_cont }</td>
										<td><span>가격 : </span>${vo.p_price * vo.buy_cnt }</td>

									</tr>
									<span><input type="hidden" value="${vo.c_no }"
										name="c_no"></span>
								</c:forEach>
							</table>
							
							
							<hr>
							
							
							<div>
								<dl>
									<dt>
										<strong>주문정보</strong>
									</dt>
									<dd>

											<p>
											<span>주문 갯수 : </span><strong>${totalCountForOrder}</strong><span>개
												/ </span> <span>마일리지 적립 : </span><strong>${miledTobeAdded}</strong><span>Point
												/ </span> <span>총 배송비 : </span><strong>${Shipping}</strong><span>원
												/ </span> <span>제품 총 금액 : </span><strong>${totalProductPriceForOrder}</strong><span>원</span>
										</p>
										
										
										
										
										
										
										
							<hr>
										<p>
											<span>총 합계 금액 : <strong>${FinalPriceForOrder }</strong>원
											</span>
										</p>

									</dd>
								</dl>
								
								<hr>
							</div>
							
							
							<h2>주문고객 정보</h2>
							주문자 : <input type="text" value="${buyerNAME}" name="b_name"><br>
							핸드폰 : <input type="number" value="${buyerHP}" name="b_phone"><br>
							이메일 : <input type="email" value="${buyerEmail }" name="b_email"><br>
							<hr>
							<h2>받는사람 정보</h2>
							<div>
								<input type="radio" checked="checked" name="juso"
									id="showExistingAddr">주문자와 같음 <input type="radio"
									name="juso" id="showNewAddr">새로 입력
							</div>
							<br>
							<!--  -->
							<div>
								받는분 : <input type="text" value="${buyerNAME}" name="client_name" id="newClientName"><br>
								핸드폰 : <input type="number" value="${buyerHP}" name="client_phone" id="newClientHP"><br>
								<hr>
								우편번호 : <input type="number" id="sample6_postcode"
									placeholder="우편번호" name="delivery_zip" value="${registedZip }">
								<input type="button" value="우편번호 찾기"
									onclick="sample6_execDaumPostcode()"><br> 기본주소 :
								<input type="text" id="sample6_address" placeholder="주소"
									name="delivery_addr1" value="${registedAddr1 }"><br>
								상세주소 : <input type="text" id="sample6_address2"
									placeholder="상세주소" name="delivery_addr2"
									value="${registedAddr2 }"><br>
							</div>
							<hr>
							<h2>결제방법</h2>
							<input type="radio" checked="checked">무통장 입금 / 계좌 이체<br>
							<hr>
							<!-- TODO: 중복 submit 방지용 -->

							<!-- 주문자 아이디 -->
							<input type="hidden" value="${b_id }" name="b_id"> <input
								type="submit" id="submitBuy" value="결제하기"
								class="btn btn-inverse">

						</form>




						<!-- ****** TODO ****** -->




						<!-- -------------------------------------------------------------- -->

					</div>
					<!-- #### -->
				</div>
			</div>
		</section>
		<section id="footer-bar">
			<div class="row">
				<div class="span3">
					<h4>Navigation</h4>
					<ul class="nav">
						<li><a href="./buyer/main">Homepage</a></li>
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

	<!-- 김태훈 백버튼 리프레시 -->
	<input type="hidden" id="refreshed" value="no" style="display: none">
	<!-- 스크립트 시작 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		// 기존주소 또는 새 배송 주소 입력 
		$("#showNewAddr").click(function() {
			$("#sample6_postcode").val("");
			$("#sample6_address").val("");
			$("#sample6_address2").val("");
			$("#newClientName").val("");
			$("#newClientHP").val("");
		});

		$("#showExistingAddr").click(function() {
			$("#sample6_postcode").val("${registedZip }");
			$("#sample6_address").val("${registedAddr1 }");
			$("#sample6_address2").val("${registedAddr2 }");
			$("#newClientName").val("${buyerNAME}");
			$("#newClientHP").val("${buyerHP}");
		});

		// 새 배송 주소 우편번호 찾기
		////////////////////////////////////////////////////////////////////////////////////////////////////////
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var fullAddr = ''; // 최종 주소 변수
							var extraAddr = ''; // 조합형 주소 변수

							// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								fullAddr = data.roadAddress;

							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								fullAddr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
							if (data.userSelectedType === 'R') {
								//법정동명이 있을 경우 추가한다.
								if (data.bname !== '') {
									extraAddr += data.bname;
								}
								// 건물명이 있을 경우 추가한다.
								if (data.buildingName !== '') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
								fullAddr += (extraAddr !== '' ? ' ('
										+ extraAddr + ')' : '');
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
							document.getElementById('sample6_address').value = fullAddr;

							// 커서를 상세주소 필드로 이동한다.
							document.getElementById('sample6_address2').focus();
						}
					}).open();
		}

		/////////////////////////////////////////////////////////////////////////////////////////////////////////

		$('#submitBuy').click(
				function() {
					window.open("../order/test_bill", 'window',
							'width=500, height=500, resizable=no');

				});

		// 김태훈 백버튼 리프레시 코드
		onload = function() {
			var e = document.getElementById("refreshed");
			if (e.value == "no")
				e.value = "yes";
			else {
				e.value = "no";
				location.reload();
			}
		}
	</script>


</body>
</html>