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
		<link href="<c:url value='/resources/bootstrap/css/bootstrap.min.css' />" rel="stylesheet">      
		<link href="<c:url value='/resources/bootstrap/css/bootstrap-responsive.min.css' />" rel="stylesheet">		
		<link href="<c:url value='/resources/themes/css/bootstrappage.css' />" rel="stylesheet"/>
		
		<!-- global styles -->
		<link href="<c:url value='/resources/themes/css/flexslider.css' />" rel="stylesheet"/>
		<link href="<c:url value='/resources/themes/css/main.css' />" rel="stylesheet"/>

		<!-- scripts -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> <!-- 추가 -->
		<script src="<c:url value='/resources/themes/js/jquery-1.7.2.min.js' />"></script>
		<script src="<c:url value='/resources/bootstrap/js/bootstrap.min.js' />"></script>				
		<script src="<c:url value='/resources/themes/js/superfish.js' />"></script>	
		<script src="<c:url value='/resources/themes/js/jquery.scrolltotop.js' />"></script>
		<!--[if lt IE 9]>			
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="themes/js/respond.min.js"></script>
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
			<img class="pageBanner" src="<c:url value='/resources/themes/images/pageBanner.png' />" alt="New products" >
				<h4><span>Shopping Cart</span></h4>
			</section>
			<section class="main-content">				
				<div class="row">
					<div class="span9">					
						<h4 class="title"><span class="text"><strong>Your</strong> Cart</span></h4>
						
						
					<!------------------------ *** 장바구니 공사 !!! *** ------------------------->
						
						
						
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
									<th><input type="checkbox" id="checkall" 
										onclick="allChk(this);" checked="checked"></th>
									<th>Image</th>
									<th>Product Name</th>
									<th>Option</th>
									<th>Unit Price</th>
									<th>Quantity</th>
									<th>Total</th>
									<th>Order</th>
								</tr>
							</thead>
							
							
							<tbody><!-- 본문이 들어가는 행의 묶음-->
								<c:forEach var="vo" items="${cartList}">
									<tr>
										<td><input type="checkbox" value="${vo.c_no}" name="RowCheck"
												class="checkbox" checked="checked">
										</td>
										
										<td><a href="../buyer/pDetail?p_no=${vo.p_no }"><img src="${vo.p_img}" style="width: 50px" /></a></td>
										
										<td><a href="../buyer/pDetail?p_no=${vo.p_no }">${vo.p_name }</a></td>
							            <!-- 이름 -->
							            
							            <td>${vo.o_cont }</td>
							            <!-- 옵션내용 -->
							            
							            <td>${vo.p_price }</td>
							            <!--  가격 -->
							            
										<td class="form-inline">
										<!-- 수량 -->
						                  <input style="width: 40px;" value="${vo.buy_cnt }"  class="buy_cnt" type="number">
						                  <%-- <input type="hidden" value="${vo.c_no}" name="c_no"> <span> --%>
						                  <input type="button" value="수정" class="changeCnt"><!-- </span> -->
						                
											<%-- <form action="updateCartBuyCnt" method="get">
												<input style="width: 20px;" value="${vo.buy_cnt }" name="buy_cnt">
												<input type="hidden" value="${vo.c_no}" name="c_no">
												<span><input type="submit" value="수정"></span>
											</form> --%>
										
										
										<td class="pricePerCount">${vo.p_price * vo.buy_cnt }
										<%-- 	<input type="hidden" value=${vo.p_price * vo.buy_cnt } class="CartTotal"> --%>
										</td>
										
										<td>
											<form action="/shop/buyer/OneCartTossOrder" method="get">
									         	<input type="hidden" name="c_no" value="${vo.c_no}">
									         	<input type="submit" value="주문하기">
								         	</form>
							         	</td>
									</tr>
									<!--http://idevsigner.tistory.com/6  -->
								</c:forEach>
							
							
							<%-- 	
								<tr>
									<td><input type="checkbox" value="option1"></td>
									<td><a href="product_detail.html"><img alt="" src="<c:url value='/resources/themes/images/ladies/9.jpg' />"></a></td>
									<td>Fusce id molestie massa</td>
									<td><input type="text" placeholder="1" class="input-mini"></td>
									<td>$2,350.00</td>
									<td>$2,350.00</td>
								</tr>	
										  
								<tr>
									<td><input type="checkbox" value="option1"></td>
									<td><a href="product_detail.html"><img alt="" src="<c:url value='/resources/themes/images/ladies/1.jpg' />"></a></td>
									<td>Luctus quam ultrices rutrum</td>
									<td><input type="text" placeholder="2" class="input-mini"></td>
									<td>$1,150.00</td>
									<td>$2,450.00</td>
								</tr>
								
								<tr>
									<td><input type="checkbox" value="option1"></td>
									<td><a href="product_detail.html"><img alt="" src="<c:url value='/resources/themes/images/ladies/3.jpg' />"></a></td>
									<td>Wuam ultrices rutrum</td>
									<td><input type="text" placeholder="1" class="input-mini"></td>
									<td>$1,210.00</td>
									<td>$1,123.00</td>
								</tr>
								 --%>
								
								<tr>
									<td>&nbsp;</td><!-- 공백(스페이스 한 칸)  -->
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;<!-- <strong>$400,000</strong> --></td>
									
								</tr>		  
							</tbody>
						</table>
						<%-- <div>
							총 구매 가격 :
							<!-- 총 가격 -->
							<input id="price" value="<fmt:formatNumber value="0" groupingUsed="true"/>" readonly="readonly" type="number" step="100" style="width: 100px;background-color: transparent ">
						</div> --%>
