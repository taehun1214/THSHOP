<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert Rev</title>
<style>
.star_rating {font-size:0; letter-spacing:10px;}
.star_rating label {
    font-size:22px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;

}
/* .star_rating a {
    font-size:22px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
    text-decoration:none;
} */
.star_rating label:first-child {margin-left:0;}
.star_rating label.on {color:rgb(238, 11, 51);}

#qna_type0, #qna_type1, #qna_type3, #qna_type2, #qna_type4 {
	display: none;
}

tr,th,td {

	border-collapse: collapse;
}
th {
	background-color: #f5f5f5;
	border-top: 0.1px solid gray;
	border-collapse: collapse;
	width: 150px;
}

td {
	border-top: 0.1px solid lightgray;
}

</style>
</head>
<body>
	<form id="frm" method="POST">
		<table style="width: 750px; height: 320px; ">
			<tr>
				<th scope="row">구매 상품</th>
				<td>
				<c:forEach var="list" items="${cartlist }">
				<label><img style="width: 200px; height: 100px;" src=" ${list.p_img }"/></label>
				<label> 선택옵션: ${list.o_cont }</label>
				</c:forEach>
				</td>
			</tr>
			
			<tr>
				<th scope="row">상품 평가</th>

				<td class="star_rating" >
				
				<label for="qna_type0" > <input type="radio"
						name="rev_score" id="qna_type0" value="1" />★
				</label>

				<label for="qna_type1" > <input type="radio"
						name="rev_score" id="qna_type1" value="2" />★
				</label>

				<label for="qna_type2" > <input type="radio"
						name="rev_score" id="qna_type2" value="3" />★
				</label>

				<label for="qna_type3"> <input type="radio"
						name="rev_score" id="qna_type3" value="4" />★
				</label>

				<label for="qna_type4"> <input type="radio"
						name="rev_score" id="qna_type4" value="5" />★
				</label> 
				
				</td>
			</tr>

			<tr>
				<th style="border-bottom: 0.1px solid lightgray;" scope="row">후기 내용</th>
				<td><textarea rows="6" cols="100" id = "rev_cont" name="rev_cont" required
				placeholder="제품 후기 내용을 작성해주세요." ></textarea></td>
			</tr>

		</table>
		
<!-- 		<input type="hidden" name="qna_no" value="0" /> -->
			<input type="hidden" name="b_id" id="b_id" value="${b_id}" />
			<input type="hidden" name="p_no" id="p_no" value="${p_no}" />
<!-- 		<input type="hidden" name="qna_reply" value = "0" /> -->
		
			<input style="float: right; margin-right: 20px; " type="submit" id="btn_submit" value="등록">
	</form>
	
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
	$(document).ready(function() {

		$( ".star_rating label" ).click(function() {
		     $(this).parent().children("label").removeClass("on");
		     $(this).addClass("on").prevAll("label").addClass("on");
		     $(this).children('input').checked();

		     //alert($("a[class^=on]").length);
		     return false;
		});
		
		
 		$('#btn_submit').click(function() {
 			event.preventDefault();
	 		var url = 'insertReview';
		    var rev_score = $('input:radio[name=rev_score]:checked').val();
		    var rev_cont = $('#rev_cont').val();
		    var b_id = $('#b_id').val();
		    var p_no = $('#p_no').val();
			  $.ajax({
		          type:'post',
		          url : url,
		          headers:{
		             'Content-Type': 'application/json',
		               'X-HTTP-Method-Override': 'POST'
		          },
		           data: JSON.stringify({
		        	   rev_score: rev_score,
		        	   rev_cont: rev_cont,
		        	   b_id: b_id,
		        	   p_no: p_no
		        	   
		            }), 
		           success: function(result) {
		        	   if(result == 1) {
		        		  window.close();
		        		  window.opener.location.reload();
		        		  alert('글 저장 성공!');
		        	   } else{
		        		   location.reload();
		        		   alert('글 등록 실패.');
		        	   }
		           }
		       });   
 		})
		
	})
	
	</script>
</body>
</html>