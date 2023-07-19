<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%> 
<c:import url="/include/top.jsp" /> 
<c:set var="path" value="${pageContext.request.contextPath}" />
<section>
<br>
<div align="center">
<h2>회사상세정보</h2>

<form action="${path}/update.do"  method=post >
<table border=1 width="500">
<tr><td colspan="2"><div id="map" style="width:100%;height:350px;"></div></td></tr>
<tr><td>회원번호</td>
	<td><input type="text" name="idx" value="${m.idx}"></td></tr>
<tr><td>회사명</td>
	<td><input type="text" name="entrprsNm" value="${m.entrprsNm}"></td></tr>
<tr><td>대표이름</td>
	<td><input type="text" name="rprsntvNm" value="${m.rprsntvNm}"></td></tr>
<tr><td>주소</td>
	<td><input type="text" name="rdnmadr" value="${m.rdnmadr}"></td></tr>
<tr><td>주력상품</td>
	<td><input type="text" name="mainGoods" value="${m.mainGoods}"></td></tr>
<tr><td>위도</td>
	<td><input type="text" name="logitude" value="${m.logitude}"></td></tr>
<tr><td>경도</td>
	<td><input type="text" name="latitude" value="${m.latitude}"></td></tr>
<tr><td colspan="2" align="center">
	<input type="submit" value="수정">
	<input type="button" value="지도" onClick="selK()">
</td></tr>
</table>
</form>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${key}"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${m.latitude}, ${m.logitude}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(${m.latitude}, ${m.logitude}); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);    
</script>
<script>
function selK(){
	alert("조회 확인!");
	location.href="${path}/CplistMap.do";
}
</script>
</section>
<c:import url="/include/bottom.jsp" />