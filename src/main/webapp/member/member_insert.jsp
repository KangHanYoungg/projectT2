<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%> 
<c:import url="/include/top.jsp" /> 
<c:set var="path" value="${pageContext.request.contextPath}" />
<script  src="http://code.jquery.com/jquery-1.10.2.js" ></script>
<script>
jQuery.ajaxSetup({cache:false})
var path = '${path}' 
$(document).ready(function() {
		$("#ckBtn").click(function() {
			var idValue = $("#id").val();
			var dataStr = {
				id : idValue
			};

			$.ajax({
				type : "GET",
				url : path + "/IdCk.do",
				data : dataStr,
				success : function(data) {
					if (data == "T") {
						alert("사용가능한  ID 입니다.")
					} else {
						alert("사용 불가능한 ID 입니다.")
						$("#id").val("");
						$("#id").focus();
					}

				}
			})
		})

	})


function formCh(){
	if(f1.id.value==""){
		alert("id 확인!");
		f1.id.focus()
		return false;
	}else if(f1.password.value==""){
		alert("password 확인!");
		f1.password.focus()
		return false;
	}
}

</script>

<section>
<br>
<div align="center">
<h2>회원가입</h2>
<form name="f1" onSubmit="return formCh()" action="${path}/insert.do"  method=post >
<table border=1 width="500">
<tr><td>회원번호</td>
	<td><input type="text" name="custno" value="${custno}"></td></tr>
<tr><td>아이디</td>
	<td>
	<input type="text" name="id" id="id">
	<input type="button" value="중복확인" id="ckBtn">
	</td></tr>
<tr><td>비밀번호</td>
	<td><input type="text" name="password"></td></tr>
<tr><td>회원성명</td>
	<td><input type="text" name="custname"></td></tr>
<tr><td>회원전화</td>
	<td><input type="text" name="phone"></td></tr>
<tr><td>회원주소</td><td>
	<input type="text" name=zipcode id="sample6_postcode" placeholder="우편번호" size=8>
	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
	<input type="text" name=address id="sample6_address" placeholder="주소" size=40><br>
	<input type="text" name=address2 id="sample6_detailAddress" placeholder="상세주소" size=40>
	<input type="hidden" name=addr4 id="sample6_extraAddress" placeholder="참고항목">
	</td></tr>
<tr><td>가입일자</td>
	<td><input type="text" name="joindateStr" ></td></tr>
<tr><td>고객등급</td><td>
	<input type="radio" name="grade" value="A"> VIP
	<input type="radio" name="grade" value="B" checked> 일반
	<input type="radio" name="grade" value="C"> 직원
	</td></tr>
<tr><td>도시코드</td>
	<td><input type="text" name="city"></td></tr>
<tr><td colspan="2" align="center">
	<input type="submit" value="등록">
	<input type="button" value="조회" onClick="selK()">
</td></tr>

</table>
</form>
</div>
<script>
function selK(){
	alert("조회 확인!");
	location.href="${path}/selectAll.do";
}
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

</section>
<c:import url="/include/bottom.jsp" />