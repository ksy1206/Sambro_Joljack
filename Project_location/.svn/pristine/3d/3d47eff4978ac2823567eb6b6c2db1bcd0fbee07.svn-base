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
	
	$("#add_dangerArea").click(function(){
		location.href="<%=cp%>/main/adminDangerAreaAdd.do"
	});
	
	$("#delete_dangerArea").click(function(){
		var d_write = $("#d_write").val();
		location.href="<%=cp%>/main/adminDangerAreaDelete.do?d_write="+d_write;
	});
	
	$("#go_home").click(function(){
		location.href="<%=cp%>/main/main.do"
	});	
	
});

function dangerArea_delete(d_no){
	var d_write = $("#d_write").val();
	location.href="<%=cp%>/main/dangerArea_delete.do?d_no="+d_no+"&d_write="+d_write;
}
</script>
</head>
<body>
	<div data-role="page">	
		
		<div data-role="hearder" data-position="fixed">
			<h1 style="font-size: 1.8em; margin-left: 1em;">
				위험지역 관리
				<img src="../img/home.png" id="go_home" style="width: 1.2em;  position: absolute; right: 1em;">
			</h1>
			
		</div>
		
		<input type="hidden" value="${sessionScope.sessionData.memberInfo.getMember_no()}" id="d_write" name="d_write">
				
		<div data-role="content">
			<div class="btn-group btn-group-justified">
			   <a href="#" id="add_dangerArea" class="btn btn-primary" style="background-color: #fff !important;">위험지역 등록</a>
			   <a href="#" id="delete_dangerArea" class="btn btn-primary" style="background-color: #C4DEFF !important;">위험지역 삭제</a>
			</div>
			
			<div style="margin-top: 2em;">
				<c:forEach var="data" items="${dangerArea_list}">
					<div style="border:solid 2px #487BE1; padding:.3em; position:relative; margin-bottom:.5em;">
						<p>위험지역 : ${data.d_name}</p>
						<p>위    치 : ${data.d_address}</p>
						<p>상세내용 : ${data.d_content}</p>
						<input type="button" value="삭제" class="btn btn-danger" style="position: absolute; right: 1em; top: 1em;" onclick="dangerArea_delete('${data.d_no}')">
					</div>
				</c:forEach>
			</div>	
			
		</div>
				
	</div>
</body>
</html>