<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>

<title>Location</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<!-- 세션 없으면 메인페이지로 강제 이동 -->
<c:if test="${sessionScope.sessionData.memberInfo.getMember_no() == null || sessionScope.sessionData.memberInfo.getMember_no() ==''}">
	<script>
		location.href="${pageContext.request.contextPath}/web/login.do";
	</script>
</c:if>
<script type="text/javascript">
function company_add(){
	location.href="<%=cp%>/web/company_add.do";
}
function company_modify_delete(){
	location.href="<%=cp%>/web/company_modify_delete.do";
}
function dangerArea_add(){
	location.href="<%=cp%>/web/dangerArea_add.do";
}
function dangerArea_delete(){
	location.href="<%=cp%>/web/dangerArea_delete.do";
}
function logout(){
	location.href="<%=cp%>/web/logout.do";
}
</script>
</head>

<body>
	<div class="container-fluid" style="background-color: #2196F3; color: #fff; height: 100px;">
		<h1>
			관리자 PAGE <input type="button" value="로그아웃" onclick="logout()" class="btn btn-default" style="right: 1em; position: absolute;">
		</h1>

	</div>
	<br>

	<div class="container">
		<div class="row">
			<nav class="col-sm-3">
				<ul class="nav nav-pills nav-stacked" data-spy="affix"
					data-offset-top="205">
					<!--<li class="active"><a href="#" onclick="">맛집 등록</a></li> -->
					<li><a href="#" onclick="company_add()">업체 등록</a></li>
					<li><a href="#" onclick="company_modify_delete()">업체 수정 및 삭제</a></li>
<!-- 					<li><a href="#" onclick="dangerArea_add()">위험지역 등록</a></li> -->
<!-- 					<li><a href="#" onclick="dangerArea_delete()">위험지역 삭제</a></li> -->
				</ul>
			</nav>
			<div class="col-sm-9">
				<h1>어플 관리자에 오신것을 환영 합니다.</h1>
				<p>이곳에서 설정하면 모든 어플 사용자들에게 적용 됩니다.</p>
				<p>왼쪽 카테고리를 클릭하여 원하는 설정을 할 수 있습니다.</p>
			</div>
		</div>
	</div>
</body>
</html>