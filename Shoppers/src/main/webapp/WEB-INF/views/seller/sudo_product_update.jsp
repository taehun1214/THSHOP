<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>H-Shopper : 특별함을 전하는</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">

 <!--  <link href="//netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" media="screen">  -->
    <link href="<c:url value='/resources/build/imgur.min.css'/>" rel="stylesheet" media="screen"><!-- *** 수정 *** -->
    
    <style>

        .col-md {
            margin: 0 auto;
            max-width: 500px
        }
    </style> 

	<style>
		#opTable1 {
	   		 width: 80px;
		}
		#opTable2 {
	   		 width: 120px;
		}
		#opTable3{
	   		 width: 40px;
		}

	</style>


<style type="text/css">
	.pop-layer {
		display: none;
		position: absolute;
		top: 50%;
		left: 50%;
		width: 410px;
		height: auto;
		background-color: #fff;
		border: 5px solid #3571B5;
		z-index: 10;
	}
	
	
	.pop-layer .pop-container {
		padding: 20px 25px;
	}
	
	.pop-layer p.ctxt {
		color: #666;
		line-height: 25px;
	}
	
	.pop-layer .btn-r {
		width: 100%;
		margin: 10px 0 20px;
		padding-top: 10px;
		border-top: 1px solid #DDD;
		text-align: right;
	}
	
	a.cbtn {
		display: inline-block;
		height: 25px;
		padding: 0 14px 0;
		border: 1px solid #304a8a;
		background-color: #3f5a9d;
		font-size: 13px;
		color: #fff;
		line-height: 25px;
	}
	
	a.cbtn:hover {
		border: 1px solid #091940;
		background-color: #1f326a;
		color: #fff;
	}
</style>




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
<script src="<c:url value='/resources/themes/js/jquery.scrolltotop.js' />"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="<c:url value='/resources/build/imgur.min.js'/>"></script>

<script>
$(function() {
	$("select[name=p_cate1]").change(function() {
		var temp = $("select[name=p_cate2]");
		var p_cate1 = $(this).val();
		temp.children().remove();
		temp.append('<option value="none">--------</option>');
		
		if (p_cate1 == 'home_deco') {
			temp.append('<option value="furniture">가구</option>');
			temp.append('<option value="pottery">도자기</option>');
			temp.append('<option value="lamp">조명</option>');
		}

		if (p_cate1 == 'candle_diffuser') {
			temp.append('<option value="candle">캔들</option>');
			temp.append('<option value="diffuser">디퓨저</option>');
			temp.append('<option value="aromatic oils">아로마오일</option>');
		}

		if (p_cate1 == 'art_fancy') {
			temp.append('<option value="picture">사진</option>');
			temp.append('<option value="fancy">문구</option>');
			temp.append('<option value="paper">페이퍼</option>');
		}

		if (p_cate1 == 'jewellery') {
			temp.append('<option value="earring">귀걸이</option>');
			temp.append('<option value="necklace">목걸이</option>');
			temp.append('<option value="ring">반지</option>');
		}

	});
});


//옵션 양식 추가 및 삭제
$(function() {
	$('#addOption').click(function() {
			$('#optionTable > tbody:last').append('<tr id="removableTr"><td><input id="opTable1" class="detail_i" type="text" name="o_title" placeholder="옵션제목" /></td>'
					+ '<td><input id="opTable2" class="detail_i" type="text" name="o_cont" placeholder="옵션내용" /></td>'
					+ '<td><input id="opTable3" type="number" name="o_stock" placeholder="옵션재고" value="0" /></td></tr>');	
	});
	
	$('#delOption').click(function() {
			$('#optionTable > tbody:last > tr:last').remove();

	});

});



