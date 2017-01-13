<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html lang="en">
<head>
		<meta charset="utf-8">
		<title>Bootstrap E-commerce Templates</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<!--[if ie]><meta content='IE=8' http-equiv='X-UA-Compatible'/><![endif]-->
		<!-- bootstrap -->
		<link href="<c:url value='/resources/bootstrap/css/bootstrap.min2.css'/>" rel="stylesheet"> 
		<link href="<c:url value='/resources/bootstrap/css/bootstrap-responsive.min2.css' />" rel="stylesheet">		
		<link href="<c:url value='/resources/themes/css/bootstrappage.css' />" rel="stylesheet"/>
		
		<!-- global styles -->
		<link href="<c:url value='/resources/themes/css/flexslider.css' />" rel="stylesheet"/>
		<link href="<c:url value='/resources/themes/css/main2.css' />" rel="stylesheet"/>

		<!-- scripts -->
		<script src="<c:url value='/resources/themes/js/jquery-1.7.2.min.js' />"></script>
		<script src="<c:url value='/resources/bootstrap/js/bootstrap.min.js' />"></script>				
		<script src="<c:url value='/resources/themes/js/superfish.js' />"></script>	
		<script src="<c:url value='/resources/themes/js/jquery.scrolltotop.js' />"></script>
		<!--[if lt IE 9]>			
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->
		
<style>
.radio-inline {
  float: left;
  clear: none;
  display: block;
  padding: 2px 1em 0 0;
}

.birth-lbl {
	clear: both;
} 

 label {
 	clear: left;
 }

input[type=radio],
input.radio {
  float: left;
  clear: none;
  margin: 2px 0 0 2px;
}

.emailclass {
	display: none;
}
</style>		
		
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
							<li><a href="#">My Account</a></li>
							<li><a href="cart.html">Your Cart</a></li>
							<li><a href="checkout.html">Checkout</a></li>					
							<li><a href="register.jsp">Login</a></li>		
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
						<span class="text"><strong>구매</strong> 정보</span>
					</h3>
					<form action="#" method="post">
						<input type="hidden" name="next" value="/">
						<fieldset>
							<div class="control-group">
								<label class="control-label"><a href="buyermypage_orderlist" id="test">주문 배송 조회</a></label>

							</div>
							<div class="control-group">
								<label class="control-label"><a href="buyermypage_completelist">구매 내역</a></label>
							</div>
							
							</fieldset>
							
							
				<h3 class="title">
					<span class="text"><strong>개인</strong> 정보</span>
				</h3>
						<fieldset>
							<div class="control-group">
								<label class="control-label"><a
									href="javascript:window.location.reload(true);">개인 정보 수정</a></label>
							</div>
							<div class="control-group">
								<label class="control-label"><a
									href="buyermypage_drop?b_id=${b_login_id }">회원 탈퇴</a></label>
							</div>
							
							<hr>
						</fieldset>
					</form>
				</div> 	
				
				<div id="maindi" class="span7">
					<h3 class="title">
						<span class="text"><strong>개인 </strong>정보 수정</span>
					</h3>
					
					<div class = "firstdiv">
						<label for="b_id_first">아이디</label> 
						<input required name="b_id_first" type="text" class="input-xlarge"
						minlength="4" maxlength="16" id="b_id_first" value="${buyerInfo.b_id }" readonly/>
											
						<label for="b_pw_first">비밀번호 입력</label> 
						<input required name="b_pw_first" type="password" class="input-xlarge"
						minlength="4" maxlength="16" id="b_pw_first" style="font-family: verdana" placeholder="비밀번호" />
						<br/>
						
						<button type="button" id="btnfirst">확인</button>
					</div>
					
			<!-- ///////////////////////////////////////////////////// -->
					
				<section class="main-content" style="display: none;">
					<div class="row">
						<div>
							<div class="accordion" id="accordion2">
													<!-- 구매자 회원가입 -->
						<div class="accordion-group">
