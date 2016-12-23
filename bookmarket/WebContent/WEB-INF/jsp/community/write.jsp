<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.GregorianCalendar" %>
<%  
	String cp = request.getContextPath();
	GregorianCalendar now = new GregorianCalendar();
	String date = String.format("%TF", now);
	String time = String.format("%TT", now);
%>
<!DOCTYPE html>
<html>
<head>

<title>북마켓</title>
<meta charset="utf-8" />
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" href="../css/login.css">
<link rel="stylesheet" href="../css/bootstrap.css">

<script type="text/javascript">
//커뮤니티 글 DB 입력 이동 함수
function insert_write(){
	document.insert_community.action = '<%=cp%>/community/insert_community.do';
    document.insert_community.submit();
}
// 취소 함수
function call_back(){
	history.go(-1);
}

</script>
</head>

<body>

	<jsp:include page="../header.jsp"/>
	
	<form class="form-horizontal" role="form" id="insert_community" name="insert_community" style="margin-top: 3em;">
			
		<div class="form-group">
			<label class="control-label col-sm-2" for="Writer">Writer:</label>
			<div class="col-sm-8">
			<input type="text" class="form-control" id="member_name" name="member_name" value="${sessionScope.sessionData.memberInfo.getMember_name()}">
			</div>
		</div>c
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="subject">Subject:</label>
			<div class="col-sm-8">
			<input type="text" class="form-control" id="subject" name="subject" placeholder="제목을 입력 하세요.">
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="comment">Comment:</label>
			<div class="col-sm-8">
				<textarea class="form-control" rows="20" id="comment" name="comment"></textarea>
			</div>
		</div>	  		  
		  
		  <div class="form-group"> 
		    <div class="col-sm-offset-2 col-sm-2">
		      <button type="button" class="btn btn-default" onclick="insert_write()">등록</button>
		      <button type="button" class="btn btn-default" onclick="call_back()">취소</button>
		    </div>
		  </div>
		  <input type="hidden" value="${sessionScope.sessionData.memberInfo.getMember_no()}" id="member_no" name="member_no">
		  <input type="hidden" value="<%=date %> <%=time %>" id="date" name="date">
		</form>

</body>
</html>