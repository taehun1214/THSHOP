<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="//netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="../resources/build/imgur.min.css" rel="stylesheet" media="screen">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="../resources/build/imgur.min.js"></script>

<title>판매자 로고  등록</title>

<style>
.col-md {
	max-width: 500px;
}
#s_logo {
	width:422px;
	margin: 10px;
}
#logoSubmit {
	margin-left: 10px;
}
</style>
</head>
<body>
	
	<h1>로고 이미지 등록</h1>
	
	<form method="post">
	
	<div class="col-md">
		<div class="dropzone" id="zoneurl"></div>
	</div>
	
	<input type="submit" id="logoSubmit" value="등 록" />
	<input type="hidden" id="s_logo" name="s_logo" placeholder="로고로 등록할 이미지 URL을 넣어주세요." /><br/>

	</form>
	
	<script>
	// 이미지 관련 처리
	var feedback = function(res) {
		if (res.success === true) {
			document.querySelector('.status').classList.add('bg-success');
			document.querySelector('.status').innerHTML = res.data.link;
			$('#s_logo').val(res.data.link);
		}
	};

	new Imgur({
		clientid : '7ff152b0e154c31', /* http://imgur.com/ 에서 아이디를 만들어 발급했음  */
		callback : feedback
	// TODO: 사진을 업로드하면 사진은 imgur서버상에 존재... 그러나 웹 사이트 계정에선 확인 불가...
	});
	
	$('#logoSubmit').click(function() {
		event.preventDefault();
		var url = 'logoPop';
	    var s_logo = $('#s_logo').val();
		  $.ajax({
	          type:'post',
	          url : url,
	          headers:{
	             'Content-Type': 'application/json',
	               'X-HTTP-Method-Override': 'POST'
	          },
	           data: JSON.stringify({
	        	   s_logo: s_logo,
	        	   
	            }), 
	           success: function(result) {
	        	   if(result == 1) {
	        		  window.close();
	        		  window.opener.location.reload();
	        		  alert('이미지 등록 성공!');
	        	   } else{
	        		   location.reload();
	        		   alert('이미지 등록 실패.');
	        	   }
	           }
	       });   
	});
	
	
	</script>
	
</body>
</html>