/* var y = 1; */
// 이미지 양식 추가 및 삭제
$(function() {
	var y = $('#asdf').val();
	$('#addImage').click(function() {
		y++;		
			$('.append').append('<div class="plus" ><div class="form-inline"><input class="input-xlarge" type="text" class="i_set" id="'+ y + '_img" name="i_img" placeholder="상세 이미지"/>'
					+'<input id="btn'+ y +'" class="btn" data-btn="'+y+'" type="button" value="파일첨부"  onclick="layer_open(\'layer1\');return false;"></div><div>'
					+'<textarea class="input-xlarge" rows="5" cols="65" class="i_set" name="i_cont" placeholder="이미지에 대한 설명을 넣어주세요..."> </textarea></div></div>');			
	});
	
	$('#delImage').click(function() {
		if(y > 1) {
			y--;
			/* $('#imageTable > tbody:last > tr:last').remove(); */
			$('.form-inline:last').remove();
			$('.input-xlarge:last').remove();
		};
	});
});
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* 
 $(document).ready(function(){
	$('.append_btn').click(function() {
		if ('.append_btn'. == "#" +x+' img')
		 console.log("#" +x+' img') 
		x = x;
		 console.log("#" +x+' img') 
	});
	
});  
 */
/* 
$(document).ready(function(){
    $('#btn'+ x).click(function() {
		 console.log("#" +x+' img') 
		x = x;
		 console.log("#" +x+' img') 
	});
});
 */


/////////////////////////////////////////////////////////////////////////////////////////////////////////////
var x=0;
// 이미지 관련 처리
    
    $(document).ready(function(){
    	 
		$('#btn0').click(function() {
			 console.log("#" +x+' img') 
			x = 0;
			 console.log("#" +x+' img') 
		});
		
	  
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
    	$('#target').on('click','.form-inline .btn',function(){
    		console.log($(this));
    		console.log("btn:"+ $(this).data("btn"));
    		var btnnum = $(this).data("btn");
    		x= btnnum;
    	});
    	
 /*    	$('.form-inline').on('click','.btn',function(){
    		console.log($(this));
    		console.log($(this).data("btn"));
    	});
    
	    $('#btn1').click(function() {
			 console.log("#" +x+' img') 
			x = 1;
			 console.log("#" +x+' img') 
		});
    
 	    $('#btn2').click(function() {
 			 console.log("#" +x+' img') 
 			x = 2;
 			 console.log("#" +x+' img') 
 		});
     
 	    $('#btn3').click(function() {
 			 console.log("#" +x+' img') 
 			x = 3;
 			 console.log("#" +x+' img') 
 		}); */
     }); 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////

    $(document).ready(function() { 
		var feedback = function(res) {
			if (res.success === true) {
				document.querySelector('.status').classList.add('bg-success');
				/* document.querySelector('.status').innerHTML = res.data.link; */
				/*  console.log(res.data.link);  */// F12 로그
				  console.log("#" +x+' img') // #0 img
	              /*   $('#'+x+' img').val(res.data.link);  */
				  $('#'+x+'_img').val(res.data.link); 
				  $('#layer1').fadeOut(50);  // TODO : 입력시 사라지게 하기 ***
				
			/* 	alert("!!!"); */
				 
			}
			
		};
		
		new Imgur({
			clientid : '7ff152b0e154c31', /* http://imgur.com/ 에서 아이디를 만들어 발급했음  */
			callback : feedback
		// TODO: 사진을 업로드하면 사진은 imgur서버상에 존재... 그러나 웹 사이트 계정에선 확인 불가...
		});
    }); 
   
   $(function() {
	   $("#btn_insert").click(function() {
		  if (confirm("정말 등록하시겠습니까?") == true) {
			  //$("#pRegister").submit();
			  $("#pUpdate").find('[type="submit"]').trigger('click');
		  } 
	   });
	   $("#btn_reset").click(function() {
		   $("form").each(function() {  
	            this.reset();  
	         });  
	   });
   });
   
   // ****** 이미지로더

</script>

<script type="text/javascript">

	function layer_open(el) {
		var temp = $('#' + el); //레이어의 id를 temp변수에 저장
		var bg = temp.prev().hasClass('bg'); //dimmed 레이어를 감지하기 위한 boolean 변수
		if (bg) {
			$('.layer').fadeIn();
		} else {
			temp.fadeIn(); //bg 클래스가 없으면 일반레이어로 실행한다.
		}
		// 화면의 중앙에 레이어를 띄운다.
		if (temp.outerHeight() < $(document).height())
			temp.css('margin-top', '-' + temp.outerHeight() / 2 + 'px');
		else
			temp.css('top', '0px');
		if (temp.outerWidth() < $(document).width())
			temp.css('margin-left', '-' + temp.outerWidth() / 2 + 'px');
		else
			temp.css('left', '0px');
		temp.find('a.cbtn').click(function(e) {
			if (bg) {
				$('.layer').fadeOut();
			} else {
				temp.fadeOut(); //'닫기'버튼을 클릭하면 레이어가 사라진다.
			}
			e.preventDefault();
		});
		$('.layer .bg').click(function(e) {
			$('.layer').fadeOut();
			e.preventDefault();
		});
	}
