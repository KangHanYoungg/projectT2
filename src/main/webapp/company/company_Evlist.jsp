<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%> 
<c:import url="/include/top.jsp" />
<c:set var="path" value="${pageContext.request.contextPath}" /> 

<section>
<br>
<div align="center">
<h2>전기차</h2>
<table border=1>
<tr align="center">
<td>idx</td> <td>csNm</td> <td>addr</td> <td>cpNm</td> <td>cpStat</td>
</tr>

<c:forEach items="${li}" var="m" varStatus="status">
<tr align="center">
	<td>${m.idx}</td>
	<td>${m.csNm}</td>
	<td>${m.addr}</td>
	<td>${m.cpNm}</td>
	<td>${m.cpStat}</td>
	</tr>
</c:forEach>

</table>

<form action="${path}/EVlist.do" method=post >
 <select name="ch1">
  <option value="addr">addr</option>
  <option value="csNm">csNm</option>
 </select>
<input type="text" name="ch2"> 
<input type="submit" value="검색">

</form>

</div>
</section>
<c:import url="/include/bottom.jsp" />