/**
 * 
 */


	/* 구매자 비밀번호 확인 */
	function b_checkPass() {
		var pass1 = document.getElementById('b_pass1');
		var pass2 = document.getElementById('b_pass2');
		var message = document.getElementById('b_confirmMessage');
		var goodColor = "#66cc66";
		var badColor = "#ff6666";
		if (pass1.value == pass2.value) {
			message.style.color = goodColor;
			message.innerHTML = "일치합니다"
		} else {
			message.style.color = badColor;
			message.innerHTML = "패스워드가 일치하지 않습니다.!"
		}
	}

	/* 판매자 비밀번호 확인 */
	function s_checkPass() {
		var pass1 = document.getElementById('s_pass1');
		var pass2 = document.getElementById('s_pass2');
		var message = document.getElementById('s_confirmMessage');
		var goodColor = "#66cc66";
		var badColor = "#ff6666";
		if (pass1.value == pass2.value) {
			message.style.color = goodColor;
			message.innerHTML = "일치합니다"
		} else {
			message.style.color = badColor;
			message.innerHTML = "패스워드가 일치하지 않습니다.!"
		}
	}


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
				alert('인증번호가 전송되는 동안 잠시만 기다려 주십시오...'); // TODO: Ajax로 이메일 보내는데 시간 문제가 있음...
				$.ajax({
					type : 'post',
					url : '../buyer/checkemail',
					data : $("#b_email2").val(),
					success : function(result) {
						alert('인증번호가 전송되었습니다.');
						// $('#b_duplicationCheckResult2').html("전송 완료.");
						// $('#b_duplicationCheckResult2').css('color','green');
						$('#b_email2').css('color','green');
						code = result;
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
				$.ajax({
					type : 'post',
					url : 'checkemail',
					data : $("#s_email2").val(),
					success : function(result) {
						alert('인증번호가 전송되었습니다.');
						// $('#b_duplicationCheckResult2').html("전송 완료.");
						// $('#b_duplicationCheckResult2').css('color','green');
						$('#s_email2').css('color','green');
						code = result;
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
	
	 // daum api를 이용한 주소 검색
		// 구매자
		function b_execDaumPostcode() {
			new daum.Postcode({ 
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
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
						}
		
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('b_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('b_address').value = fullAddr;
		
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('b_address2').focus();
					}
			}).open();
		}
		// 판매자
			function s_execDaumPostcode() {
			new daum.Postcode({ 
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
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
						}
		
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('s_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('s_address').value = fullAddr;
		
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('s_address2').focus();
					}
			}).open();
		}