</script>

</head><!-- -------------------------------------------------------------- -->


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
							<li><a href="sellerHome?s_id=${s_login_id}">My Home</a></li><!-- 마이홈은 판매자홈 말하는거임 -->
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
			<img class="pageBanner"
				src="<c:url value='/resources/themes/images/pageBanner.png' />"
				alt="New products">
			<h4>
				<span>Product Update</span>
			</h4>
		</section>
		<section class="main-content">
			<div class="row">
				<div class="span12">
					<div class="accordion" id="accordion2">
					
						<!-- -------------------------------------------------------------- -->
						<!-- -------------------------------------------------------------- -->
						<!-- -------------------------------------------------------------- -->
					
					
					
					
					<div class="accordion-group">
					
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse"
									data-parent="#accordion2" href="#collapseOne">Update Product</a>
							</div>
							<div id="collapseOne" class="accordion-body in collapse">
								<div class="accordion-inner">
									<div class="row-fluid">
									<h4 class="title"><span class="text"><strong>Update</strong> Form</span></h4>
									
									<!-- <form action="b_register_result" method="post" id="fileForm1" role="form">** submit -->
									<form id="pUpdate" action="pUpdate" method="post">		<!-- TODO : ****** -->
									
										<!-- ######################################## -->
										<!-- 왼쪽 -->
										<div class="span6">
											
											
											
											<!-- hidden type으로 입력될 값들... 판매자 이름은 로그인 정보와 합친 후 수정  -->
											<!-- 상품 번호 -->
											<input type="hidden" name="p_no" value="${productVO.p_no}" />
											<!-- 판매자 이름 -->
											<input type="hidden" name="s_id" value="${s_login_id}" />
											<!-- 관심상품 -->
											<input type="hidden" name="p_favo" value="0" />
											<!-- 판매량 -->
											<input type="hidden" name="p_sale_cnt" value="0" />
											
											<!-- -------------------------------------------------------------- -->
											
										 
											<div class="control-group">
												<label>카테고리</label> 
												<div class="controls">
													<select name="p_cate1" class="input-xlarge">
														<option value="none">--------</option>
														
														<c:if test="${productVO.p_cate1 eq 'home_deco' }">														
														<option value="home_deco" selected>홈/데코</option>
														<option value="candle_diffuser" >캔들/디퓨저</option>
														<option value="art_fancy" >아트/팬시</option>
														<option value="jewellery" >쥬얼리</option>
														</c:if>
														<c:if test="${productVO.p_cate1 eq 'candle_diffuser' }">
														<option value="home_deco">홈/데코</option>
														<option value="candle_diffuser" selected>캔들/디퓨저</option>
														<option value="art_fancy" >아트/팬시</option>
														<option value="jewellery" >쥬얼리</option>
														</c:if>
														<c:if test="${productVO.p_cate1 eq 'art_fancy' }">
														<option value="home_deco">홈/데코</option>
														<option value="candle_diffuser">캔들/디퓨저</option>
														<option value="art_fancy" selected>아트/팬시</option>
														<option value="jewellery" >쥬얼리</option>
														</c:if>
														<c:if test="${productVO.p_cate1 eq 'jewellery' }">
														<option value="home_deco">홈/데코</option>
														<option value="candle_diffuser" >캔들/디퓨저</option>
														<option value="art_fancy" >아트/팬시</option>
														<option value="jewellery" selected>쥬얼리</option>
														</c:if>

													</select> <br/>
													<select name="p_cate2" class="input-xlarge">
														<option value="none">--------</option>
														
														<c:if test="${productVO.p_cate1 eq 'home_deco' and productVO.p_cate2 eq 'furniture'}">
														<option value="furniture" selected>가구</option>
														<option value="pottery">도자기</option>
														<option value="lamp">조명</option>
														</c:if>
														<c:if test="${productVO.p_cate1 eq 'home_deco' and productVO.p_cate2 eq 'pottery'}">
														<option value="furniture">가구</option>
														<option value="pottery" selected>도자기</option>
														<option value="lamp">조명</option>
														</c:if>
														<c:if test="${productVO.p_cate1 eq 'home_deco' and productVO.p_cate2 eq 'lamp'}">
														<option value="furniture">가구</option>
														<option value="pottery">도자기</option>
														<option value="lamp" selected>조명</option>
														</c:if>
														
														<c:if test="${productVO.p_cate1 eq 'candle_diffuser' and productVO.p_cate2 eq 'candle'}">
														<option value="candle" selected>캔들</option>
														<option value="diffuser">디퓨저</option>
														<option value="aromatic oils">아로마오일</option>
														</c:if>
														<c:if test="${productVO.p_cate1 eq 'candle_diffuser' and productVO.p_cate2 eq 'diffuser'}">
														<option value="candle">캔들</option>
														<option value="diffuser" selected>디퓨저</option>
														<option value="aromatic oils">아로마오일</option>
														</c:if>
														<c:if test="${productVO.p_cate1 eq 'candle_diffuser' and productVO.p_cate2 eq 'aromatic oils'}">
														<option value="candle">캔들</option>
														<option value="diffuser">디퓨저</option>
														<option value="aromatic oils" selected>아로마오일</option>
														</c:if>
														
														<c:if test="${productVO.p_cate1 eq 'art_fancy' and productVO.p_cate2 eq 'picture'}">
														<option value="picture" selected>사진</option>
														<option value="fancy">문구</option>
														<option value="paper">페이퍼</option>
														</c:if>
														<c:if test="${productVO.p_cate1 eq 'art_fancy' and productVO.p_cate2 eq 'fancy'}">
														<option value="picture">사진</option>
														<option value="fancy" selected>문구</option>
														<option value="paper">페이퍼</option>
														</c:if>
														<c:if test="${productVO.p_cate1 eq 'art_fancy' and productVO.p_cate2 eq 'paper'}">
														<option value="picture">사진</option>
														<option value="fancy">문구</option>
														<option value="paper" selected>페이퍼</option>
														</c:if>
														
														<c:if test="${productVO.p_cate1 eq 'jewellery' and productVO.p_cate2 eq 'earring'}">
														<option value="earring" selected>귀걸이</option>
														<option value="necklace">목걸이</option>
														<option value="ring">반지</option>
														</c:if>
														<c:if test="${productVO.p_cate1 eq 'jewellery' and productVO.p_cate2 eq 'necklace'}">
														<option value="earring">귀걸이</option>
														<option value="necklace" selected>목걸이</option>
														<option value="ring">반지</option>
														</c:if>
														<c:if test="${productVO.p_cate1 eq 'jewellery' and productVO.p_cate2 eq 'ring'}">
														<option value="earring">귀걸이</option>
														<option value="necklace">목걸이</option>
														<option value=ring selected>반지</option>
														</c:if>
													</select>
													<!-- <input class="input-xlarge" type="text" name="b_name" id="txt"
														required placeholder="홍길동" /> -->
												</div>
											</div><!-- ### 완료 ###-->
											 
											<!-- -------------------------------------------------------------- -->
											
											<div class="control-group">
												<label for="p_name">작품명</label> 
												<div class="controls">
													<input class="input-xlarge" type="text" name="p_name" value=${productVO.p_name } required />
												</div>
											</div><!-- ### 완료 ###-->
											<!-- -------------------------------------------------------------- -->
											
											 <div class="control-group">
											 	<label for="p_price">작품가격</label> 
											 	<div class="controls">
											 		<input class="input-xlarge" type="number" name="p_price" value=${productVO.p_price } required />
												</div>
											 </div><!-- ### 완료 ###-->
											 
											<!-- -------------------------------------------------------------- -->
											
											 <div class="control-group">
												<label for="p_stock">재고량</label> <!-- TODO -->
												<div class="controls">
													<input class="input-xlarge" type="number" name="p_stock" value=${productVO.p_stock } required />
												</div> <!-- TODO :  -->
											 </div><!-- ### 완료 ###-->

											
											<!-- -------------------------------------------------------------- -->
											
											<div class="control-group">
												<label for="b_phone">할인율</label>
												<div class="controls">
													<input class="input-xlarge" type="number" name="p_dis_rate" value=${productVO.p_dis_rate } />
												</div>
											</div>
											
											<!-- -------------------------------------------------------------- -->
										</div>










										<!-- ######################################## -->
										<!-- 오른쪽 -->
										<div class="span6">
										
											<div class="control-group">
												<label>옵션</label>
												<div class="controls input-xlarge form-inline">	<!-- **** -->
													
													<table id="optionTable">
														<c:if test="${empty optionList }">
														<tr id="defaultTr">
															<td><input id="opTable1" class="detail_i" type="text" name="o_title" placeholder="옵션제목" /></td>
															<td><input id="opTable2" class="detail_i" type="text" name="o_cont"  placeholder="옵션내용" /></td>
															<td><input id="opTable3" type="number" name="o_stock"  value="0" placeholder="옵션재고" /></td>
														</tr>
														</c:if>
														
														<c:if test="${not empty optionList }">
														<c:forEach var="oList" items="${optionList }" end="0">
														<tr id="defaultTr">
															<td><input id="opTable1" class="detail_i" type="text" name="o_title" value=${oList.o_title } placeholder="옵션제목" /></td>
															<td><input id="opTable2" class="detail_i" type="text" name="o_cont"  value=${oList.o_cont } placeholder="옵션내용" /></td>
															<td><input id="opTable3" type="number" name="o_stock"  value=${oList.o_stock } placeholder="옵션재고" /></td>
														</tr>
														</c:forEach>
														</c:if>
														
														<tbody>
														<c:if test="${not empty optionList }">
														<c:forEach var="oList" items="${optionList }" begin="1">
														<tr id="removableTr">
															<td><input id="opTable1" class="detail_i" type="text" name="o_title" value=${oList.o_title } placeholder="옵션제목" /></td>
															<td><input id="opTable2" class="detail_i" type="text" name="o_cont"  value=${oList.o_cont } placeholder="옵션내용" /></td>
															<td><input id="opTable3" type="number" name="o_stock"  value=${oList.o_stock } placeholder="옵션재고" /></td>
														</tr>
														</c:forEach>
														</c:if>
														</tbody>
														
													</table>
													<button id="addOption" class="btn" type="button">옵션추가</button>
													<button id="delOption" class="btn" type="button">옵션삭제</button>
													
												</div>
											</div>	
									
											
																						
										<!-- -------------------------------------------------------------- --> 
										
										
											 <div class="control-group">
											 <br>
											 	<label for="b_email">메인 이미지</label>
												
												<div class="controls">
													
																	
													<!-- <label>대표 이미지</label><br/> -->
													<div class="form-inline">
														<input class="input-xlarge" type="text" class="i_set" id="0_img" name="p_img" value=${productVO.p_img } placeholder="메인 이미지 " required/>
														
														<!-- **레이어 팝업** -->
	
														<a href="#" class="btn-example" onclick="layer_open('layer1');return false;">
														<input type="button" id="btn0" value="파일첨부" class="btn" ></a>
														
															<div id="layer1" class="pop-layer">
																<div class="pop-container">
																	<div class="pop-conts">
																	
																	
																	
																		<p class="ctxt mb20">Imgur Image Loader.</p><br>
																		
																		
																		<div class="col-md">
																       		<div class="dropzone"></div>
																        </div>
																			
																		
																		<div class="btn-r">
																			<a href="#" class="cbtn">Close</a>
																		</div>
																
																	</div>
																</div>
															</div>
	
														
														<!-- **레이어 팝업** -->
													</div>
												</div>
											 </div>
											 	
													<br/>
											<div class="control-group parent" id="target">
											 	<label >상세 이미지</label>
											 	<input type="hidden" id="asdf" value="${imgListSize}" />
												<div class="controls append">		
													<c:if test="${empty imageList }">
														<div class="form-inline">
														<input class="input-xlarge" type="text" class="i_set btn" id="1_img" name="i_img" placeholder="상세 이미지"/>
														
														<input id="btn1" type="button" data-btn="1" class="btn" value="파일첨부"  onclick="layer_open('layer1');return false;">
														<!-- **레이어 팝업** -->
	
														<!-- **레이어 팝업** -->
													</div>
													
													<div>
														<textarea class="input-xlarge" rows="5" cols="65" class="i_set" name="i_cont" placeholder="이미지에 대한 설명을 넣어주세요..."> </textarea>
													</div>
													</c:if>
													
													
													
													<c:if test="${not empty imageList }">
													
													<c:forEach var="iList" items="${imageList }">	
														<div class="form-inline">
															<input class="input-xlarge" type="text" class="i_set btn" id="1_img" name="i_img" value=${iList.i_img } placeholder="상세 이미지"/>
														
															<input id="btn1" type="button" data-btn="1" class="btn" value="파일첨부"  onclick="layer_open('layer1');return false;">
															<!-- **레이어 팝업** -->
	
															<!-- **레이어 팝업** -->
														</div>
													
														<div>
															<textarea class="input-xlarge" rows="5" cols="65" class="i_set" name="i_cont" placeholder="이미지에 대한 설명을 넣어주세요...">${iList.i_cont }</textarea>
														</div>
														
													</c:forEach>
													
													</c:if>
													
												<!-- 
													<table id="imageTable"  >
													 	<tbody>
														<tr class="form-inline">
														
															<td>
																<div class="form-inline">
																	<input class="input-xlarge" type="text" class="i_set" id="1_img" name="i_img" placeholder="상세 이미지"/>
															</td>
															<td>
																	<input id="btn2" type="button" value="파일첨부"  onclick="layer_open('layer1');return false;">
																	**레이어 팝업**
															</td>
															
														</tr>	
																
																	**레이어 팝업**
																</div>	<br/>
														<tr>			
															<td colsapn="2">		
																	<textarea class="input-xlarge" rows="5" cols="65" class="i_set" name="i_cont" placeholder="이미지에 대한 설명을 넣어주세요..."> </textarea>
															</td>
														</tr>
														</tbody>
													</table>
													 -->
													
												</div>
												
												<button id="addImage" type="button">추가</button>
													<button id="delImage" type="button">삭제</button>
											 </div>
											 
											<br>
										</div>
											
											<button type="submit" class="hide"></button><!-- ***** required 속성을 위해서 form 안에서 submit이 작동되게 해야한다. ***** -->
													
									</form><!--  End -->

								
									</div>
									<hr>
											<div class="actions">
												<!-- 
												<input tabindex="9" class="btn btn-inverse large" type="submit" value="등록">
												<input tabindex="9" class="btn btn-inverse large" type="reset" value="취소">
												 -->
												 <input tabindex="9" id="btn_insert" class="btn btn-inverse large" type="button" value="Commit">
												<input tabindex="9" id="btn_reset" class="btn btn-inverse large" type="button" value="Reset">
												<input onclick="location.href='main'" class="btn btn-inverse" type="button" id="gotoList" value="Home" />
												
											</div>	<br/>
											
								</div>
								
							</div>
									
							
						</div><!-- End  -->
			
						
						
						
						
						
						
	<!-- http://mylko72.maru.net/jquerylab/study/layer-popup.html#  -->					
						
						
					
	<!-- 					
<a href="#" class="btn-example" onclick="layer_open('layer1');return false;">예제-1 보기</a>
	<div id="layer1" class="pop-layer">
		<div class="pop-container">
			<div class="pop-conts">
			
			
			
				<p class="ctxt mb20">Imgur Image Loader.</p><br>
				
				
				<div class="col-md">
		       		<div class="dropzone"></div>
		        </div>
					
				
			<div class="btn-r">
				<a href="#" class="cbtn">Close</a>
			</div>
		
		</div>
	</div>
</div> -->
				
						
						
						
					
						
						
						
						
						<!-- -------------------------------------------------------------- -->
						<!-- -------------------------------------------------------------- -->
						<!-- -------------------------------------------------------------- -->
									
					</div><!-- #### -->
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
						<li><a href="#">pRegister</a></li>
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
	<!-- <script src="/shop01/resources/themes/js/common.js"/></script> -->
</body>
</html>