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
					<h3 class="title">
						<span class="text"><strong>회원</strong> 관리</span>
					</h3>
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
						<span class="text"><strong>전체 주문 </strong> 요청 내역</span>
					</h3>
					<%-- 현재 페이지, 페이지 당 보여줄 게시글 개수를 서버로 보내주기 위해서, 사용자에게는 보이지 않지만, 서버로 보낼 정보를 양식 데이터로 저장하는 form --%>
					<form id="pageForm">
						<input type="hidden" name="page"
							value="${pageMaker.criteria.page }" /> <input type="hidden"
							name="perPage" value="${pageMaker.criteria.perPage }" /> <input
							type="hidden" name="searchType"
							value="${searchpageMaker.criteria.searchType}" /> <input
							type="hidden" name="keyword" value="${cri.keyword }" />
					</form>
					
						<fieldset class="fieldb">
							<div class="control-group">
								<select name="searchType" class="searchSelect">
									<option value="n"
										<c:out value="${cri.searchType == null?'selected':'' }"/>>---</option>
									<option value="s"
										<c:out value="${cri.searchType eq 's'?'selected':'' }"/>>판매자
										ID</option>
									<option value="b"
										<c:out value="${cri.searchType eq 'b'?'selected':'' }"/>>구매자
										ID</option>
									<option value="t"
										<c:out value="${cri.searchType eq 't'?'selected':'' }"/>>주문상태</option>
									<option value="sb"
										<c:out value="${cri.searchType eq 'sb'?'selected':'' }"/>>판매자
										ID or 구매자 ID</option>
									<option value="st"
										<c:out value="${cri.searchType eq 'st'?'selected':'' }"/>>판매자
										ID or 주문상태</option>
									<option value="bt"
										<c:out value="${cri.searchType eq 'bt'?'selected':'' }"/>>구매자
										ID or 주문상태</option>
									<option value="sbt"
										<c:out value="${cri.searchType eq 'sbt'?'selected':'' }"/>>판매자
										ID or 구매자 ID or 주문상태</option>
								</select> <input type="text" name="keyword" id="keywordInput" class="searchi"
									value="${cri.keyword }">
								<button id='searchBtn'>Search</button>

								<table>
									<tr>
										<th>주문번호</th>
										<th>주문날짜&emsp;</th>
										<th>상품명(옵션)&emsp;</th>
										<th>판매가격&emsp;</th>
										<th>판매자 ID&emsp;</th>
										<th>구매자 ID&emsp;</th>
										<th>주문상태&emsp;</th>
									</tr>
									<tr>
										<td></td>
									</tr>
									<c:forEach var="list" items="${list }">
										<tr>

											<td class="buy_no">${list.buy_no }</td>
											<td class="buy_date"><fmt:formatDate value="${list.buy_date }"
													pattern="yyyy년 MM월 dd일" />&emsp;&emsp;</td>
											<td>${list.p_name }&emsp;(${list.o_cont })</td>
											<td class="tbl_price">${list.p_price }원</td>
											<td>${list.s_id }&emsp;</td>

											<td>${list.b_id }&emsp;</td>
											<c:if test="${list.buy_status eq '0' }">
												<td>입금대기</td>
											</c:if>
											<c:if test="${list.buy_status eq '1' }">
												<td>결제확인중</td>
											</c:if>
											<c:if test="${list.buy_status eq '2' }">
												<td>결제완료</td>
											</c:if>
											<c:if test="${list.buy_status eq '3' }">
												<td>배송준비</td>
											</c:if>

										</tr>
									</c:forEach>
								</table>


								<ul class="pageLinks">
									<li>-</li>
									<li id="main"><a href="${pageMaker.startPageNum }">처음으로</a></li>
									<c:if test="${searchpageMaker.hasPrev }">
										<li id="page"><a
											href="${searchpageMaker.startPageNum - 1 }">&laquo;이전</a></li>
									</c:if>

									<c:forEach begin="${searchpageMaker.startPageNum }"
										end="${searchpageMaker.endPageNum }" var="num">
										<li id="page"><a href="${num }">${num }</a></li>
									</c:forEach>

									<c:if test="${searchpageMaker.hasNext }">
										<li id="page"><a
											href="${searchpageMaker.endPageNum + 1 }">다음&raquo;</a></li>
									</c:if>
									<li>-</li>

								</ul>



							</div>

							

						</fieldset>
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

	<script>
		$(document).ready(function() {
			$('#checkout').click(function(e) {
				document.location.href = "checkout.html";
			});

		});
	</script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
		$(document).ready(
				function() {

					var frm = $('#pageForm');

					// 클래스 pageLinks 안의 li 태그 안의 a 태그를 찾아서 click 이벤트를 커스터마이징
					$('.pageLinks li a').click(function() {
						event.preventDefault(); // 기본 이벤트 처리 방식을 방지(막음)
						// pageForm 안에 있는 name="page"인 요소를 찾아서
						// 이동할 페이지 번호를 세팅
						var targetPage = $(this).attr('href');
						console.log('targetPage=' + targetPage);
						frm.find('[name="page"]').val(targetPage);
						// 페이징 화면으로 보내기 위한 action 정보
						frm.attr('action', 'buyr_searchlist');
						// 페이징 화면을 처리하는 Controller의 method(요청 처리 방식)
						frm.attr('method', 'get');
						// 폼 양식을 서버로 전송
						frm.submit();
					});

					$('#main a').click(function() {
						event.preventDefault(); // 기본 이벤트 처리 방식을 방지(막음)
						// pageForm 안에 있는 name="page"인 요소를 찾아서
						// 이동할 페이지 번호를 세팅
						var targetPage = $(this).attr('href');
						console.log('targetPage=' + targetPage);
						frm.find('[name="page"]').val(targetPage);
						// 페이징 화면으로 보내기 위한 action 정보
						frm.attr('action', 'buyr');
						// 페이징 화면을 처리하는 Controller의 method(요청 처리 방식)
						frm.attr('method', 'get');
						// 폼 양식을 서버로 전송
						frm.submit();
					});

					$('#searchBtn').on(
							"click",
							function(event) {

								self.location = "buyr_searchlist" + "?page=1"
										+ "&perPage=5" + "&searchType="
										+ $("select option:selected").val()
										+ "&keyword="
										+ encodeURI($('#keywordInput').val());

							});
				});
	</script>


</body>
</html>