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
<!-- 세션 없으면 메인페이지로 강제 이동 -->
<c:if test="${sessionScope.sessionData.memberInfo.getMember_no() == null || sessionScope.sessionData.memberInfo.getMember_no() ==''}">
	<script>
		location.href="${pageContext.request.contextPath}/member/login.do";
	</script>
</c:if>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#admin_food").click(function(){
		location.href="<%=cp%>/main/adminCompany.do"
	});
	
	$("#admin_danger").click(function(){
		location.href="<%=cp%>/main/adminDangerAreaAdd.do"
	});
	
});
</script>

</head>
<body>
	<div data-role="page">		
		<div data-role="hearder" data-position="fixed" style="text-align: center; background-color: #21B4D6;">
			<p style="font-size: 3em !important; color: #fff;">MAZZI</p>
		</div>
		
		<div data-role="content" align="center" style="margin-top: 3em;">
			<p style="margin-bottom: 3em;"><input type="button" value="업체 관리" class="btn btn-primary btn-lg" id="admin_food"></p>
			<input type="button" value="위험지역 관리" class="btn btn-primary btn-lg" id="admin_danger">
			
		</div>		
		
		<div data-role="footer" data-position="fixed" style="text-align: center; background-color: #21B4D6;">
			<p style="margin-top: 10px; color: #fff;">어플 관리</p>
		</div>
				
	</div>
</body>
</html>