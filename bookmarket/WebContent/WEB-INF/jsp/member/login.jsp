<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%  
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>

<title>북마켓</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" href="../css/login.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<script type="text/javascript">

//로그인 check
function login_check(){
	var member_id = $("#member_id").val();
	var member_pwd = $("#member_pwd").val();
	
	if(member_id == null || member_id == ""){
		alert("아이디를 입력 하세요.")
	} else if(member_pwd == null || member_pwd == ""){
		alert("비밀번호를 입력 하세요.")
	} else {
		var params = "member_id="+member_id+"&member_pwd="+member_pwd;
		$.ajax({
	        type        : "POST"  
	      , async       : false 
	      , url         : "/member/member_check.do"
	      , data        : params
	      , dataType    : "json" 
	      , timeout     : 30000
	      , cache       : false     
	      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
	      , error       : function(request, status, error) {
				alert("작업 도중 오류가 발생하였습니다. 자세한 사항은 고객센터에 문의하십시오.");       
	      }
	      , success     : function(data) {
	    	  if(data.check == "no"){
	    		  alert("아이디 또는 비밀번호가 일치하지 않습니다.");
	    	  } else {
	    		  alert("환영합니다");
	    		  location.href="<%=cp%>/cmd/main.do";
	    	  }			    	  
	      }
    	});
	}
}
//회원가입 page 이동하기
function move_join(){
	location.href="<%=cp%>/member/move_join.do";
}
//id찾기
function find_id(){
	var member_name = $("#find_member_name").val();
	var member_pwd = $("#find_member_pwd").val();
	var question = $("#question").val();
	var answer = $("#answer").val();
	var params = "member_name="+member_name+"&member_pwd="+member_pwd+"&question="+question+"&answer="+answer;
	$.ajax({
        type        : "POST"  
      , async       : false 
      , url         : "/member/find_member_id.do"
      , data        : params
      , dataType    : "json" 
      , timeout     : 30000
      , cache       : false     
      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
      , error       : function(request, status, error) {
			alert("작업 도중 오류가 발생하였습니다. 자세한 사항은 고객센터에 문의하십시오.");       
      }
      , success     : function(data) {
    	  if(data.check == "no"){
    		  alert("입력한 정보가 일치하지 않습니다.");
    	  } else {
    		  alert("아이디는 "+data.member_id+" 입니다.");
    		  $("#find_member_name").val("");
   			  $("#find_member_pwd").val("");
   			  $("#answer").val("");
    	  }			    	  
      }
	});
}
//비밀번호 찾기
function find_pwd(){
	var member_name = $("#find_member_name_pwd").val();
	var member_id = $("#find_member_id_pwd").val();
	var question = $("#question_pwd").val();
	var answer = $("#answer_pwd").val();
	var params = "member_name="+member_name+"&member_id="+member_id+"&question="+question+"&answer="+answer;
	$.ajax({
        type        : "POST"  
      , async       : false 
      , url         : "/member/find_member_pwd.do"
      , data        : params
      , dataType    : "json" 
      , timeout     : 30000
      , cache       : false     
      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
      , error       : function(request, status, error) {
			alert("작업 도중 오류가 발생하였습니다. 자세한 사항은 고객센터에 문의하십시오.");       
      }
      , success     : function(data) {
    	  if(data.check == "no"){
    		  alert("입력한 정보가 일치하지 않습니다.");
    	  } else {
    		  alert("비밀번호는 "+data.member_pwd+" 입니다.");
    		  $("#find_member_name_pwd").val("");
   			  $("#find_member_id_pwd").val("");
   			  $("#answer_pwd").val("");
    	  }			    	  
      }
	});
}

</script>
</head>

