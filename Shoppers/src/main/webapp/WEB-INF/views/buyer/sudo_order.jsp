<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
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

<style>
	.registConfirmBox {
    border: 5px solid #f1f1f1;
    background: #fff;
    padding: 7px 20px 5px 20px;
    font-size: 12px;
    overflow: hidden;
	}
	.registConfirmBox dt {
    float: left;
    width: 140px;
    text-align: center;
    padding-top: 30px;
	}
	
	.registConfirmBox dd {
    float: right;
    width: 670px;
	}

	.registConfirmBox div {
    border-bottom: 1px solid #e2e2e2;
	}

	.rt {
	    text-align: right !important;
	        margin: 0 0 0px;
	}
	.registConfirmBox span {
	    padding-left: 20px;
	}
	.registConfirmBox p {
    padding: 10px 0;
	}
	
	.colorRe {
    color: #ff0000;
	}
	
	.spanA {
    width: 405px;
     margin-left: 0px;
    
	}
	.spanB {
    width: 405px;
	}
	
	
	.boardType {
	    width: 100%;
	    border-top: 2px solid #b1da2b;
	    border-bottom: 1px solid #e2e2e2;
	  	border-collapse: collapse;
	    border: 0;
	    empty-cells: show;
	    border-spacing: 0;
	    padding: 0;
	}
	.viewStyle01 caption {
	    display: none;
	}
	
	.viewStyle01 td {
	    text-align: left;
	    vertical-align: top;
       
	}

	
	</style>

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
		<section class="navbar main-menu">
			<div class="navbar-inner main-menu">
				<a href="../buyer/main" class="logo pull-left"> <img
					src="<c:url value='/resources/themes/images/logo.png' />"
					class="site_logo" alt=""></a>
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
				src="<c:url value='/resources/themes/images/pageBanner.png' />"
				alt="New products">
			<h4>
				<span>Shopping List</span>
			</h4>
		</section>

		<section class="main-content">				
				<div class="row">
				
				
					<div class="span9">					
						<h4 class="title"><span class="text"><strong>Order</strong> list</span></h4>
						
						
					<!------------------------ *** 주문 공사 !!! *** ------------------------->
						
						
					<form action="/shop/buyer/readyForBill" method="get" name="frm">
						
						<table class="table table-striped"> 
				<!-- 
						<thead>태그는 표의 머리글 역할을 하며, <th>태그를 이용한다.
						<tfoot>태그는 표의 바닥글 역할을 한다.
						<tbody>태그는 본문이 들어가는 행의 묶음이다.
							THEAD, TFOOT, TBODY 태그들은 기술순서를 지켜야한다.
				-->
							<thead><!-- 표의 머리글 역할 -->
								<tr>
									<!-- <th>Remove</th> -->
									<th>No.</th>
									<th>Image</th>
									<th>Product Name</th>
									<th>Option</th>
									<th>Unit Price</th>
									<th>Quantity</th>
									<th>Total</th>
								</tr>
							</thead>
							
							
							<tbody><!-- 본문이 들어가는 행의 묶음-->
								<c:forEach var="vo" items="${ListForOrder}">
									<tr>
										<td>${vo.p_no}</td>
										
										
										<td><a href="../buyer/pDetail?p_no=${vo.p_no }"><img src="${vo.p_img}" style="width: 50px" /></a></td>
										
										<td><a href="../buyer/pDetail?p_no=${vo.p_no }">${vo.p_name }</a></td>
							            <!-- 이름 -->
							            
							            <td>${vo.o_cont }</td>
							            <!-- 옵션내용 -->
							            
							            <td><fmt:formatNumber value="${vo.p_price }" groupingUsed="true"/></td>
							            <!--  가격 -->
							            
							            <td>${vo.buy_cnt } 개</td>
								
										
										<td class="pricePerCount"><fmt:formatNumber value="${vo.p_price * vo.buy_cnt }" groupingUsed="true"/></td>
										
										
									</tr>
									
									<span><input type="hidden" value="${vo.c_no }"
										name="c_no"></span>
								
								</c:forEach>
							
							
						
								
								<tr>
									<td>&nbsp;</td><!-- 공백(스페이스 한 칸)  -->
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									
								</tr>		  
							</tbody>
						</table>
					

				<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
						
						
						
					<!------------------------ *** 주문!! *** ------------------------->
						
						

						<hr>
						<!-- TODO -->
						<div class="contBox4">
							<dl class="registConfirmBox">
								<dt><img src="http://image.thefingers.co.kr/academy2012/common/title/subtit_all_order_price.gif" alt="총 주문 금액"></dt>
								<dd>
									<div>
										<p class="rt">
											<span>주문작품수 <strong>${totalCountForOrder}</strong>개</span>
											<span>마일리지 적립 <strong><fmt:formatNumber value="${miledTobeAdded}" groupingUsed="true"/></strong>Point</span>
											<span>총 배송비 <strong><fmt:formatNumber value="${Shipping}" groupingUsed="true"/></strong>원</span>
											<span>작품 총 금액 <strong><fmt:formatNumber value="${totalProductPriceForOrder}" groupingUsed="true"/></strong>원</span>
										</p>
									</div>
									<p class="rt">
									    
										<span class="colorBk">총 합계 금액 <strong class="colorRe"><fmt:formatNumber value="${FinalPriceForOrder }" groupingUsed="true"/></strong>원</span>
									</p>
								</dd>
							</dl>
						</div>
						
						

					<!-- <br>
					<div>
						
						<div class="spanA">
							<h4 class="title"><span class="text"><strong>주문고객</strong> 정보</span></h4>
							<div>
								
								
								<form method="post" action="#">
								<fieldset>
									<div class="clearfix">
										<label for="name"><span>주문자명:</span></label>
										<div class="input">
											<input tabindex="1" size="18" id="name" name="name" type="text" value="" class="input-xlarge" placeholder="Name">
										</div>
									</div>
									
									<div class="clearfix">
										<label for="email"><span>이메일:</span></label>
										<div class="input">
											<input tabindex="2" size="25" id="email" name="email" type="text" value="" class="input-xlarge" placeholder="Email">
										</div>
									</div>
									
									<div class="clearfix">
										<label for="phone"><span>핸드폰:</span></label>
										<div class="input">
											<input type="text" tabindex="3" class="input-xlarge" id="message" name="body" placeholder="Phone-Number">
										</div>
									</div>
									
									<div class="actions">
										<button tabindex="3" type="submit" class="btn btn-inverse">Send message</button>
									</div>
								</fieldset>
							</form>
								
								
								
								<p><strong>Phone:</strong>&nbsp;(123) 456-7890<br>
								<strong>Fax:</strong>&nbsp;+04 (123) 456-7890<br>
								<strong>Email:</strong>&nbsp;<a href="#">vietcuong_it@yahoo.com</a>								
								</p>
								<br>
								<h5>SECONDARY OFFICE IN VIETNAM</h5>
								<p><strong>Phone:</strong>&nbsp;(113) 023-1125<br>
								<strong>Fax:</strong>&nbsp;+04 (113) 023-1145<br>
								<strong>Email:</strong>&nbsp;<a href="#">vietcuong_it@yahoo.com</a>					
								</p>
							</div>
						</div>
						<div class="spanB">
						<h4 class="title"><span class="text"><strong>배송지</strong> 정보</span></h4>
						
							<label class="radio" for="guest">
									<input type="radio" checked="checked" name="juso"id="showExistingAddr">기존 정보 불러오기 
							</label>
							<label class="radio" for="guest">
								<input type="radio" name="juso" id="showNewAddr">새 배송지 입력
							</label>
							<p>궁시렁 궁시렁</p>
							<form method="post" action="#">
								<fieldset>
									<div class="clearfix">
										<label for="name"><span>우편번호:</span></label>
										<div class="input">
											<input tabindex="1" size="18" id="name" name="name" type="text" value="" class="input-xlarge" placeholder="Zip-code">
										</div>
									</div>
									
									<div class="clearfix">
										<label for="email"><span>기본주소:</span></label>
										<div class="input">
											<input tabindex="2" size="25" id="email" name="email" type="text" value="" class="input-xlarge" placeholder="Base-Address">
										</div>
									</div>
									
									<div class="clearfix">
										<label for="message"><span>상세주소:</span></label>
										<div class="input">
											<input type="text" tabindex="3" class="input-xlarge" id="message" name="body" placeholder="Detail-Address">
										</div>
									</div>
									
									<div class="actions">
										<button tabindex="3" type="submit" class="btn btn-inverse">Send message</button>
									</div>
									
									
									<br>
								</fieldset>
							</form>
						</div>	
						
					</div> -->
				<!-- ==============================v================================================================================================ -->	
				<!-- ==============================v================================================================================================ -->	
					
					<br>

                    <h4 class="title"><span class="text"><strong>주문고객</strong> 정보</span></h4>
					<!-- <h2 class="tMar30"><img src="http://image.thefingers.co.kr/academy2012/common/title/subtit_order_customer_info.gif" alt="주문고객 정보"></h2> -->
					<table class="boardType viewStyle01 tMar10 table table-striped">
						<caption>주문고객 정보</caption>
						<colgroup>
							<col width="140px"><col width="300px"><col width="140px"><col width="">
						</colgroup>
						<tbody>
							<tr>
								<th><span>주문자명</span></th>
								<!-- <td><span><input name="buyname" maxlength="16" type="text" class="txtBasic tblInput" style="width:200px" value="방수용"></span></td> -->
								<td><span><input type="text" value="${buyerNAME}" name="b_name" style="width:200px" maxlength="16"></span></td>
								
								<th></th>
								<td></td>
							</tr>
							<tr>
								<th><span>핸드폰</span></th>
								<td colspan="3">
								    <span>
									<!-- <input type="text" name="buyhp1" class="txtBasic tblInput" style="width:40px" maxlength="4" value="010"> 
									- <input type="text" name="buyhp2" class="txtBasic tblInput" style="width:50px" maxlength="4" value="5058"> 
									- <input type="text" name="buyhp3" class="txtBasic tblInput" style="width:50px" maxlength="4" value="9641 -->
									<input type="number" value="${buyerHP}" name="b_phone">
									</span>
									<span class="lPad0"> (주문 정보를 SMS로 보내드립니다.)</span>
								</td>
							</tr>
							<tr>
								<th><span>이메일</span></th>
								<td colspan="3">
									<span>
									    <!-- <input type="text" name="buyemail_Pre" class="txtBasic tblInput" style="width:100px;" title="이메일 ID를 입력하세요" value="pkmzxcv777">  @ <input name="buyemail_Tx" type="text" class="txtBasic tblInput" value="" style="width:120px;display:none;">&nbsp;<select name="buyemail_Bx" id="select3" class="select tblInput" style="width:120px;" onchange="jsShowMailBox('document.frmorder','buyemail_Bx','buyemail_Tx');" \=""><option value="naver.com" selected="">naver.com</option><option value="netian.com">netian.com</option><option value="paran.com">paran.com</option><option value="hanmail.net">hanmail.net</option><option value="dreamwiz.com">dreamwiz.com</option><option value="nate.com">nate.com</option><option value="empal.com">empal.com</option><option value="orgio.net">orgio.net</option><option value="unitel.co.kr">unitel.co.kr</option><option value="chol.com">chol.com</option><option value="kornet.net">kornet.net</option><option value="korea.com">korea.com</option><option value="freechal.com">freechal.com</option><option value="hanafos.com">hanafos.com</option><option value="hitel.net">hitel.net</option><option value="hanmir.com">hanmir.com</option><option value="hotmail.com">hotmail.com</option><option value="etc">직접 입력</option></select>-->
									    <input type="email" value="${buyerEmail }" name="b_email">
									</span>
									<span class="lPad0"> (주문 정보를 이메일로 보내드립니다.)</span>
								</td>
							</tr>
							
							<%-- <tr>
								<th><span>주소</span></th>
								<td colspan="3">
									
									<p class="form-inline">
										<span class="positionR">
										   <!--  <input type="text" name="buyZip" class="txtBasic" value="" style="width:40px;" title="우편번호를 입력하세요." readonly="">  -->
											<!-- <img src="/image/academy2012/common/btn/zipcode_search.gif" alt="우편번호찾기" onclick="searchzipBuyerNew('frmorder');" class="zipBtn" style="cursor:pointer;"> -->
											<input type="number" id="sample6_postcode" placeholder="우편번호" name="delivery_zip" style="width:70px;" title="우편번호를 입력하세요." readonly="" class="txtBasic" value="${registedZip }">
											<input type="button" class="btn" value="우편번호 찾기" onclick="sample6_execDaumPostcode()">
										</span>
									</p>
									<p class="tMar05">
									    <span>
									    <input name="buyAddr1" type="text" class="txtBasic" style="width:280px;" title="주소를 입력하세요." readonly="" value="${registedAddr1}"> 
										<input name="buyAddr2" type="text" maxlength="60" class="txtBasic" style="width:280px;" title="나머지 주소를 입력하세요." value="${registedAddr2}">
										</span>
									</p>
								</td>
								
							</tr> --%>
							<tr>
								<td>&nbsp;</td><!-- 공백(스페이스 한 칸)  -->
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>	
								
							</tr>
							
						</tbody>
					</table>

					<div class="subtitleWap tMar30">
						 <h4 class="title"><span class="text"><strong>배송지</strong> 정보</span></h4>
						<p class="ftLt lMar10 tPad02">
						    
						    
						    
								<input type="radio" checked="checked" name="juso" id="showExistingAddr">주문자와 같음 
								<input type="radio" name="juso" id="showNewAddr">새로 입력
							
						   <!--  <span><input type="radio" class="radio" name="rdDlvOpt" id="rdDlvOpt" value="O" onclick="copyDefaultinfo(this);"> 주문 고객 정보와 동일</span>
						    &nbsp;
						    &nbsp;
							<span class="lPad20"><input type="radio" class="radio" name="rdDlvOpt" id="rdDlvOpt" value="N" checked="" onclick="copyDefaultinfo(this);"> 새로운 주소</span>
							 -->
						</p>
					</div>
					<table class="boardType viewStyle01 tMar05 table table-striped">
						<caption>배송지 정보</caption>
						<colgroup>
							<col width="140px"><col width="300px"><col width="140px"><col width="">
						</colgroup>
						<tbody>
							<tr>
								<th><span>받으시는분</span></th>
								<!-- <td colspan="3"><span><input type="text" name="reqname" maxlength="16" class="txtBasic tblInput" style="width:200px" value=""></span></td> -->
								<td colspan="3"><span>
									<input type="text" value="${buyerNAME}" name="client_name" id="newClientName">
								</span></td>
							</tr>
							<tr>
								<th><span>핸드폰</span></th>
								<td><span>
								    <!-- <input type="text" name="reqhp1" class="txtBasic tblInput" style="width:40px" value=""> 
									- <input type="text" name="reqhp2" class="txtBasic tblInput" style="width:50px" value=""> 
									- <input type="text" name="reqhp3" class="txtBasic tblInput" style="width:50px" value="">
								     -->
								 <input type="number" value="${buyerHP}" name="client_phone" id="newClientHP">    
								 </span></td>
								<!-- <th><span>전화번호</span></th>
								<td><span>
								    <input type="text" name="reqphone1" class="txtBasic tblInput" style="width:40px" value=""> 
									- <input type="text" name="reqphone2" class="txtBasic tblInput" style="width:50px" value=""> 
									- <input type="text" name="reqphone3" class="txtBasic tblInput" style="width:50px" value="">
									</span></td> -->
								<th></th>
								<td></td>
							</tr>
							<tr>
								<th><span>주소</span></th>
								<td colspan="3">
									
									<p class="form-inline">
										<span class="positionR">
										   <!--  <input type="text" name="buyZip" class="txtBasic" value="" style="width:40px;" title="우편번호를 입력하세요." readonly="">  -->
											<!-- <img src="/image/academy2012/common/btn/zipcode_search.gif" alt="우편번호찾기" onclick="searchzipBuyerNew('frmorder');" class="zipBtn" style="cursor:pointer;"> -->
											<input type="number" id="sample6_postcode" placeholder="우편번호" name="delivery_zip" style="width:70px;" title="우편번호를 입력하세요." readonly class="txtBasic" value="${registedZip }">
											<input type="button" class="btn" value="우편번호 찾기" onclick="sample6_execDaumPostcode()">
										</span>
									</p>
									<p class="tMar05">
									    <span>
									    <input name="delivery_addr1" id="sample6_address" type="text" class="txtBasic" style="width:280px;" title="주소를 입력하세요." readonly value="${registedAddr1}"> 
										<input name="delivery_addr2" id="sample6_address2" type="text" maxlength="60" class="txtBasic" style="width:280px;" title="나머지 주소를 입력하세요." value="${registedAddr2}">
										</span>
									</p>
								</td>
								
							</tr>
							<tr>
								<th><span>배송 유의사항</span></th>
								<td colspan="3">
									<span><input type="text" name="comment" class="txtBasic tblInput" style="width:400px" maxlength="60" value="" placeholder="ex) 부재시 경비실 위탁요망, 전화연락 후 배송 등..."></span>
									
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td><!-- 공백(스페이스 한 칸)  -->
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>	
								
							</tr>
						</tbody>
					</table>

                    
                    <br>
					<div class="overHidden">
						<div class="slaeInfoWrap">
							<h4 class="title"><span class="text"><strong>할인</strong> 정보</span></h4>
							<table class="boardType viewStyle01 tMar10 table table-striped">
								<caption>할인 정보</caption>
								<colgroup>
									<col width="120px"><col width=""><col width="180px">
								</colgroup>
								<tbody>
									<tr>
										<th><span>마일리지</span></th>
										<td>
										    <span>
										    										
												<input name="spendmileage" type="text" class="txtBasic tblInput" style="width:50px;" value="0" onkeyup="RecalcuSubTotal(this);" readonly> Point
												(작품금액 30,000원 이상 구매시 사용가능)
										    </span>
										</td>
										<td class="lineBg"><span>보유 마일리지 : 0 Point</span></td>
									</tr>
									<tr>
										<th><span><input type="radio" class="radio" name="itemcouponOrsailcoupon" value="S" checked onclick="defaultCouponSet(this);">보너스 쿠폰</span></th>
										<td>
											<span>
											    <select name="sailcoupon" class="select" style="width:300px;" onchange="RecalcuSubTotal(this);">
												
													<option value="">사용 하실 보너스 쿠폰을 선택하세요!</option>
												
												
												<!-- Valid Sail Coupon --> 
												
																<option style="color:#999999" value="91387127" id="0|0">DIY상품 2,000원 할인 쿠폰 (2,000원 할인 / 20,000 이상구매시) [2017-01-01까지]</option>
															
												</select>  
												
											</span>
										</td>
										<td class="lineBg"><span>적용가능 보너스 쿠폰 : 0 장</span></td>
									</tr>
									<tr>
										<th><span><input type="radio" class="radio" name="itemcouponOrsailcoupon" value="I" disabled onclick="defaultCouponSet(this);"> 쿠폰</span></th>
										<td><span>
										   
											
											적용 가능한 상품쿠폰이 없습니다.<script type="text/javascript">document.frmorder.itemcouponOrsailcoupon[1].disabled=true;</script>
											
										    </span></td>
										<td class="lineBg"><span>적용가능 강좌 쿠폰 : 0 장</span></td>
									</tr>
									<tr>
										<td colspan="3">
											
												<ul class="infoList03 tMar10 bMar15">
													<li>마일리지는 작품금액 30,000원 이상 결제시 사용 가능합니다.</li>
													<li>보너스쿠폰과 상품쿠폰은 중복사용이 불가능합니다.</li>
													<li>보너스쿠폰 중 %할인쿠폰은 이미 할인을 하는 작품에 대해서는 중복 적용이 되지 않습니다.</li>
												</ul>
											
										</td>
									</tr>
									<tr>
								<td>&nbsp;</td><!-- 공백(스페이스 한 칸)  -->
								<td>&nbsp;</td>
								<td>&nbsp;</td>	
								
							</tr>
								</tbody>
							</table>
						</div>
						
						<br>
						<input type="hidden" name="availitemcouponlist" value="">
						<input type="hidden" name="checkitemcouponlist" value="">
						<div class="payPriceWrap">
							 <h4 class="title"><span class="text"><strong>결제</strong> 금액</span></h4>
							<table class="boardType viewStyle01 tMar10 table table-striped">
								<caption>결제 금액</caption>
								<colgroup>
									<col width="130px"><col width="">
								</colgroup>
								<tbody>
									<tr>
										<th class="bgNone"><span>구매총액</span></th>
										<td class="rt"><span class="colorBk "><strong><fmt:formatNumber value="${totalProductPriceForOrder}" groupingUsed="true"/></strong> 원</span></td>
									</tr>
									<tr>
										<th class="bgNone"><span>배송료</span></th>
										<td class="rt"><span class="colorBk"><strong class="colorOr" id="DISP_DLVPRICE"><fmt:formatNumber value="${Shipping}" groupingUsed="true"/></strong> 원</span></td>
									</tr>
									<tr>
										<th class="bgNone"><span>마일리지 사용</span></th>
										<td class="rt"><span class="colorBk"><strong class="colorOr" id="DISP_SPENDMILEAGE">0</strong> Pt</span></td>
									</tr>
									<tr>
										<th class="bgNone"><span>보너스쿠폰 사용</span></th>
										<td class="rt"><span class="colorBk"><strong class="colorOr" id="DISP_SAILCOUPON_TOTAL">0</strong> 원</span></td>
									</tr>
									<tr>
										<th class="bgNone"><span>상품쿠폰 사용</span></th>
										<td class="rt"><span class="colorBk"><strong class="colorOr" id="DISP_ITEMCOUPON_TOTAL">0</strong> 원</span></td>
									</tr>
									<tr>
										<th class="bgNone"><span class="colorBk fs14"><strong>총 결제액</strong></span></th>
										<td class="rt"><span class="colorRe"><strong><em class="colorOr" id="DISP_SUBTOTALPRICE"><fmt:formatNumber value="${FinalPriceForOrder }" groupingUsed="true"/></em> 원</strong></span></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<br>
					 <h4 class="title"><span class="text"><strong>결제</strong> 수단</span></h4>
					
					<table class="boardType viewStyle01 tMar10 table table-striped" id="i_paymethod">
						<caption>결제정보 내역</caption>
						<colgroup>
							<col width=""><col width="261px">
						</colgroup>
						<tbody>
							<tr>
								<th colspan="2">
									<span><input type="radio" class="radio" name="Tn_paymethod" id="Tn_paymethod" value="100" onclick="CheckPayMethod(this);" checked> 신용카드</span>
									<span><input type="radio" class="radio" name="Tn_paymethod" id="Tn_paymethod" value="20" onclick="CheckPayMethod(this);"> 실시간 계좌이체</span>
									
									<span><input type="radio" class="radio" name="Tn_paymethod" id="Tn_paymethod" value="7" onclick="CheckPayMethod(this);"> 무통장 입금 (가상계좌)</span>
									
								</th>
							</tr>
							<!-- 신용카드 선택 시 노출 -->
							<tr id="paymethod_desc1_100" style="">
								<td>
									
										<ul class="infoList01 tMar10">
											<li>신용카드 결제시 화면 아래 '결제하기'버튼을 클릭하시면 신용카드 결제 창이 나타납니다. 신용카드 결제 창을 통해 입력되는 고객님의 카드 정보는 128bit로 안전하게 암호화되어 전송되며 승인 처리 후 카드 정보는 승인 성공/ 실패 여부에 상관없이 자동으로 폐기되므로, 안전합니다.</li>
											<li>신용카드 결제 신청시 승인 진행에 다소 시간이 소요될 수 있으므로 '중지',	 '새로고침'을 누르지 마시고 결과 화면이 나타 날때까지 기다려 주십시오. (결제하기 버튼 클릭시 결제창이 나타나지 않을 경우나 안전결제 모듈이 설치 되지 않을경우 <a href="http://pay.kcp.co.kr/plugin_new/file/KCPUXWizard.exe"><strong class="colorOr">[여기]</strong></a> 를 눌러 수동으로 플러그인을 설치하십시요.)</li>
										</ul>

										<ul class="infoList03 tMar15 colorBk">
											<li>신용카드/ 실시간 이체는 결제 후, 무통장입금은 입금확인 후 배송이 이루어집니다.</li>
											<li>국내 모든 카드 사용이 가능하며 해외에서 발행된 카드는 이용하실수 없습니다. (해외배송은 불가능합니다.)</li>
											<li>금요일오후 6시 ~ 일요일 주문은 결제완료 후 취소요청시, [고객센터]-[주문취소]를 이용하시면 됩니다.<br>(작품출고는 토요일에도 정상적으로 이루어집니다.)</li>
										</ul>
									
								</td>
								<td class="lineLt">
									<p class="tMar10">
										<!-- <span class="overHidden">
											<a href="javascript:popGongIn();" class="ftLt"><img src="http://image.thefingers.co.kr/academy2012/common/btn/official_certify.gif" alt="공인인증서 안내"></a>
											<a href="javascript:popansim();" class="ftLt"><img src="http://image.thefingers.co.kr/academy2012/common/btn/safe_click.gif" alt="안심클릭 의무사용"></a>
										</span> -->
									</p>
									<p>
										</p><dl class="cardInfo">
										
										</dl>
									   
									<p></p>
								</td>
							</tr>
							<!-- //신용카드 선택 시 노출 -->
							<!-- 실시간 계좌이체 선택 시 노출 -->
							<tr id="paymethod_desc1_20" style="display:none">
								<td>
									
										<ul class="infoList01 tMar10">
											<li>실시간 이체 결제시 화면 아래 '결제하기'버튼을 클릭하시면 실시간 이체 결제 창이 나타납니다. 실시간 이체 결제 창을 통해 입력되는 고객님의 정보는 128bit로 안전하게 암호화되어 전송되며 승인 처리 후 정보는 승인 성공/ 실패 여부에 상관없이 자동 으로 폐기되므로, 안전합니다.</li>
											<li>실시간 이체 결제 신청시 승인 진행에 다소 시간이 소요될 수 있으므로 '중지', '새로고침'을 누르지 마시고 결과 화면이 나타 날때까지 기다려 주십시오. (결제하기 버튼 클릭시 결제창이 나타나지 않을 경우 <a href="http://pay.kcp.co.kr/plugin_new/file/KCPUXWizard.exe"><strong class="colorOr">[여기]</strong></a> 를 눌러 수동으로 플러그인을 설치하십시요.)</li>
										</ul>

										<ul class="infoList03 tMar15 colorBk">
											<li>신용카드/ 실시간 이체는 결제 후, 무통장입금은 입금확인 후 배송이 이루어집니다.</li>
											<li>국내 모든 카드 사용이 가능하며 해외에서 발행된 카드는 이용하실수 없습니다. (해외배송은 불가능합니다.)</li>
											<li>금요일오후 6시 ~ 일요일 주문은 결제완료 후 취소요청시, [고객센터]-[주문취소]를 이용하시면 됩니다.<br>(작품출고는 토요일에도 정상적으로 이루어집니다.)</li>
										</ul>
										
										<dl class="taxBill" id="cashReceiptShow2" >
    										<dt>현금영수증</dt>
    										<dd><input type="checkbox" class="check cash2" id="cashReceipt2" name="cashreceiptreq2" value="Y"> <label for="cashReceipt2">현금영수증 발급 요청</label></dd>
    									</dl>
    									<!-- 현금 영수증 발급요청 체크시 뷰 -->
    									<div class="contBox3" id="cashDiv2" style="display:none;">
    										<div class="tPad15 bPad15">
    											<p>
    												<span><input type="radio" class="radio" id="deduction" name="useopt2" value="0" checked onclick="showCashReceptSubDetail(this)"> <label for="deduction">소득공제용</label></span>
    												<span><input type="radio" class="radio" id="expenseProof" name="useopt2" value="1" onclick="showCashReceptSubDetail(this)"> <label for="expenseProof">지출증빙용</label></span>
    											</p>
    											<p class="tMar10"><span>사업자번호,현금영수증카드,휴대폰번호&nbsp;&nbsp;&nbsp;<input type="text" class="txtBasic" style="width:140px" name="cashReceipt_ssn2" value="" size="18" maxlength="18">&nbsp;&nbsp;&nbsp;("-"를 뺀 숫자만 입력하세요)</span></p>
    											<p class="tMar10"><span class="colorOr">* 사업자, 현금영수증카드,휴대폰번호가 유효하지 않으면 발급되지 않습니다.</span></p>
    										</div>
    									</div>
									
								</td>
								<td class="lineLt">
									
										<ul class="infoList03 tMar10">
											<li>온라인 실시간 계좌 이체 서비스는 은행계 좌만 있으면 누구나 이용하실 수 있는 서비 스로 별도의 신청없이 그 대금을 자신의 거 래은행의 계좌로부터 바로 지불하는 서비 스입니다.</li>
											<li>안전한 거래를 위해 결제시 <em class="colorOr">공인인증서가 반드시 필요</em>합니다.</li>
											<li>은행 이용가능 서비스 시간은 은행사정에 따라 다소 변동될 수 있습니다.</li>
											<li>1원 이상 거래 시 현금영수증을 신청하실 수 있습니다.</li>
										</ul>
									
									
								</td>
							</tr>
							<!-- //실시간 계좌이체 선택 시 노출 -->
							<!-- 무통장 입금(가상계좌) 선택 시 노출 -->
							<tr id="paymethod_desc1_7" style="display:none">
								<td>
								    <input type="hidden" name="isCyberAcct" value="Y">
								    <input type="hidden" name="CST_PLATFORM" value="">
									
									    
										<dl class="taxBill tMar10">
											<dt>입금하실 은행</dt>
											<dd>
												<select class="select tblInput" name="acctno">
													<option value="">입금하실 은행을 선택하세요.</option>
													<option value="BK03">기업은행</option>
													<option value="BK04">국민은행</option>
													<option value="BK05">외환은행</option>
													<option value="BK20">우리은행</option>
													<option value="BK71">우체국</option>
													<option value="BK07">수협은행</option>
													<option value="BK11">농협중앙회</option>
													<option value="BK26">신한(조흥)은행</option>
													<option value="BK81">하나은행</option>
												</select>
												<p class="tMar10 colorOr">입금하실 은행만 선택하시면 다음단계인 [주문완료] 페이지에서 해당주문에 대한 <br>전용 가상계좌번호를 안내해 드립니다.<br>타은행에서 입금하실때 "송금수수료"가 부과됩니다.</p>
											</dd>
										</dl>
										
										<dl class="taxBill">
											<dt>입금자명</dt>
											<dd><input type="text" name="acctname" maxlength="12" class="txtBasic tblInput" style="width:200px"></dd>
											
										</dl>
										<dl class="taxBill" id="cashReceiptShow" >
											<dt>현금영수증</dt>
											<dd><input type="checkbox" class="check cash" id="cashReceipt" name="cashreceiptreq" value="Y"> <label for="cashReceipt">현금영수증 발급 요청</label></dd>
										</dl>
										<!-- 현금 영수증 발급요청 체크시 뷰 -->
										<div class="contBox3" id="cashDiv" style="display:none;">
											<div class="tPad15 bPad15">
												<p>
													<span><input type="radio" class="radio" id="deduction" name="useopt" value="0" checked onclick="showCashReceptSubDetail(this)"> <label for="deduction">소득공제용</label></span>
													<span><input type="radio" class="radio" id="expenseProof" name="useopt" value="1" onclick="showCashReceptSubDetail(this)"> <label for="expenseProof">지출증빙용</label></span>
												</p>
												<p class="tMar10"><span>사업자번호,현금영수증카드,휴대폰번호&nbsp;&nbsp;&nbsp;<input type="text" class="txtBasic" style="width:140px" name="cashReceipt_ssn" value="" size="18" maxlength="18">&nbsp;&nbsp;&nbsp;("-"를 뺀 숫자만 입력하세요)</span></p>
												<p class="tMar10"><span class="colorOr">* 사업자, 현금영수증카드,휴대폰번호가 유효하지 않으면 발급되지 않습니다.</span></p>
											</div>
										</div>
										<!-- //현금 영수증 발급요청 체크시 뷰 -->
										
										<!-- 전자보증보험 발급요청 체크시 뷰 -->
										
										<dl class="taxBill" id="insureShow" >
											<dt>전자보증보험</dt>
											<dd><input type="checkbox" class="check eleIns" id="electInsurance" name="reqInsureChk" value="Y"> <label for="electInsurance">전자보증보험 발급 요청</label></dd>
										</dl>
										
										<!-- 전자보증보험 발급요청 체크시 뷰 -->
										<div class="contBox3" id="eleInsDiv" style="display:none;">
											<div class="pad1520">
												<p><strong>전자보증보험 안내 (100% 매매보호 안전결제)</strong></p>
												<p class="tMar05">"전자상거래 등에서의 소비자보호에 관한 법률" 에 근거한 전자보증서비스는 서울보증보험㈜이 인터넷 쇼핑몰에서의 상품주문(결제) 시점에 소비자에게 보험증서를 발급하여 인터넷 쇼핑몰 사고로 인한 소비자의 금전적 피해를 100% 보상하는 서비스입니다.</p>
												<p>
													</p><ul class="infoList03 tMar05">
														<li>보상대상 : 상품 미배송, 환불거부(환불사유시), 반품거부(반품사유시), 쇼핑몰부도</li>
														<li>보험기간 : 주문일로부터 37일간(37일 보증)</li>
													</ul>
												<p></p>
												<div class="electInsur tMar20">
													<!--	// 정통망법 개정: 주민번호 > 생년월일+성별 (2012.11.18)
													<dl class="rowType">
														<dt class="tPad05">주문고객 주민등록번호<dt>
														<dd><span><input type="text" class="txtBasic" style="width:70px" name="insureSsn1" value="" size="7" maxlength="6" /> - <input type="password" class="txtBasic" style="width:70px" name="insureSsn2" value="" size="7" maxlength="7" /></span></dd>
													</dl>
													//-->
													<dl class="rowType">
														<dt class="tPad05">주문고객 생년월일</dt><dt>
														</dt><dd><span>
															<input type="text" class="txtBasic" name="insureBdYYYY" value="" size="5" maxlength="4">년 &nbsp;
															<select name="insureBdMM" class="select">
															<option value="">선택</option>
															<option value="01">1</option><option value="02">2</option><option value="03">3</option><option value="04">4</option><option value="05">5</option><option value="06">6</option><option value="07">7</option><option value="08">8</option><option value="09">9</option><option value="10">10</option>
															<option value="11">11</option><option value="12">12</option>
															</select>월 &nbsp;
															<select name="insureBdDD" class="select">
															<option value="">선택</option>
															<option value="01">1</option><option value="02">2</option><option value="03">3</option><option value="04">4</option><option value="05">5</option><option value="06">6</option><option value="07">7</option><option value="08">8</option><option value="09">9</option><option value="10">10</option>
															<option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option>
															<option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option>
															<option value="31">31</option>
															</select>일</span>
														</dd>
													</dl>
													<dl class="rowType tMar10">
														<dt>성별</dt><dt>
														</dt><dd>
															<span><input type="radio" class="radio" id="insureSex1" name="insureSex" value="1"> <label for="insureSex1">남</label></span>
															<span><input type="radio" class="radio" id="insureSex2" name="insureSex" value="2"> <label for="insureSex2">여</label></span>
														</dd>
													</dl>
													<dl class="rowType tMar10">
														<dt>개인정보이용동의</dt><dt>
														</dt><dd>
															<span><input type="radio" class="radio" id="individualAgree" name="agreeInsure" value="Y" checked> <label for="individualAgree">동의함</label></span>
															<span><input type="radio" class="radio" id="individualAgreeNo" name="agreeInsure" value="N"> <label for="individualAgreeNo">동의안함</label></span>
														</dd>
													</dl>
													<dl class="rowType tMar10">
														<dt>Email 수신동의</dt><dt>
														</dt><dd>
															<span><input type="radio" class="radio" id="emailSend" name="agreeEmail" value="Y" checked> <label for="emailSend">수신함</label></span>
															<span><input type="radio" class="radio" id="emailSendNo" name="agreeEmail" value="N"> <label for="emailSendNo">수신안함</label></span>
														</dd>
													</dl>
													<dl class="rowType tMar10">
														<dt>SMS 수신동의</dt><dt>
														</dt><dd>
															<span><input type="radio" class="radio" id="smsSend" name="agreeSms" value="Y" checked> <label for="smsSend">수신함</label></span>
															<span><input type="radio" class="radio" id="smsSendNo" name="agreeSms" value="N"> <label for="smsSendNo">수신안함</label></span>
														</dd>
													</dl>
												</div>
												<p class="tMar20">
													</p><ul>
														<li>* 전자보증서 발급에는 별도의 수수료가 부과되지 않습니다.</li>
														<li>* 전자보증서 발급에 필요한 주문고객 주민등록번호는 증권발급에만 사용되며, 다른 용도로 사용되지 않습니다.</li>
													</ul>
												<p></p>
											</div>
										</div>
										
										
										<!-- //전자보증보험 발급요청 체크시 뷰 -->
										
									
								</td>
								
								
								<td class="lineLt">
									<dl class="cardInfo">
										<dt><strong class="fs14 colorBk">가상계좌 안내</strong></dt>
										<dd>
											<ul class="infoList03">
												<li>무통장 입금시 사용되는 가상계좌는 매 주문 시마다 새로운 계좌번호(개인전용)가 부여되며 해당 주문에만 유효합니다.</li>
												<li>다른 주문건에 대한 가상계좌로 입금하시거나 잘못된 계좌로 입금하시면 자동 입금 확인이 되지 않으며, 다른 계좌번호로 잘못 입력하신 경우에는 고객센터로 문의 주시 기 바랍니다.</li>
												<li>계좌번호는 주문완료 페이지에서 확인할수 있으며 sms 문자 안내도 드립니다.</li>
											</ul>
										</dd>
									</dl>
								</td>
								
							</tr>
							<!-- //무통장 입금(가상계좌) 선택 시 노출 -->
						</tbody>
					</table>
					
					<!-- //개인 수강신청 일때 -->
                    
                    
					<br>
					<hr>
					
					<!-- <div class="btnWrap tMar30" id="nextbutton1" name="nextbutton1" style="display: block;">
					    <p class="ct">
							<a href="http://www.thefingers.co.kr/lecpay/DIYShopBag.asp"><img src="/image/academy2012/common/btn/prev_page.gif" alt="이전 페이지"></a>
							<a href="javascript:PayNext(document.frmorder,'');"><img src="/image/academy2012/common/btn/pay.gif" alt="결제하기"></a>
						</p>
					</div>
					<div class="btnWrap tMar30" id="nextbutton2" name="nextbutton2" style="display: none;">
						<p class="ct">
							<img src="/image/academy2012/common/btn/prev_page.gif" alt="이전 페이지">
							<img src="/image/academy2012/common/btn/pay.gif" alt="결제하기">
						</p>
					</div> -->
					
					
					
					<a href="../cart/selectCart" class="btn">뒤로가기</a>
					<input type="hidden" value="${b_id }" name="b_id"> 
					
					<input type="submit" id="submitBuy" value="결제하기" class="btn btn-inverse">
					</form>
			
					
				<!-- ==============================v================================================================================================ -->							
			</div> <!-- span9 end -->
					
									
					
				
					
					
					
					
					
					<!-- ==============================v================================================================================================ -->
					
					<div class="span3 col">
						<div class="block">	
							<ul class="nav nav-list">
								<li class="nav-header">SUB CATEGORIES</li>
								<li><a href="products.html">Nullam semper elementum</a></li>
								<li class="active"><a href="products.html">Phasellus ultricies</a></li>
								<li><a href="products.html">Donec laoreet dui</a></li>
								<li><a href="products.html">Nullam semper elementum</a></li>
								<li><a href="products.html">Phasellus ultricies</a></li>
								<li><a href="products.html">Donec laoreet dui</a></li>
							</ul>
							<br/>
							<ul class="nav nav-list below">
								<li class="nav-header">MANUFACTURES</li>
								<li><a href="products.html">Adidas</a></li>
								<li><a href="products.html">Nike</a></li>
								<li><a href="products.html">Dunlop</a></li>
								<li><a href="products.html">Yamaha</a></li>
							</ul>
						</div>
						<div class="block">
							<h4 class="title">
								<span class="pull-left"><span class="text">Randomize</span></span>
								<span class="pull-right">
									<a class="left button" href="#myCarousel" data-slide="prev"></a><a class="right button" href="#myCarousel" data-slide="next"></a>
								</span>
							</h4>
							<div id="myCarousel" class="carousel slide">
								<div class="carousel-inner">
									<div class="active item">
										<ul class="thumbnails listing-products">
											<li class="span3">
												<div class="product-box">
													<p><a href="product_detail.html"><img src="http://image.thefingers.co.kr/diyitem/webimage/list120/00/C000008040.jpg"/></a></p>
													<a href="product_detail.html" class="title">홀리데이 밍크 드롭 귀걸이</a><br/>
													<a href="products.html" class="category">Sara and Rosa</a>
													<p class="price">15,900 원</p>
												</div>
											</li>
										</ul>
									</div>
									<div class="item">
										<ul class="thumbnails listing-products">
											<li class="span3">
												<div class="product-box">
													<span class="sale_tag"></span>
													<p><a href="product_detail.html"><img src="http://image.thefingers.co.kr/diyitem/webimage/list120/00/C000008255.jpg"/></a></p>
													<a href="product_detail.html" class="title">크리스마스 드라이플라워박스</a><br/>
													<a href="products.html" class="category">SANSANGGOT</a>
													<p class="price">34,900원</p>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>						
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
					window.open("../buyer/obill", 'window',
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