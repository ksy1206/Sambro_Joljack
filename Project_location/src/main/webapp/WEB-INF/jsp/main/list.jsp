<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%  
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=320, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">

<script src="../js/bootstrap.js"></script>
<link rel="stylesheet" href="../css/mobile.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<!-- 세션 없으면 메인페이지로 강제 이동 -->
<c:if test="${sessionScope.sessionData.memberInfo.getMember_no() == null || sessionScope.sessionData.memberInfo.getMember_no() ==''}">
	<script>
		location.href="${pageContext.request.contextPath}/member/login.do";
	</script>
</c:if>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#pageMove_list").click(function(){
		var member_no = $("#member_no").val();
		var latitude = $("#latitude").val();
		var longitude = $("#longitude").val();
		location.href="<%=cp%>/main/move_list.do?latitude="+latitude+"&longitude="+longitude+"&member_no="+member_no;
	});
	
	$("#pageMove_main").click(function(){
		location.href="<%=cp%>/main/main.do"
	});
	
	$("#move_adminLogin").click(function(){
		location.href="<%=cp%>/main/admin_login.do"
	});	

	$("#pageMove_dangerArea").click(function(){
		location.href="<%=cp%>/main/dangerArea.do"
	});
	
});

function select_list_c_type(){
	var member_no = $("#member_no").val();
	var latitude = $("#latitude").val();
	var longitude = $("#longitude").val();
	var c_type= $("#c_type").val();
	location.href="<%=cp%>/main/move_list.do?latitude="+latitude+"&longitude="+longitude+"&member_no="+member_no+"&c_type="+c_type;
}

function details(c_no){
	location.href="<%=cp%>/main/details.do?c_no="+c_no;
}
</script>

</head>
<body>
	<div data-role="page">		
				
		<div data-role="hearder" data-position="fixed" style="text-align: center; background-color: #21B4D6;">
			<p style="font-size: 3em !important; color: #fff;">MAZZI</p>
		</div>
		
		<input type="hidden" value="${sessionScope.sessionData.memberInfo.getMember_no()}" id="member_no" name="member_no">
		<input type="hidden" value="${latitude}" id="latitude">
		<input type="hidden" value="${longitude}" id="longitude">
		
		<div data-role="content">
			<div align="center">
				<input type="button" value="내 위치" class="btn btn-info" id="pageMove_main" style="margin-bottom: 1em;">
				<input type="button" value="맛집 리스트" class="btn btn-info" id="pageMove_list" style="margin-bottom: 1em;">
			</div>
			
			<div>
				<select id="c_type" name="c_type" onchange="select_list_c_type()">
					<option selected="selected" value="undefined">업종 선택</option>
					<option value="맛집">맛집</option>
					<option value="화장실">화장실</option>
					<option value="옷가게">옷가게</option>
					<option value="로드샵">로드샵</option>
					<option value="기타">기타</option>
				</select>
			</div>
			<c:forEach var="data" items="${companyList}">
				<div onclick="details('${data.c_no}')" style="border:solid 1px #487BE1; padding:.3em; position:relative; margin-bottom:.5em; background-color: #fff;">
					<p style="font-weight: bold !important; font-size: 16px;">업 체 명 : ${data.c_name}</p>
					<p>주    소 : ${data.c_address}</p>
					<p style="color: #a5a5a5; font-size: 12px;"> ${data.c_phone} | ${data.distance} Km</p>
				</div>
			</c:forEach>
			
		</div>	
		
		<div data-role="footer" data-position="fixed" style="text-align: center; background-color: #21B4D6;" id="move_adminLogin">
			<p style="margin-top: 10px; color: #fff;">어플 관리</p>
		</div>
				
	</div>
</body>
</html>