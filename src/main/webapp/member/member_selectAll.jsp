<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%> 
<c:import url="/include/top.jsp" />
<c:set var="path" value="${pageContext.request.contextPath}" /> 

<section>
<br>
<div align="center">
<h2>회원목록</h2>
<table border=1>
<tr align="center">
<td>회원번호</td> <td>회원성명</td> <td>전화번호</td> 
<td>주소</td> <td>가입일자</td> <td>고객등급</td> <td>거주지역</td>
</tr>

<c:forEach items="${li}" var="m" varStatus="status">
<tr align="center">
	<td><a href="${path}/selectOne.do?custno=${m.custno}">${m.custno}</a></td>
	<td>${m.custname}</td>
	<td>${m.phone}</td>
	<td>${m.address}</td>
	<td>${m.joindate}</td>
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
	<td>${m.city}</td>
	</tr>
</c:forEach>

</table>

<form action="${path}/selectAll.do" method=post >
 <select name="ch1">
  <option value="custname">이름</option>
  <option value="phone">번호</option>
  <option value="address">주소</option>
 </select>
<input type="text" name="ch2"> 
<input type="submit" value="검색">

</form>

</div>
</section>
<c:import url="/include/bottom.jsp" />