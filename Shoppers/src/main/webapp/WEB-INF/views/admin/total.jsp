<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
div {
	float: left;
	margin-right: 100px;
}

li {
	list-style-type: none;
}
</style>

</head>
<body>

	<h3>
		<a href="/shop">홈</a>
	</h3>
	<a href="JavaScript:window.history.back()">이전 페이지</a>
	<a href="JavaScript:window.location.reload()">페이지 새로고침</a><br><br> 
	<div>
		<h3>판매관리</h3>
		<ol>
			<li><a href="buyr">전체 주문 요청 내역</a></li>
			<li><a href="buyf">전체 판매 내역</a></li>
			<li><a href="total">전체 판매 통계</a></li>
		</ol>

		<h3>회원관리</h3>
		<ol>
			<li><a href="#">판매자 가입 승인 요청 내역</a></li>
			<li><a href="#">판매물 등록 승인</a></li>
			<li><a href="#">회원 목록</a></li>
		</ol>

	</div>

	<div>

		<h3>전체 판매 통계</h3>
		<table>
			<tr>
				<th>회원번호&emsp;</th>
				<th>판매자명&emsp;</th>
				<th>가입일&emsp;</th>
				<th>총매출액&emsp;</th>
				<th>총판매량&emsp;</th>
				<th>상세보기&emsp;</th>
			</tr>
			<tr>
				<td></td>
			</tr>
<%-- 			<c:forEach var="list" items="${list }">
				<tr>
					<td>${list.buy_no }</td>
					<td><fmt:formatDate value="${list.buy_date }"
							pattern="yyyy년 MM월 dd일" />&emsp;&emsp;</td>
					<td>${list.p_name }&emsp;(${list.o_cont })</td>
					<td>${list.p_price }원</td>
					<td>판매자ID&emsp;</td>
					<td>${list.b_id }&emsp;</td>
					<td>배송완료</td>
				</tr>
			</c:forEach> --%>
			
			<tr>
			<td>쿼리</td>
			</tr>
			
		</table>

	</div>

</body>
</html>