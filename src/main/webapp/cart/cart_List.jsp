<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/include/top.jsp" />
<c:set var="path" value="${pageContext.request.contextPath}" /> 

<script>
function delK(k){
	alert("k: "+k);
	location.href="cartDeleteOne.do?cartId="+k+"&custNo="+${m.custno};
}

function delAllK(k){
	alert("k: "+k);
	location.href="cartDeleteAll.do?custNo="+k;
}

</script>
<section>
<br>
<div align="center">
<h2>장바구니</h2>
<form method="post" name="f1">
<table border=1>
<tr align="center">
<td>장바구니ID</td><td>상품이름</td> <td>상품가격</td> 
<td>상품수량</td> <td>구매금액</td> <td>상품사진</td> <td>삭제</td>
</tr>

	
<c:forEach items="${li}" var="c" varStatus="status">
<input type="hidden" name="custNo" value="${c.custNo}">
<input type="hidden" name="cartId" value="${c.cartId}">
<input type="hidden" name="productId" value="${c.productId}">
<input type="hidden" name="productName" value="${c.productName}">
<tr align="center">
	<td>${c.cartId}</td>
	<td>${c.productName}</td>
	<td><fmt:formatNumber value="${c.productPrice}" pattern="#,###"/></td>
	<td><input type="number" name="amount" value="${c.amount}" size="5"></td>
	<td><fmt:formatNumber value="${c.amount*c.productPrice}" pattern="#,###"/></td>
	<td><img src="${path}/product/files/${c.productImgStr}" width=100  height=100></td>
	<td><input type="button" value="삭제" onClick="delK('${c.cartId}')"></td>
	</tr>
	<c:set var="sum" value="${c.amount*c.productPrice}"> </c:set>
	<c:set var="total" value="${total+sum}"> </c:set>
</c:forEach>

<tr>
<td colspan="7">
<c:if test="${total>=200000}">
<c:set var="baesongbi" value="0"/>
배송비 : ${baesongbi}<br>
장바구니 금액합계:<fmt:formatNumber value="${total}" pattern="#,###"/>

</c:if>
<c:if test="${total<200000}">
<c:set var="baesongbi" value="5000"/>
배송비 : ${baesongbi}<br>
장바구니 금액합계:<fmt:formatNumber value="${total+baesongbi}" pattern="#,###"/>
</c:if>
</td>
</tr>

<tr>
<td colspan="7" align="center">
<input type="hidden" name="baesongbi" value="${baesongbi}">
<input type="hidden" name="totalMoney" value="${total}">
&emsp;<input type="submit" value="구매하기" onClick="javaScript:action='${path}/cartOrder.do'">
&emsp;<input type="submit" value="수정하기" onClick="javaScript:action='${path}/cartUpdate.do'">
&emsp;<input type="button" value="전체삭제" onClick="delAllK('${m.custno}')">
</td>
</tr>
</table>
</form>
</div>
</section>
<c:import url="/include/bottom.jsp" />