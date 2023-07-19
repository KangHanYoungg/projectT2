<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/include/top.jsp" />
<c:set var="path" value="${pageContext.request.contextPath}" /> 

<section>
<br>
<div align="center">
<h2>주문목록</h2>
<table border=1>
<tr align="center">
<td>번호</td><td>고객번호</td> <td>배송비</td> <td>구매금액</td> <td>주문날짜</td> <td>삭제</td>
</tr>

<c:forEach items="${li}" var="o" varStatus="status">
<tr align="center">
	<td>${o.idx}</td>
	<td>${o.ocustNo}</td>
	<td>${o.baesongbi}</td>
	<td><fmt:formatNumber value="${o.totalMoney}" pattern="#,###"/></td>
	<td><fmt:formatDate value="${o.getDate}" pattern="yyyy-MM-dd"/></td>
	<td><input type="button" value="환불" onClick="delK('${o.idx}')"></td>
</tr>
</c:forEach>

</table>

</div>
</section>
<c:import url="/include/bottom.jsp" />