<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SHOP</title>
</head>
<body>

<h1>판매자 홈관리</h1> 

<h3> 
	<a href="/shop">홈</a>
</h3>
<h3>판매자 리스트</h3>

<input type="button" value="Search"> <input type="text">
<table>
	<tr>
		<th>회원번호</th>
		<th>판매자</th>
		<th>가입일</th>
		<th>연락처</th>
		<th>이메일</th>
		<th>판매홈</th>
	</tr>
	<c:forEach var="svo" items="${sellerList }">
	<tr>
		<td>${svo.s_no}</td>
		<td>${svo.s_id}</td>
		<td><fmt:formatDate value="${svo.s_reg }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		<td>${svo.s_phone}</td>
		<td>${svo.s_email}</td>
		<td><a href="http://www.daum.net"><img src="./resources/image/home.png"/></a></td>
	</tr>
	</c:forEach>
</table>


</body>
</html>