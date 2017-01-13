/**
 * 
 */


// ##### 이메일 인증을 위한 Query

	// 구매자
	var code; // 코드를 저장할 변수 지정	
	$(document).ready(function() {
		$('#b_showConfirmForm').click(function() {
			var email = $("#b_email2").val();
			var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
			if (regex.test(email) === false) {
				alert("잘못된 이메일 형식입니다.");
				return false;
			} else {
				var b_name = $('#b_name').val();
				var b_email = $("#b_email2").val();
				alert('인증번호가 전송되는 동안 잠시만 기다려 주십시오..'); // TODO: Ajax로 이메일 보내는데 시간 문제가 있음...

				$.ajax({
					type : 'post',
					url : 'checkemailforid',
			        headers:{
				             'Content-Type': 'application/json',
				             'X-HTTP-Method-Override': 'POST'
				        },
					data :  JSON.stringify({
						b_name: b_name,
						b_email: b_email			        	   
			            }),
					success : function(result) {
			        	   if(result == 0) {
			        		   location.reload();
			        		   alert('가입시 입력한 정보와 일치하지 않습니다.');
				        	   } else{
									alert('인증번호가 전송되었습니다.');
									// $('#b_duplicationCheckResult2').html("전송 완료.");
									// $('#b_duplicationCheckResult2').css('color','green');
									$('#b_email_input').attr('disabled',false);
									$('#b_email2').css('color','green');
									code = result;
				        	   }
					}
				});
			}
		});
	});
	// 판매자
	var code; // 코드를 저장할 변수 지정	
	$(document).ready(function() {
		$('#s_showConfirmForm').click(function() {
			var email = $("#s_email2").val();
			var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
			if (regex.test(email) === false) {
				alert("잘못된 이메일 형식입니다.");
				return false;
			} else {
				alert('인증번호가 전송되는 동안 잠시만 기다려 주십시오...'); // TODO: Ajax로 이메일 보내는데 시간 문제가 있음...
				var s_name = $('#s_name').val();
				var s_email = $("#s_email2").val();
				$.ajax({
					type : 'post',
					url : 'checkemailforid',
			        headers:{
			             'Content-Type': 'application/json',
			             'X-HTTP-Method-Override': 'POST'
			        },
					data : JSON.stringify({
						s_name: s_name,
						s_email: s_email			        	   
			            }), 
					success : function(result) {
			        	   if(result == 0) {
			        		   location.reload();
			        		   alert('가입시 입력한 정보와 일치하지 않습니다.');
				        	   } else{
									alert('인증번호가 전송되었습니다.');
									// $('#b_duplicationCheckResult2').html("전송 완료.");
									// $('#b_duplicationCheckResult2').css('color','green');
									$('#s_email_input').attr('disabled',false);
									$('#s_email2').css('color','green');
									code = result;
				        	   }
					}
				});
			}
		});
	});

	
	var autcheck1 = false;
	var autcheck2 = false;
	
	// 인증번호 입력 확인시. code변수에 저장된 인증번호와 user가 쓴 인증번호 비교.
	// 구매자
	$(document).ready(function() {
		$('#b_email_confirm_btn').click(function() {
			if ($('#b_email_input').val() == code) {
				alert('인증되었습니다');
				autcheck1 = true;
			} else {
				alert('다시 입력하여 주십시오..');
			}
		});
	});
	// 판매자
	$(document).ready(function() {
		$('#s_email_confirm_btn').click(function() {
			if ($('#s_email_input').val() == code) {
				alert('인증되었습니다');
				 autcheck2 = true;
			} else {
				alert('다시 입력하여 주십시오..');
			}
		});
	});
	
	
	
	/* 인증번호를 제대로 입력하지 않고 가입버튼 누를시.. */
	$(document).ready(function() {
		$('#fileForm1').submit(function() {
			if (autcheck1 != true) {
				alert('이메일 인증을 다시 확인해 주십시오...')
				return false;
			} else {
				return true;
			}
		});
	});
	
	$(document).ready(function() {
		$('#fileForm2').submit(function() {
			if (autcheck2 != true) {
				alert('이메일 인증을 다시 확인해 주십시오...')
				return false;
			} else {
				return true;
			}
		});
	});
	