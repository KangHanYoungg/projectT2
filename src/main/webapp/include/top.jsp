<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
<c:set var="path" value="${pageContext.request.contextPath}" 
								scope="session"/>
<c:set var="key" value="48398a6286496a0c1e6636198e385f2a" scope="session"/>
								
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KHSTORY</title>
<link href="${path}/include/top.css" rel="stylesheet" type="text/css"  />
<style type="text/css">

</style>

</head>
<body>
<header>
 <b> KHSTORY / KHSTORY SHOP </b>
</header>
<nav>
&emsp;<a href="${path}/custno.do">회원등록</a>
&emsp;<a href="${path}/selectAll.do">회원목록</a>
&emsp;<a href="${path}/moneyAll.do">매출조회</a>
<c:if test="${user =='admin'}">
&emsp;<a href="${path}/Companylist.do">우수기업</a>
&emsp;<a href="${path}/EVlist.do">전기차</a>
&emsp;<a href="${path}/CplistMap.do">우수기업 맵</a>
&emsp;<a href="${path}/EvlistMap.do">전기차 맵</a>
</c:if>
&emsp;<a href="${path}/product/productForm.jsp">상품등록</a>
&emsp;<a href="${path}/productList.do">상품목록</a>
&emsp;<a href="${path}/index.jsp">홈으로.</a>
&emsp;<a href="${path}/MoneyList.do?">주문서</a>

<c:if test="${empty m.custno}">
&emsp;<a href="${path}/login/login.jsp">로그인</a>
</c:if>
<c:if test="${!empty m.custno}">
&emsp;<a href="${path}/logout.do?custno=${m.custno}">${m.custname}</a>
&emsp;<a href="${path}/cartList.do?custNo=${m.custno}">장바구니</a>
</c:if>

</nav>