<!-- 							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse"
									data-parent="#accordion2" href="#collapseOne">Sign up for Buyer</a>
							</div> -->
							<div id="collapseOne" class="accordion-body in collapse">
								<div class="accordion-inner">
									<div class="row-fluid">
									<h4 class="title"><span class="text"><strong>Update</strong> Form</span></h4>
									<form action="b_register_result" method="post" id="fileForm1" role="form"><!-- ** submit-->
										
										<!-- ######################################## -->
										<!-- 왼쪽 -->
										<div class="span6">
											
											<div class="control-group">
												<label>이름</label> 
												<div class="controls">
													<input class="input-xlarge" type="text" name="b_name" id="b_id"
														readonly value="${buyerInfo.b_id }"/>
												</div>
											</div><!-- ### 완료 ###-->
											 
<!-- 											<div class="control-group">
												<label for="b_id">아이디 &nbsp;&nbsp; 
													<span id="b_duplicationCheckResult"></span> 
												</label> 
												<div class="controls">
													<input class="input-xlarge" type="text" name="b_id"
														id="b_id" placeholder="아이디" required />
												</div>
											</div>### 완료 ### -->
											<!-- -------------------------------------------------------------- -->
											
											<button class="btn" id="btnpwd" type="button">비밀번호 변경</button>
											
											<div>
												<div class="chgpwd" style="display: none;">
												
												 <div class="control-group">
												 	<!-- <label for="b_pw"></label>  -->
												<label for="origin_b_pwd">기존 비밀번호 입력 &nbsp;&nbsp; 
													<span id="b_duplicationCheckResult"></span> 
												</label> 
												 	<div class="controls">
													 	<input required type="password" class="input-xlarge" value="${buyerInfo.b_pw }"
															minlength="4" maxlength="16" id="origin_b_pwd" placeholder="기존 비밀번호" style="font-family: verdana" />
													</div>
												 </div><!-- ### 완료 ###-->
												
												 <div class="control-group">
												 	<label for="b_pw">새 비밀번호 입력</label> 
												 	<div class="controls">
													 	<input required name="b_pw" type="password" class="input-xlarge"
															minlength="4" maxlength="16" id="b_pass1" placeholder="비밀번호" readonly style="font-family: verdana" />
													</div>
												 </div><!-- ### 완료 ###-->
	
												 <div class="control-group">
													<label for="b_pw_check">새 비밀번호 확인 &nbsp;&nbsp;
														<span id="b_confirmMessage"></span> 
													</label> 
													<div class="controls">
														<input required name="b_pw_check"
															type="password" class="input-xlarge" minlength="4"
															maxlength="16" placeholder="비밀번호 확인(위와 동일하게 입력하세요)" id="b_pass2"
															onkeyup="b_checkPass(); return false;" readonly style="font-family: verdana" /> 
													</div> <!-- TODO :  -->
												 </div><!-- ### 완료 ###-->
												 </div>
											
											<!-- -------------------------------------------------------------- -->
											
											<div class="control-group">
												<label class="phone-lbl" for="b_phone"> 전화번호/휴대폰번호 </label>
												<div class="controls">
												 <input required type="number" name="b_phone" id="phone"
													class="input-xlarge" maxlength="28" 
													value="${buyerInfo.b_phone }"
													placeholder="( - )은 빼고 입력하세요. ex) 01012345424" />
												</div>
											</div>

										</div>

											<div class="control-group">
												<label class="birth-lbl" for="b_birth">생년월일</label>
												<div class="controls">
													<input class="input-xlarge" required type="date" name="b_birth"
													 value="${buyerInfo.b_birth }" readonly />
												</div>
											</div>										 
											<!-- -------------------------------------------------------------- -->
											<div id="orginEmail">
											<label for="">기존 이메일 주소</label>
											<input type="email" id="origin_email" name="b_email" value="${buyerInfo.b_email }" readonly />
											<button type="button" id="btnEmailUpdate" >이메일 변경</button>
											</div>
											<div class="control-group emailclass" >
											 											 	
											 	<label for="b_email">변경할 이메일 주소 &nbsp;&nbsp; 
											 	<!-- <small id="b_duplicationCheckResult2">
											 	 	유효한 이메일임을 확인하기 위해서 확인메일을 보냅니다.</small> -->
												</label>
												<div class="controls emailclass" id="b_email">
													<input type="email" id='b_email2' name="b_email" class="input-xlarge"
													placeholder="이메일주소 입력 ">
														
												    <span class="input-group-btn emailclass" id="b_check">
														<!-- <button type="button" name="btn_for_check" id="showConfirmForm">승인번호 얻기</button> -->
														<button type="button" id="b_showConfirmForm">승인번호 얻기</button>
													</span> 
												</div>
											 </div>
											 
											<div class="form-group emailclass" id="confirmForm_form-group">
												<label for="b_email_input">승인번호 입력 &nbsp;&nbsp; 

												</label>
												<div class="controls" id="b_email_input-group">
													<input required type="text" name="b_email_input" id = "b_email_input"class="input-xlarge"
														placeholder="승인번호 ex)1234 "> <span
														class="input-group-btn" id="b_email_span">
														<button type="button" name="b_email_btn" id="b_email_confirm_btn">확인</button>
													</span>
												</div>
											</div>

											<div class="control-group">
												<label for="b_zip">주소</label>
												<div class="controls">
													<input class="input-xlarge" type="text" name="b_zip" value="${buyerInfo.b_zip }"
														id="b_postcode" placeholder="우편번호를 찾으려면 클릭하세요"
														onclick="b_execDaumPostcode()" required> <br/>
													<input class="input-xlarge" type="text" name="b_addr1" value="${buyerInfo.b_addr1 }"
														id="b_address" placeholder="지번 / 도로명주소"
														readonly="readonly" required><br/> 
														<label for="b_address2" >상세주소</label>
													<input class="input-xlarge" type="text" name="b_addr2" value="${buyerInfo.b_addr2 }"
														id="b_address2" placeholder="나머지 상세 주소" required>
												</div>
											</div>
											<!-- -------------------------------------------------------------- -->
											<div class="actions">
												<input tabindex="9" class="btn btn-inverse large" type="button" id="btnsubmitupdate" value="정보 수정 완료">
											</div>
											<br>
											

											<!-- -------------------------------------------------------------- -->
										</div>
														
									</form>

									</div>
								</div>
							</div>
						</div><!-- End 구매자 회원가입 -->
					
					
							</div>
						</div>
					</div>
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
	<input type="text" value="${b_login_id}" id="b_login_id">
	

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$(document).ready(function() {
	var b_id = $("b_login_id").val();
	
	getAllbuylist();
	getCompletebuy();
	getOrderlist(); 
	getCompleteList();
	
	$('#btnfirst').click(function() {
		var b_pw = $("#b_pw_first").val();
		var b_id = $('#b_id_first').val();
		$.ajax({
			type : 'post',
			url : 'b_checkpw',
			headers:{
	             'Content-Type': 'application/json',
	             'X-HTTP-Method-Override': 'POST'
	         },
			data : JSON.stringify({
				b_pw: b_pw,
				b_id: b_id,
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
	
	$('#btnpwd').click(function() {
		
		$('#origin_b_pwd').val('');
		$('.chgpwd').show();
		$('#btnpwd').hide();
		
	})
	
	$('#btnEmailUpdate').click(function() {
		
		$('.emailclass').show();
		$('#origin_email').val('');
		$('#orginEmail').hide();
		
	})
	
	
	function getAllbuylist() {
		var url = '/shop/userid/all/' + b_id;
		$.getJSON(url, function(data) {
			var td = '';  	 
			$(data).each(function(){  
				td += this.count +'건'  
			});
			$('#buyer1').html(td);
		});
	};
	
	function getCompletebuy() { 
		var url2 = '/shop/userid/all2/' + b_id;
		$.getJSON(url2, function(data) { 
			var td2 = '';  
				$(data).each(function(){  
					td2 +=  this.count +'건'
				});
				$('#buyer2').html(td2);
			});
	};
	
	 function getOrderlist() {
		var url = '/shop/userid/all3/' + b_id;
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
				+ '<td>' + this.s_id + '&emsp;</td>'
				+ '<td>' + a + '</td></tr>';
				
				
			});
			
			$('#ordert > tbody:last').append(td);
		});
	};  
	
	function getCompleteList() {
		var url = '/shop/userid/all4/' + b_id;
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
				+ '<td>' + this.s_id + '&emsp;</td>'
				+ '<td>' + a + '</td></tr>';
				
				
			}); 
			$('#completet > tbody:last').append(td);
		});
	};  
	 
 	$('#buyer1').click(function () {
		$('#maindiv').children().hide();
		$('#ordert').show();
	});
 	
	$('#buyer2').click(function () {
		$('#maindiv').children().hide();
		$('#completet').show();
	});
	 
});

