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
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD60rwjxUjBDRiDUUfwQvNhjiP8d8hXVD8"></script>
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
function dangerArea_delete(d_no){
	location.href="<%=cp%>/web/dangerArea_deleteDb.do?d_no="+d_no;
}
function logout(){
	location.href="<%=cp%>/web/logout.do";
}
</script>
</head>

<body>
<div class="container-fluid" style="background-color:#2196F3;color:#fff;height:100px;">
  <h1>관리자 PAGE <input type="button" value="로그아웃" onclick="logout()" class="btn btn-default" style="right: 1em; position: absolute;"></h1>
</div>
<br>

<div class="container">
  <div class="row">
    <nav class="col-sm-3">
      <ul class="nav nav-pills nav-stacked" data-spy="affix" data-offset-top="205">
		<li><a href="#" onclick="company_add()">업체 등록</a></li>
        <li><a href="#" onclick="company_modify_delete()">업체 수정 및 삭제</a></li>
        <li><a href="#" onclick="dangerArea_add()">위험지역 등록</a></li>
        <li class="active"><a href="#" onclick="dangerArea_delete()">위험지역 삭제</a></li>
      </ul>
    </nav>
    <div class="col-sm-9">   
      <h1>위험지역 삭제</h1>
		
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
</div>
</body>
</html>