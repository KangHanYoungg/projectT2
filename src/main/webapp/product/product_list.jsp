<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%> 
<c:import url="/include/top.jsp" />
<c:set var="path" value="${pageContext.request.contextPath}" /> 

<section>
<br>
<div align="center">
<h2>상품목록</h2>
<table border=1>
<tr align="center">
<td>상품번호</td> <td>상품이름</td> <td>상품가격</td> 
<td>상품설명</td> <td>상품사진</td> <td>등록일시</td>
</tr>

<c:forEach items="${li}" var="m" varStatus="status">
<tr align="center">
	<td>${m.productId}</td>
	<td><a href="${path}/productOne.do?productId=${m.productId}">${m.productName}</a></td>
	<td>${m.productPrice}</td>
	<td>${m.productDesc}</td>
	<td><img src="${path}/product/files/${m.productImgStr}" width=100  height=100></td>
	<td>${m.productDate}</td>
	</tr>
</c:forEach>

</table>

</div>
</section>
<c:import url="/include/bottom.jsp" />