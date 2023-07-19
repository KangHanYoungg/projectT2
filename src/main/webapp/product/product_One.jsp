<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%> 
<c:import url="/include/top.jsp" /> 
<c:set var="path" value="${pageContext.request.contextPath}" />
<script>
function delK(k){
	alert("id 확이"+k);
	location.href="${path}/delete.do?productId="+k ;
}
function listK(){
	location.href="${path}/productList.do"
}
</script>
<section>
<br>
<div align=center>
<h2>상품 상세보기</h2>
<form action="${path}/cartInsert.do">
 <input type="text" name="productId" value="${k.productId}">
 <input type="text" name="custNo" value="${m.custno}">
 
<table border=1 width="650" height="350">
<tr><td align="center">상품번호</td>  
   <td>${k.productId}</td>
   <td rowspan=4><img src="${path}/product/files/${k.productImgStr}" width="150" height="150"></td></tr> 
<tr><td align="center">상품이름</td>  
   <td>${k.productName}</td></tr> 
<tr><td align="center">상품가격</td>  
   <td>${k.productPrice}</td></tr>
<tr><td align="center">상품설명</td>  
   <td><textarea cols="40"  rows="9" name="productDesc" >${k.productDesc}</textarea> </td></tr>
<tr><td align="center">구매수량</td>  
   <td colspan="2"> <input type="number" name="amount" min="1" max="5"></td></tr>   
<tr><td align="center">등록일자</td>  
   <td colspan="2">${k.productDate}</td></tr> 
<tr><td colspan="3" align="center">
	<input  type="submit" value="구매하기">&emsp; 
	<input  type="button" value="목록보기" onClick="listK()">&emsp;
    <input  type="button" value="삭제하기" onClick="delK('${k.productId}')">
   </td></tr>
</table>
</form>
</div>
<br>

</section>
<c:import url="/include/bottom.jsp" />