<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%> 
<c:import url="/include/top.jsp" /> 
<c:set var="path" value="${pageContext.request.contextPath}" />
<section>
<br>
<div align=center>
<h2>로그인</h2>
<form name=f1 action="${path}/login.do" method="post">
<table border=1>
<tr><td align="center">ID</td>  
   <td><input type=text name="id"  /> </td></tr> 
<tr><td align="center">PASSWORD</td>  
   <td><input type=text name="password" /> </td></tr>
<tr><td colspan=2  align="center"> 
    <input  type=submit value="로그인"></td></tr>
</table>
</form>
</div>
<br>

</section>
<c:import url="/include/bottom.jsp" />