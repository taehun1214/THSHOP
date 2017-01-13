<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>H-Shopper : 특별함을 전하는</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<!--[if ie]><meta content='IE=8' http-equiv='X-UA-Compatible'/><![endif]-->
		
		<!-- bootstrap -->
		<link href="<c:url value='/resources/bootstrap/css/bootstrap.min.css' />" rel="stylesheet">      
		<link href="<c:url value='/resources/bootstrap/css/bootstrap-responsive.min.css' />" rel="stylesheet">		
		<link href="<c:url value='/resources/themes/css/bootstrappage.css' />" rel="stylesheet"/>
		
		<!-- global styles -->
		<link href="<c:url value='/resources/themes/css/main.css' />" rel="stylesheet"/>
		<link href="<c:url value='/resources/themes/css/jquery.fancybox.css' />" rel="stylesheet"/>
				
		<!-- scripts -->
		<script src="<c:url value='/resources/themes/js/jquery-1.7.2.min.js' />"></script>
		<script src="<c:url value='/resources/bootstrap/js/bootstrap.min.js' />"></script>				
		<script src="<c:url value='/resources/themes/js/superfish.js' />"></script>	
		<script src="<c:url value='/resources/themes/js/jquery.scrolltotop.js' />"></script>
		<script src="<c:url value='/resources/themes/js/jquery.fancybox.js' />"></script>
		<!--[if lt IE 9]>			
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->
		
		<!-- self style -->
		<style>
		/* -------------------------------------------------------- */
		
			.menu_board {
				/* width: 600px; */
			/* 	height: 187px; */
				max-height: 210px;
				/* float: left;
				border: none; */
				/* margin: 30px; */
				/* margin-left:30px;
				border-radius: 5px;*/
				 overflow-x:hidden; 
 				overflow-y:auto;  
			}
			.table_padding th, .table_padding td {
				padding:4px;
			}
			
		/* -------------------------------------------------------- */	
		</style>
		
		
		
	</head>
    <body>		
   <!-- -------------------------------------------------------- -->
   
    	<!-- 백버튼 리프레시 인풋 -->
		<input type="hidden" id="refreshed" value="no" style="display: none">
		<input type="hidden" id="ownSeller" value="${sellerInfo.s_id}">
		<input type="hidden" id="loginedSeller" value="${s_login_id}">
		<input type="hidden" name="s_id" value="${sellerInfo.s_id }" />
		
	<!-- -------------------------------------------------------- -->  
    
		<div id="top-bar" class="container">
			<div class="row">
				<div class="span4">
					<form method="POST" class="search_form">
						<input type="text" class="input-block-level search-query" Placeholder="eg. T-sirt">
					</form>
				</div>
				
				<!-- <div class="span8">
					<div class="account pull-right">
						<ul class="user-menu">				
							<li><a href="#">My Account</a></li>
							<li><a href="cart.html">Your Cart</a></li>
							<li><a href="checkout.html">Checkout</a></li>					
							<li><a href="register.html">Login</a></li>		
						</ul>
					</div>
				</div> -->
				
				<div class="span8">
					<div class="account pull-right">
						<ul class="user-menu">
							<!-- 김태훈 코드 시작, 로그인한 사용자별 상단 메뉴 정렬-->
							<!-- TODO: 마이페이지, 장바구니 링크 걸고, 인터셉터 걸어야함 -->
							<!-- ---------------visitor 입장----------------------------- -->
							<c:if test="${empty s_login_id && empty b_login_id }">
								<li><a href="">My Page</a></li>
								<li><a href="">Cart</a></li>
							</c:if>
							<!-- ------------바이어 입장 시작-------------------------- -->
							<c:if test="${not empty b_login_id }">
								<li><a href="">My Page</a></li>
								<li><a href="">Cart</a></li>
							</c:if>
							<!-- ------------------셀러 입장시작------------------------------- -->
							<c:if test="${not empty s_login_id and s_login_id ne 'admin'}">
								<li><a href="">My Page</a></li>
								<li><a href="sellerHome?s_id=${s_login_id}">My Home</a></li>
								<!-- 마이홈은 판매자홈 말하는거임 -->
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
			<section class="navbar main-menu">
				<div class="navbar-inner main-menu">
					<%-- 			
					<a href="index.html" class="logo pull-left"><img src="<c:url value='/resources/themes/images/logo.png' />" class="site_logo" alt=""></a>
					
					<nav id="menu" class="pull-right">
						<ul>
							<li><a href="./products.html">Woman</a>					
								<ul>
									<li><a href="./products.html">Lacinia nibh</a></li>									
									<li><a href="./products.html">Eget molestie</a></li>
									<li><a href="./products.html">Varius purus</a></li>									
								</ul>
							</li>															
							<li><a href="./products.html">Man</a></li>			
							<li><a href="./products.html">Sport</a>
								<ul>									
									<li><a href="./products.html">Gifts and Tech</a></li>
									<li><a href="./products.html">Ties and Hats</a></li>
									<li><a href="./products.html">Cold Weather</a></li>
								</ul>
							</li>							
							<li><a href="./products.html">Hangbag</a></li>
							<li><a href="./products.html">Best Seller</a></li>
							<li><a href="./products.html">Top Seller</a></li>
						</ul>
					</nav>
					 --%>
					 <!-- 방문객 입장 -->
					<c:if test="${empty s_login_id && empty b_login_id }">
						<a href="./" class="logo pull-left"><img src=<c:url value='/resources/themes/images/logo.png' /> class="site_logo" alt=""></a>
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
			<img class="pageBanner" src="<c:url value='/resources/themes/images/pageBanner.png' />" alt="New products" >
				<h4>
					<span>Seller's Home</span>
				</h4>
			</section>
			
			
			
			
			
			
			
			<section class="main-content">				
				<div class="row">	
									
					<!-- <div class="span9"> -->
					<div class="span12">	<!-- ** 수정 ** -->
					
						<div class="row">
						
							<!-- 판매자 로고 이미지 -->
							<div class="span5 ">
								<div id="sellerLogo">
									<a href="${sellerInfo.s_logo }" class="thumbnail" data-fancybox-group="group1" title="${sellerInfo.s_name }">
										
										<img alt="" src="${sellerInfo.s_logo }">
										
									</a>
								</div>							
								<br>
								<table class="table table-striped shop_attributes table_padding">	
												<tbody>
													<tr>
														<th>판매자</th>
														<td>${sellerInfo.s_name }</td>
														
													</tr>		
													<tr>
														<th>이메일</th>
														<td>${sellerInfo.s_email }</td>
													</tr>
													<tr>
														<th>개인 쇼핑몰 / SNS</th>
														<td>${sellerInfo.s_info }</td>
													</tr>
													<tr>
														<td>&nbsp;</td> 
														<td>&nbsp;</td>
													</tr> 
												</tbody>
											</table>
						
							</div>
				
						
						<!-- 	<div class="menu_board"> -->
							<div class="span7">
								<div>
									<ul class="nav nav-tabs" id="myTab">
										<!-- <li class="active"><a href="#tab1">Profile</a></li> -->
										<li class=""><a href="#tab2">Q&A</a></li>
										<li class=""><a href="#tab3">Review</a></li>
										<li class=""><a href="#tab4">Board</a></li>
									</ul>	
															 
									<div class="tab-content  menu_board">
										<!-- ----------------------------------------------------------------------- -->
										<%-- <div class="tab-pane active" id="tab1">
												
											<table class="table table-striped shop_attributes table_padding">	
												<tbody>
													<tr>
														<th>판매자</th>
														<td>${sellerInfo.s_name }</td>
														
													</tr>		
													<tr>
														<th>이메일</th>
														<td>${sellerInfo.s_email }</td>
													</tr>
													<tr>
														<th>개인 쇼핑몰 / SNS</th>
														<td>${sellerInfo.s_info }</td>
													</tr>
													<tr>
														<td>&nbsp;</td> 
														<td>&nbsp;</td>
													</tr> 
												</tbody>
											</table>
											 
										
										</div> --%>
										<!-- ----------------------------------------------------------------------- -->
										<div class="tab-pane" id="tab2">
										 
										 	<c:if test="${empty listQnA}">
												등록된 상품문의가 없습니다.
											</c:if>
										 	
											<table class="table table-striped shop_attributes">	
												<tbody>
													<c:forEach var="list" items="${listQnA }" varStatus="state">
													
														<tr>
															<!-- # colum 1 -->
															<c:if test="${list.qna_type eq 0 }">
																<td>상품</td>
															</c:if>
															<c:if test="${list.qna_type eq 1 }">
																<td>배송</td>
															</c:if>
															<c:if test="${list.qna_type eq 2 }">
																<td>반품/취소</td>
															</c:if>
															<c:if test="${list.qna_type eq 3 }">
																<td>교환/변경</td>
															</c:if>
															<c:if test="${list.qna_type eq 4 }">
																<td>기타</td>
															</c:if>
															
															<!-- # colum 2 -->
															<td class="replies" repData="${state.index }">
																<c:if test="${list.qna_reply eq 0 }">
																	답변 대기&emsp;
																	<span class ="qnaDetail" modData="${state.index }" onMouseover="this.style.color='blue'; this.style.textDecoration='underline';" 
											 						onMouseout="this.style.color='black'; this.style.textDecoration='none';">${fn:substring(list.qna_cont,0,9) }...</span>
																</c:if>
																
																<c:if test="${list.qna_reply eq 1 }">
																	<Strong style="text-decoration: underline;">답변 완료</Strong>&emsp;
																	<span class ="qnaDetail" modData="${state.index }" onMouseover="this.style.color='blue'; this.style.textDecoration='underline';" 
											 						onMouseout="this.style.color='black'; this.style.textDecoration='none';"><b>${fn:substring(list.qna_cont,0,9) }...</b></span>
																</c:if>						
															</td>
															
															<!-- # colum 3 -->						
															<td>${list.b_id }</td>
															
															<!-- # colum 4 -->
															<td><fmt:formatDate value="${list.qna_reg }" pattern="yyyy년 MM월 dd일" />&emsp;&emsp;</td>
															
														<tr/>
															
															<c:if test="${list.qna_reply eq 0 }">
															
															<tr style="background-color: inherit;">
																							
																<td class="modify${state.index }" style="display: none; "><img style="width: 15px; height: 15px;" src='<c:url value="/resources/css/blue_Q.png" />' ></img></td>
																
																<td colspan ="3" class="modify${state.index }" style="display: none;">
																<!-- 상품링크 띄우기 -->
																	<a href="pDetail?p_no=${list.p_no}">상품번호 : ${list.p_no }</a><br>
																${list.qna_cont }</td>
															</tr>
															
																					<%-- 판매자,관리자에서만 보이게 해야함.--%>
															<tr style="display: none;">
																<td class="modify${state.index }" style=" text-align: center; display: none;"><img style="width: 15px; height: 15px;" src='<c:url value="/resources/css/red_A.png" />' ></img></td>
																
																<td colspan ="3" class="modify${state.index }" style="display: none; 
																text-align: center; width: 250px; height: 50px;" modData="${state.index }">
																
																<%-- <form id = "frm${state.index }" method="post">
																	<textarea cols="25" rows="3" name="qna_r_cont" class="qna_r_cont"  id="qna_r_cont${state.index }"
																	style="width: 100%;	height:100%; background-color: inherit;
																	resize:none; box-sizing: border-box; 
																	-moz-box-sizing: border-box; 
																	-webkit-box-sizing: border-box; border: none;" placeholder="답변을 작성해 주세요." required></textarea>
																
																	<input type="hidden" name="s_id" id="s_id${state.index }" value="sellerId" />
																	<input type="hidden" name="p_no" id="p_no${state.index }" value="${productVO.p_no}" /> 
																	<input type="hidden" name="qna_no" id="qna_no${state.index }" value="${list.qna_no }" />
																	</form>						
																		<button type="button" class="insertReply">저장</button> --%>
																</td>
																
															</tr>
									
									<!-- 							</div> -->
															</c:if>
															
															<c:if test="${list.qna_reply eq 1 }">
															<c:forEach var="listr" items="${listQnAR }" >
															<c:if test="${list.qna_no eq listr.qna_no }">
																
															<tr style="background-color: inherit;">
																							
																<td class="modify${state.index }" style="display: none; "><img style="width: 15px; height: 15px;" src='<c:url value="/resources/css/blue_Q.png" />' ></img></td>
																
																<td colspan ="3" class="modify${state.index }" style="display: none;">
																	
																	<!-- 상품링크 띄우기 -->
																	<a href="pDetail?p_no=${list.p_no}">상품번호 : ${list.p_no }</a><br>
																	 ${list.qna_cont }</td>
															</tr>
																
															<tr>
																
																<td class="modify${state.index }" style="display: none; "><img style="width: 15px; height: 15px;" src='<c:url value="/resources/css/red_A.png" />' ></img></td>
																
																<td colspan ="3" class="modify${state.index }" style="display: none; height: 100%" modData="${state.index }">
																
																<form id = "updatefrm${state.index }" method="post">
																	
																	<pre id = "qna_r_cont${state.index }" 
																	name = "qna_r_cont" class="qna_r_cont" style="border: none; background-color: inherit;" contenteditable="false">${listr.qna_r_cont }</pre>
																	
																	<input type="hidden" name="qna_r_no" id="qna_r_no${state.index }" value="${listr.qna_r_no }"/>
																	<input type="hidden" name="s_id" id="s_id${state.index }" value="${listr.s_id }" /> 
																	<input type="hidden" name="p_no" id="p_no${state.index }" value="${productVO.p_no}" /> 
																	<input type="hidden" name="qna_no" id="qna_no${state.index }" value="${listr.qna_no }" />
																</form>
																</td>
																</tr>
																
															</c:if>
														</c:forEach>
													</c:if>
												</c:forEach>
											</tbody>
										</table>

										</div>
										
										
										
										
										
										
										
										
										
										<!-- ----------------------------------------------------------------------- -->
										<div class="tab-pane" id="tab3">
										
											<c:if test="${empty listRev}">
												등록된 구매후기가 없습니다.
											</c:if>
											
										
											<table class="table table-striped shop_attributes">	
												<tbody>
												<c:forEach var="list" items="${listRev }" varStatus="state">
													<tr class="">
														<th>
														<p class="star_rating" >
															 <c:forEach begin="1" end="${list.rev_score }" var="item">
															 <a class="on" name = "rev_score">★</a>
															 </c:forEach>
															 
															 <c:forEach begin="${list.rev_score }" end="4" var="item2">
															 <a name = "rev_score">★</a>
															 </c:forEach>
														</p>
														</th>
														<td><b>${list.rev_cont }</b></td>
														<td>${list.b_id }(구매)</td>
														<td><fmt:formatDate value="${list.rev_reg }"
															pattern="yyyy년 MM월 dd일" />&emsp;&emsp;</td>
													</tr>		
													<%-- 
													<tr class ="revReply" modData="${state.index }">
														<th style="text-decoration: underline;" onMouseover="this.style.color='blue';" 
															onMouseout="this.style.color='black';">한줄답글</th>
					
														<c:if test="${list.rev_reply eq 1 }">
															<td>
																<c:forEach var="listr" items="${listReply}">
																<c:if test="${list.rev_no eq listr.rev_no }">
																
																	<div modData="${state.index }">
																		<form id = "updaterevfrm${state.index }" method="post">
																			<input type="text" id="rev_r_cont${state.index }" name="rev_r_cont" 
																			maxlength="100" value="${listr.rev_r_cont }" 
																			readonly style="border: none; color:maroon;"/>
																			<input type="hidden" name="rev_r_no" id="rev_r_no${state.index }" value="${listr.rev_r_no }"/>
																			<input type="hidden" name="s_id" id="s_id${state.index }" value="${listr.s_id }" /> 
																			<input type="hidden" name="p_no" id="p_no${state.index }" value="${productVO.p_no}" /> 
																			<input type="hidden" name="rev_no" id="rev_no${state.index }" value="${listr.rev_no }" />
																		</form>
																	</div>
																</c:if>
																</c:forEach>
															
															</td>
														</c:if>
													</tr>
													 --%>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<!-- ----------------------------------------------------------------------- -->
										<div class="tab-pane" id="tab4">
											준비중 ... 
										</div>
										<!-- ----------------------------------------------------------------------- -->
										
										
									</div>							
								</div>	
													
							</div><!-- end meun_board -->
						</div><!-- end_row -->
					</div><!-- end_span12  -->
				</div><!-- end_row -->
			</section>	
			
			
			
			
			
			
			
			
			
			<section class="main-content">
			<div class="row">
				<div class="span12">

					<div class="row">
						<div class="span12">
							<h4 class="title">
								<span class="pull-left"><span class="text"><span
										class="line">Total <strong>Products</strong></span></span></span> <span
									class="pull-right"> <a class="left button"
									href="#myCarousel" data-slide="prev"></a><a
									class="right button" href="#myCarousel" data-slide="next"></a>
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
												<c:forEach begin="0" end="7" varStatus="status"
													items="${productList }">
													<!-- 1번째 // 4 개씩 출력 -->
													<li class="span3">
														<div class="product-box">
															<span class="sale_tag">
																<%--  #index : ${4 * page + status.index} --%>
															</span>
															<p>
																<a
																	href="pDetail?p_no=${productList[8 * page + status.index].p_no }"><img
																	src="${productList[8 * page + status.index].p_img }" /></a>
															</p>
															<a
																href="pDetail?p_no=${productList[8 * page + status.index].p_no }"
																class="title">${productList[8 * page + status.index].p_name }</a><br>
															<a
																href="pDetail?p_no=${productList[8 * page + status.index].p_no }"
																class="category">${productList[8 * page + status.index].p_cate1}</a>
															<!-- 카테고리 -->
															<%-- <p class="price">₩ ${productList[4 * page + status.index].p_price }</p>	  --%>
															<p class="price">
																<fmt:formatNumber
																	value="${productList[4 * page + status.index].p_price}"
																	groupingUsed="true" />
																원
															</p>
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
														<c:forEach begin="0" end="7" varStatus="status"
															items="${productList }">
															<!-- 2번째 // 4 개씩 출력 -->
															<li class="span3">
																<div class="product-box">
																	<span class="sale_tag">
																		<%--  #index : ${4 * page + status.index} --%>
																	</span>
																	<p>
																		<a
																			href="pDetail?p_no=${productList[8 * page + status.index].p_no }"><img
																			src="${productList[8 * page + status.index].p_img }" /></a>
																	</p>
																	<a
																		href="pDetail?p_no=${productList[8 * page + status.index].p_no }"
																		class="title">${productList[8 * page + status.index].p_name }</a><br>
																	<a
																		href="pDetail?p_no=${productList[8 * page + status.index].p_no }"
																		class="category">${productList[8 * page + status.index].p_cate1}</a>
																	<!-- 카테고리 -->
																	<p class="price">
																		<fmt:formatNumber
																			value="${productList[8 * page + status.index].p_price}"
																			groupingUsed="true" />
																		원
																	</p>

																</div>
															</li>
														</c:forEach>

													</ul>
												</div>
											</c:forEach>
										</c:if>


										<!-- 마지막 페이지 -->
										<c:if test="${remainder != 0}">
											<c:forEach begin="${numOfPage-1}" end="${numOfPage-1}"
												var="page">
												<div class="item">
													<ul class="thumbnails">
														<%-- <c:forEach begin="0" end="4" var="i"> --%>
														<%-- ${productList.list[4 * page + i] } --%>
														<c:forEach begin="0" end="${remainder-1}"
															varStatus="status" items="${productList }">
															<!-- 3번째 // 4 개씩 출력 -->
															<li class="span3">
																<div class="product-box">
																	<span class="sale_tag">
																		<%--  #index : ${4 * page + status.index} --%>
																	</span>
																	<p>
																		<a
																			href="pDetail?p_no=${productList[8 * page + status.index].p_no }"><img
																			src="${productList[8 * page + status.index].p_img }" /></a>
																	</p>
																	<a
																		href="pDetail?p_no=${productList[8 * page + status.index].p_no }"
																		class="title">${productList[8 * page + status.index].p_name }</a><br>
																	<a
																		href="pDetail?p_no=${productList[8 * page + status.index].p_no }"
																		class="category">${productList[8 * page + status.index].p_cate1}</a>
																	<!-- 카테고리 -->
																	<p class="price">
																		<fmt:formatNumber
																			value="${productList[8 * page + status.index].p_price}"
																			groupingUsed="true" />
																		원
																	</p>

																</div>
															</li>
														</c:forEach>

													</ul>
												</div>
											</c:forEach>
										</c:if>
										<c:if test="${remainder == 0}">
											<c:forEach begin="${numOfPage-1}" end="${numOfPage-1}"
												var="page">
												<div class="item">
													<ul class="thumbnails">
														<%-- <c:forEach begin="0" end="4" var="i"> --%>
														<%-- ${productList.list[4 * page + i] } --%>
														<c:forEach begin="0" end="7" varStatus="status"
															items="${productList }">
															<!-- 3번째 // 4 개씩 출력 -->
															<li class="span3">
																<div class="product-box">
																	<span class="sale_tag">
																		<%--  #index : ${4 * page + status.index} --%>
																	</span>
																	<p>
																		<a
																			href="pDetail?p_no=${productList[8 * page + status.index].p_no }"><img
																			src="${productList[8 * page + status.index].p_img }" /></a>
																	</p>
																	<a
																		href="pDetail?p_no=${productList[8 * page + status.index].p_no }"
																		class="title">${productList[8 * page + status.index].p_name }</a><br>
																	<a
																		href="pDetail?p_no=${productList[8 * page + status.index].p_no }"
																		class="category">${productList[8 * page + status.index].p_cate1}</a>
																	<!-- 카테고리 -->
																	<p class="price">
																		<fmt:formatNumber
																			value="${productList[8 * page + status.index].p_price}"
																			groupingUsed="true" />
																		원
																	</p>

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

					<br />


				</div>
			</div>
		</section>


		<!-- /////////////////////////////////////////////////////////////////////////////////////// -->
								


		<hr />
		<!-- 김태훈 코드2............ 로그인한 아이디랑 상품등록 아이디가 같을때만 보임-->
		<c:if test="${s_login_id eq sellerInfo.s_id}">
			<input class="btn btn-inverse" type="button" id="btnPRegister"
				value="Register" />
		</c:if>
		<!-- 김태훈 코드2............ -->
		<input class="btn btn-inverse" type="button" id="gotoList"
			value="Home" />
			
			
			
			
			
			
			
			
			
			
			
			
					
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
						<p class="logo"><img src="<c:url value='/resources/themes/images/logo.png' />" class="site_logo" alt=""></p>
						<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. the  Lorem Ipsum has been the industry's standard dummy text ever since the you.</p>
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
				<span>Copyright 2013 bootstrappage template  All right reserved.</span>
			</section>
		</div>
		<script src="<c:url value='/resources/themes/js/common.js' />"></script>
		<script src="<c:url value='/resources/css/tabqnajs.js?ver=201612121647' />"></script>
		<script src="<c:url value='/resources/css/tabrevjs.js?ver=201612121647' />"></script>
		<script>
			$(function () {
				$('#myTab a:first').tab('show');
				$('#myTab a').click(function (e) {
					e.preventDefault();
					$(this).tab('show');
				})
			})
			$(document).ready(function() {
				$('.thumbnail').fancybox({
					openEffect  : 'none',
					closeEffect : 'none'
				});
				
				$('#myCarousel-2').carousel({
                    interval: 2500
                });								
			});
			
			
		    $(document).ready(function(){
		       	// 상품 등록
		       	$('#btnPRegister').click(function() {
		       		location = 'pRegister';
		       	});
		       	
		       	// 리스트
		           $('#gotoList').click(function() {
		       		location = 'main';
		       	});
		       	
		        // 김태훈 백버튼 리프레시 코드(스크립트 안에넣기)
		         onload=function(){
		         var e=document.getElementById("refreshed");
		    	     if (e.value=="no") {
		    	    	 e.value="yes";
		    	     }
		    	     else {
		    	     	e.value="no";location.reload();
		    	     }
		         }	
		    });
		</script>
    </body>
</html>