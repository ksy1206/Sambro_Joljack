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
//커뮤니티 글 수정 및 글 작성자 check
function modify_open(member_no){
	var session_member_no = $("#session_member_no").val();
	if(session_member_no == member_no){
		document.getElementById('subject').readOnly = false;
		document.getElementById('comment').readOnly = false;
		document.getElementById('modify_button').style.display = "none";
		document.getElementById('modify_button_complete').style.display = "";		
	} else {
		alert("작성자만 수정 가능합니다.")
	}
}
//커뮤니티 글 DB 수정
function modify_community(){
	document.insert_community.action = '<%=cp%>/community/update_community.do';
    document.insert_community.submit();
}
//커뮤니티 글 삭제
function delete_community(member_no){
	var session_member_no = $("#session_member_no").val();
	if(session_member_no == member_no){
		var community_no = $("#community_no").val();
		location.href="<%=cp%>/community/delete_community.do?community_no="+community_no;
	} else {
		alert("작성자만 삭제 가능합니다.")
	}
}
</script>
</head>

<body>

	<jsp:include page="../header.jsp"/>
	
	<input type="hidden" value="${sessionScope.sessionData.memberInfo.getMember_no()}" id="session_member_no">
	<input type="hidden" value="${data.community_no}" id="community_no">
	
	<form class="form-horizontal" role="form" id="insert_community" name="insert_community" style="margin-top: 3em;">
			
		<div class="form-group">
			<label class="control-label col-sm-2" for="Writer">Writer:</label>
			<div class="col-sm-8">
			<input type="text" class="form-control" id="member_name" name="member_name" value="${data.member_name}" readonly="readonly">
			</div>
		</div>c
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="subject">Subject:</label>
			<div class="col-sm-8">
			<input type="text" class="form-control" id="subject" name="subject" value="${data.subject}" readonly="readonly">
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="comment">Comment:</label>
			<div class="col-sm-8">
				<textarea class="form-control" rows="20" id="comment" name="comment" readonly="readonly">${data.comment}</textarea>
			</div>
		</div>	  		  
		  
		  <div class="form-group"> 
		    <div class="col-sm-offset-2 col-sm-2">
		      <button type="button" class="btn btn-default" onclick="modify_open('${data.member_no}')" id="modify_button">수정</button>
		      <button type="button" class="btn btn-default" onclick="modify_community()" id="modify_button_complete" style="display: none;">수정 완료</button>
		      <button type="button" class="btn btn-default" onclick="delete_community('${data.member_no}')">삭제</button>
		    </div>
		  </div>
		  <input type="hidden" value="${data.community_no }" id="community_no" name="community_no">
		  <input type="hidden" value="${sessionScope.sessionData.memberInfo.getMember_no()}" id="member_no" name="member_no">
		  <input type="hidden" value="<%=date %> <%=time %>" id="date" name="date">
		</form>

</body>
</html>