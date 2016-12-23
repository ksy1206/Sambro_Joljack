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

	$("#add_company").click(function(){
		location.href="<%=cp%>/main/adminCompany.do"
	});
	
	$("#modify_company").click(function(){
		var member_no = $("#member_no").val();
		location.href="<%=cp%>/main/modify_companyMove.do?member_no="+member_no;
	});
	
	$("#delete_company").click(function(){
		var member_no = $("#member_no").val();
		location.href="<%=cp%>/main/delete_company_Move.do?member_no="+member_no;
	});
	
	$("#go_home").click(function(){
		location.href="<%=cp%>/main/main.do"
	});
});
function companyDelete(data){
	var member_no = $("#member_no").val();
	location.href="<%=cp%>/main/companyDelete.do?member_no="+member_no+"&c_no="+data;
}
</script>
</head>
<body>
	<div data-role="page">	
		<input type="hidden" value="${sessionScope.sessionData.memberInfo.getMember_no()}" id="member_no" name="member_no">
		<div data-role="hearder" data-position="fixed">
			<h1 style="font-size: 1.8em; margin-left: 1em;">
				업체 관리
				<img src="../img/home.png" id="go_home" style="width: 1.2em; vertical-align: top; position: absolute; right: 1em;">	
			</h1>
		</div>
		
		<div data-role="content">
			<div class="btn-group btn-group-justified">
			   <a href="#" id="add_company" class="btn btn-primary" style="background-color: #fff !important;">업체 등록</a>
			   <a href="#" id="modify_company" class="btn btn-primary" style="background-color: #fff !important;">업체 수정</a>
			   <a href="#" id="delete_company" class="btn btn-primary" style="background-color: #C4DEFF !important;">업체 삭제</a>
			</div>	 
			
			<div style="margin-top: 2em;">
				<c:forEach var="data" items="${companyList}">
					<div style="border:solid 2px #487BE1; padding:.3em; position:relative; margin-bottom:.5em;">
						<p>위험지역 : ${data.c_name}</p>
						<p>주    소 : ${data.c_address}</p>
						<p>내    용 : ${data.c_content}</p>
						<input type="button" onclick="companyDelete('${data.c_no}')" value="삭제" class="btn btn-danger" style="position: absolute; right: 1em; top: 1em;">
					</div>
				</c:forEach>
			</div>	
		</div>				
	</div>
</body>
</html>