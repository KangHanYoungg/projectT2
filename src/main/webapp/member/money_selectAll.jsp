<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%> 
<c:import url="/include/top.jsp" />
<c:set var="path" value="${pageContext.request.contextPath}" /> 
<section>
<br>
<div align="center">
<h2>회원매출조회</h2>
<table border=1 width="500">
<tr align="center">
<td>회원번호</td> <td>회원성명</td> <td>고객등급</td> <td>매출</td>
</tr>

<c:forEach items="${li}" var="m" varStatus="status">
<tr align="center">
	<td>${m.custno}</td>
	<td>${m.custname}</td>
	<td>
	<c:choose>
	 <c:when test="${m.grade=='A'}">
	 	<c:out value="VIP" />
	 </c:when>
	  <c:when test="${m.grade=='B'}">
	 	<c:out value="일반" />
	 </c:when>
	  <c:when test="${m.grade=='C'}">
	 	<c:out value="직원" />
	 </c:when>
	</c:choose>
	</td>
	<td>${m.price}</td>
	</tr>
</c:forEach>

</table>

</div>
</section>
<c:import url="/include/bottom.jsp" />