<body>

	<jsp:include page="../header.jsp"/>
		
	<div>
		<div class="title">
			<div>LOGIN</div>
		</div>
		<div class="body">
			<div class="contents">
				<div class="login">
					<div>
						<label>ID</label><br>
						<input type="text" id="member_id">
					</div>
					<div>
						<label>PASSWORD</label><br>
						<input type="password" id="member_pwd">
					</div>
					<div>
						<div class="login-btn" onclick="login_check()">LOGIN</div>
					</div>
				</div>
				<div>
					<div>
						<a>
							<button type="button" class="btn btn-info btn-xs" data-toggle="modal" data-target="#myModal">Find ID</button>
						</a>
						<a>
							<button type="button" class="btn btn-info btn-xs" data-toggle="modal" data-target="#myModal2">Find Password</button>
						</a>
					</div>
					<div class="join" style="margin-top: 1em !important;">
						<div class="join-btn" onclick="move_join()">JOIN</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container">
	
	  <!-- Modal -->
	  <div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Find ID</h4>
	        </div>
	        <div class="modal-body">
				  <div class="form-group">
				    <label for="member_name">Name:</label>
				    <input type="text" class="form-control" id="find_member_name">
				  </div>
				  <div class="form-group">
				    <label for="pwd">Password:</label>
				    <input type="password" class="form-control" id="find_member_pwd">
				  </div>
				  <div class="form-group">
				    <label class="control-label" for="question">Question:</label>
				    	<select class="form-control" id="question">
							<option value="기억에 남는 추억의 장소는?">기억에 남는 추억의 장소는?</option>
							<option value="자신의 인생 좌우명은?">자신의 인생 좌우명은?</option>
							<option value="자신의 보물 제1호는?">자신의 보물 제1호는?</option>
							<option value="가장 기억에 남는 선생님 성함은?">가장 기억에 남는 선생님 성함은?</option>
							<option value="타인이 모르는 자신만의 신체비밀이 있다면?">타인이 모르는 자신만의 신체비밀이 있다면?</option>
							<option value="추억하고 싶은 날짜가 있다면?">추억하고 싶은 날짜가 있다면?</option>
							<option value="받았던 선물 중 기억에 남는 독특한 선물은?">받았던 선물 중 기억에 남는 독특한 선물은?</option>
							<option value="유년시절 가장 생각나는 친구 이름은?">유년시절 가장 생각나는 친구 이름은?</option>
							<option value="인상 깊게 읽은 책 이름은?">인상 깊게 읽은 책 이름은?</option>
							<option value="읽은 책 중에서 좋아하는 구절이 있다면?">읽은 책 중에서 좋아하는 구절이 있다면?</option>
						</select>  
				  </div>
				  <div class="form-group">
				    <label for="answer">Answer:</label>
				    <input type="text" class="form-control" id="answer">
				  </div>
				  <button type="button" class="btn btn-default" onclick="find_id()">찾기</button>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>	  
	  
	  <!-- Modal -->
	  <div class="modal fade" id="myModal2" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Find Password</h4>
	        </div>
	        <div class="modal-body">
				  <div class="form-group">
				    <label for="member_name">Name:</label>
				    <input type="text" class="form-control" id="find_member_name_pwd">
				  </div>
				  <div class="form-group">
				    <label for="id">ID:</label>
				    <input type="text" class="form-control" id="find_member_id_pwd">
				  </div>
				  <div class="form-group">
				    <label class="control-label" for="question">Question:</label>
				    	<select class="form-control" id="question_pwd">
							<option value="기억에 남는 추억의 장소는?">기억에 남는 추억의 장소는?</option>
							<option value="자신의 인생 좌우명은?">자신의 인생 좌우명은?</option>
							<option value="자신의 보물 제1호는?">자신의 보물 제1호는?</option>
							<option value="가장 기억에 남는 선생님 성함은?">가장 기억에 남는 선생님 성함은?</option>
							<option value="타인이 모르는 자신만의 신체비밀이 있다면?">타인이 모르는 자신만의 신체비밀이 있다면?</option>
							<option value="추억하고 싶은 날짜가 있다면?">추억하고 싶은 날짜가 있다면?</option>
							<option value="받았던 선물 중 기억에 남는 독특한 선물은?">받았던 선물 중 기억에 남는 독특한 선물은?</option>
							<option value="유년시절 가장 생각나는 친구 이름은?">유년시절 가장 생각나는 친구 이름은?</option>
							<option value="인상 깊게 읽은 책 이름은?">인상 깊게 읽은 책 이름은?</option>
							<option value="읽은 책 중에서 좋아하는 구절이 있다면?">읽은 책 중에서 좋아하는 구절이 있다면?</option>
						</select>  
				  </div>
				  <div class="form-group">
				    <label for="answer">Answer:</label>
				    <input type="text" class="form-control" id="answer_pwd">
				  </div>
				  <button type="button" class="btn btn-default" onclick="find_pwd()">찾기</button>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
	</div>
	
</body>
</html>