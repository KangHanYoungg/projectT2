<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%> 
<c:import url="/include/top.jsp" />
<c:set var="path" value="${pageContext.request.contextPath}" /> 

<section>
<br>
<div align="center">
<h2>고용우수기업</h2>
<table border=1>
<tr align="center">
<td>번호</td> <td>회사명</td> <td>대표명</td> 
<td>주소</td> <td>주력상품</td> <td>위도</td> <td>경도</td>
</tr>

<c:forEach items="${li}" var="m" varStatus="status">
<tr align="center">
	<td>${m.idx}</td>
	<td>${m.entrprsNm}</td>
	<td>${m.rprsntvNm}</td>
	<td>${m.rdnmadr}</td>
	<td>${m.mainGoods}</td>
	<td>${m.logitude}</td>
	<td>${m.latitude}</td>
	</tr>
</c:forEach>

</table>


</div>
</section>
<c:import url="/include/bottom.jsp" />