<!-- 	<input type="button" value="장바구니에서 삭제" class="deleteall"> -->

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
						
						
						
					<!------------------------ *** 장바구니 공사 !!! *** ------------------------->
						
						
						
						
					<!-- 	
						<h4>What would you like to do next?</h4>
						<p>Choose if you have a discount code or reward points you want to use or would like to estimate your delivery cost.</p>
						<label class="radio">
							<input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
							Use Coupon Code
						</label>
						<label class="radio">
							<input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
							Estimate Shipping &amp; Taxes
						</label> -->
						<hr>
						<p class="cart-total right">
						
						
							<strong>Sub-Total </strong>:
							<!-- 총 가격 -->
							<!-- <input id="price" value="0" readonly="readonly" type="number" step="100" style="width: 100px;background-color: transparent "> -->
							<input id="price" value="<fmt:formatNumber value="0" groupingUsed="true"/>" readonly="readonly" type="number" step="100" style="width: 70px;background-color: transparent" dir="rtl">
					
						 	<br><!-- 
							<strong>Eco Tax (-2.00)</strong>: $2.00<br>
							<strong>VAT (17.5%)</strong>: $17.50<br> -->
							<strong>Total </strong>: 
							<input value="0" id="newtotal" readonly="readonly" style="width: 70px;background-color: transparent" type="number" step="100" dir="rtl"> <br>
						</p>
						<hr/>
						<!-- <p class="buttons center">				
							<button class="btn" type="button">Update</button>
							<button class="btn" type="button">Continue</button>
							<button class="btn btn-inverse" type="submit" id="checkout">Checkout</button>
						</p> -->
					
					<form action="/shop/buyer/cartTossOrder" method="get" id="toOrder" class="right">	
							<!-- 주문하기  -->
							<input type="button" value="장바구니에서 삭제" class="deleteall btn">
							<input type="hidden" value="" id="hiddenCartNums" name="c_no">
							<input type="button" class="btn " value="쇼핑 계속하기" id="backToList" />
							<input type="button" class="btn btn-inverse" value="선택 주문하기" id="CartToController" /> <!-- 이것만 form 영향을 받는다. -->
							
					</form>
											
					</div>
					<div class="span3 col">
						<!-- <div class="block">	
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
						</div> -->
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
						<p class="logo"><img src="<c:url value='/resources/themes/images/logo.png" class="site_logo' />" alt=""></p>
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
		<a href="javascript:window.location.replace('buyer/selectCart');"></a>
		<!-- 김태훈 백버튼 리프레시 -->
		<input type="hidden" id="refreshed" value="no" style="display: none">
		<script src="resources/themes/js/common.js"></script>
		<script>
			$(document).ready(function() {
				$('#checkout').click(function (e) {
					document.location.href = "checkout.html";
					document.location.replace("../");
				})
			});
		</script>	
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 <script>
 
 
   // 주문버튼 이벤트 처리
   $("#CartToController").click(function(){
      var chkObj = document.getElementsByName("RowCheck");
      var rowCnt = chkObj.length;
      var totalval = 0;
      var data = [];
      for (var i = 0; i < rowCnt; i++) {
         if (chkObj[i].checked == true) {
            /* console.log("체크된 카트 번호 : " + chkObj[i].value); */
            data[data.length] = chkObj[i].value;
         } // end if
      }   // end for
      console.log("배열객체화된 카트 번호 : "+data);
      $("#hiddenCartNums").val(data);
      $("#toOrder").submit();
   }); // end CartToController function
   
      var finalCartPrice = 0;
      price();
      price2();
      function price() {
         finalCartPrice = 0;
         var chkObj = document.getElementsByName("RowCheck");

         var rowCnt = chkObj.length - 1;
         for (var i = 0; i <= rowCnt; i++) {
            var text1 = chkObj[i].parentNode.parentNode.children[6].innerText * 1;// String 에서 숫자로 변환
            finalCartPrice += text1;
         }
         $("#price").val(finalCartPrice);
      }
      
      ///////////////////체크박스 상관없이 토탈 계산/////////////////////////
      function price2() {
         finalCartPrice = 0;
         var chkObj = document.getElementsByName("RowCheck");

         var rowCnt = chkObj.length - 1;
         for (var i = 0; i <= rowCnt; i++) {
            var text1 = chkObj[i].parentNode.parentNode.children[6].innerText * 1;// String 에서 숫자로 변환
            finalCartPrice += text1;
         }
         $("#newtotal").val(finalCartPrice);
      }
      ////////////////////////////////////////////
      
      var inputs = $('input[type="checkbox"]')
      
      inputs.change(function(){
         finalCartPrice = 0;
         var chkObj = document.getElementsByName("RowCheck");
         var rowCnt = chkObj.length-1;
         for (var i = 0; i <= rowCnt; i++) {
            if (chkObj[i].checked == true) {
               var text1 = chkObj[i].parentNode.parentNode.children[6].innerText * 1;// 체크된 체크박스에서 가격 찾아냄
               console.log(chkObj[i].parentNode.parentNode.children[6].innerText * 1)
               finalCartPrice += text1;
               console.log('finalCartPrice = ' + finalCartPrice);
            } else {
                $("#checkall").prop('checked', false);
            }
         } // end for
         $("#price").val(finalCartPrice);
      });
      
      
         
            
      function updateTotalPrice() {
         console.log('======================');
               finalCartPrice = 0;
               var chkObj = document.getElementsByName("RowCheck");
               var rowCnt = chkObj.length-1;
               for (var i = 0; i <= rowCnt; i++) {
                  if (chkObj[i].checked == true) {
                     var text1 = chkObj[i].parentNode.parentNode.children[6].innerText * 1;// 체크된 체크박스에서 가격 찾아냄
                     console.log(chkObj[i].parentNode.parentNode.children[6].innerText * 1)
                     finalCartPrice += text1;
                     console.log('finalCartPrice = ' + finalCartPrice);
                  } // end if
               } // end for
               $("#price").val(finalCartPrice);
               
            } // end updateTotalPriceFunction

      /////////////////////////////////////////////////////////
      // 체크박스 올체크
      function allChk(obj) {
         var chkObj = document.getElementsByName("RowCheck");
         var rowCnt = chkObj.length - 1;
         var check = obj.checked;
         if (check) {
            for (var i = 0; i <= rowCnt; i++) {
               if (chkObj[i].type == "checkbox")
                  chkObj[i].checked = true;
            }
         } else {
            for (var i = 0; i <= rowCnt; i++) {
               if (chkObj[i].type == "checkbox") {
                  chkObj[i].checked = false;
                  $("#price").val(0)
               }
            }
         }
      }

      // 장바구니 삭제 이벤트
      $('.deleteall') .on("click",
                  function(event) {
                     var tb = $(this).attr('title');
                     var sel = false;
                     var ch = $('input[name="RowCheck"]:checked');
                     var c = confirm('정말로 삭제하시겠어요?');
                     if (c) {
                        ch.each(function() {
                                 var $this = $(this);
                                 if ($this.is(':checked')) {
                                    sel = true; //set to true if there is/are selected row
                                    $this.parents('tr').fadeOut(function() {
                                                   $.ajax({
                                                            type : 'post',
                                                            url : 'deleteCart',
                                                            headers : {
                                                               'Accept' : 'application/json',
                                                               'Content-Type' : 'application/json'
                                                            },
                                                            data : $('input[name="RowCheck"]:checked').val(),
                                                            success : function(result) {
                                                               if (result == 1) {
                                                                  $("#price").val(0)
                                                                 							// 장바구니 삭제시 Total 금액 수정
																							         finalCartPrice = 0;
																							         var chkObj = document.getElementsByName("RowCheck");
																							
																							         var rowCnt = chkObj.length - 1;
																							         for (var i = 0; i <= rowCnt; i++) {
																							            var text1 = chkObj[i].parentNode.parentNode.children[6].innerText * 1;// String 에서 숫자로 변환
																							            finalCartPrice += text1;
																							         }
																							         $("#newtotal").val(finalCartPrice);
																							      		
								                                                                
                                                                  
                                                               } else {

                                                               }
                                                            }
                                                            
                                                         });
                                                  $this
                                                         .remove(); //remove row when animation is finished
                                                });
                                 }
                              });
                        if (!sel)
                           alert('체크박스를 선택하세요');
                     }
                     
                     return false;
                  });

      // 수량수정 이벤트
         $('.changeCnt').on("click",function() {
            var cnts = document.getElementsByName("buy_cnt");
               // 몇번째 값인지 찾기
               // c_no 값 찾기 ( 라인 위치 달라지면 에러남 )
               var c_no = this.parentNode.parentNode.childNodes[1].childNodes[0].value;
               /* console.log(c_no);  */
               // buy_cnt 값 찾기 ( 라인 위치 달라지면 에러남 )
               var buy_cnt = this.parentNode.parentNode.childNodes[17].childNodes[3].value;
                  /* console.log(buy_cnt); */ 
                  // td 값 : childNodes[0];
               var pricePerCnt = this.parentNode.parentNode.childNodes[18];
                  /* console.log(pricePerCnt); */
               $.ajax({
                 type: "get",
                 url: "updateCartBuyCnt",
                 headers : {
                  'Accept' : 'application/json',
                  'Content-Type' : 'application/json'
               },
               dataType: "json",
                 data: {c_no: c_no, buy_cnt: buy_cnt},
                 success: function(data){
                    if (data >= 0){
                       pricePerCnt.innerHTML = data;
                       updateTotalPrice();
                       price2();
                    }
                 },
             });  
      });
      
      $('.checkbox').click(function() {
         updateTotalPrice();
      });
      
      $('#backToList').click(function() {
    	 location = '../buyer/main' 
      });
      
   // 김태훈 백버튼 리프레시 코드
  	onload=function(){
  	var e=document.getElementById("refreshed");
  	if(e.value=="no")e.value="yes";
  	else{e.value="no";location.reload();}
  	}

   </script>
		
			
    </body>
</html>/body>
</html>