$(document).ready(function() {
	$("#origin_b_pwd").change(function() {
		var b_pw = $("#origin_b_pwd").val();
		var b_id = $('#b_id').val();
		$.ajax({
			type : 'post',
			url : 'b_checkpw',
			headers:{
	             'Content-Type': 'application/json',
	             'X-HTTP-Method-Override': 'POST'
	         },
			data : JSON.stringify({
				b_pw: b_pw,
				b_id: b_id,
	         }),
			success : function(result) {
				if (result == 1) {
					$("#b_duplicationCheckResult").html("비밀번호가 일치 합니다..");
					$("#b_duplicationCheckResult").css("color", "green");
					$("#origin_b_pwd").css("color", "green");
					$('#b_pass1').attr('readonly',false);
					$('#b_pass2').attr('readonly',false);
				} else {
					$("#b_duplicationCheckResult").html("비밀번호가 일치하지 않습니다.");
					$("#b_duplicationCheckResult").css("color", "red");
					$("#origin_b_pwd").css("color", "red");
					$('#b_pass1').attr('readonly',true);
					$('#b_pass2').attr('readonly',true);
				}
			}
		});
	});
	
	$('#btnsubmitupdate').click(function() {
		var b_id = $('#b_id').val();
		var b_pw;
		
		if($("#b_pass2").val() == "") {
			b_pw = $("#origin_b_pwd").val();
		} else {
			b_pw = $("#b_pass2").val();
		}
		
		var b_phone = $('#phone').val();
		
		var b_email;
		
		if($('#b_email2').val() =="") {
			b_email = $('#origin_email').val();
		} else if ($('#origin_email').val() ==""&&$('#b_email2').val() !=""){
			b_email = $('#b_email2').val();
		}
		var b_zip = $('#b_postcode').val();
		var b_addr1 =$('#b_address').val();
		var b_addr2 = $('#b_address2').val();
		
		$.ajax({
			type : 'post',
			url : 'buyermypage_updateinfo',
			headers:{
	             'Content-Type': 'application/json',
	             'X-HTTP-Method-Override': 'POST'
	         },
			data : JSON.stringify({
				b_id: b_id,
				b_pw: b_pw,
				b_phone: b_phone,
				b_email: b_email,
				b_zip:b_zip,
				b_addr1:b_addr1,
				b_addr2:b_addr2
	         }),
			success : function(result) {
				if (result == 1) {
					location.reload();
					alert('정보 수정 성공')
				} else {
					location.reload();
					alert('정보 수정 실패')
				}
			}
		});
		
	})
	
});


</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="<c:url value='/resources/css/updateinfojs.js?ver=201612131425' />"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>


</html>