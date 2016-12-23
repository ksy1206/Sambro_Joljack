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
<link href="<%=cp%>/css/bootstrap.min.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="<%=cp%>/js/bootstrap.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
$(document).ready(function(){
	
	//로그인 text창 유효성 검사 함수
	$("#check_join").click(function(){
		var member_id = $("#member_id").val();
		var member_pwd = $("#member_pwd").val();
		var member_pwd_confirm = $("#member_pwd_confirm").val();
		var answer = $("#answer").val();
		var member_name = $("#member_name").val();
		var addr1 = $("#addr1").val();
		var addr2 = $("#addr2").val();
		var mobile2 = $("#mobile2").val();
		var mobile3 = $("#mobile3").val();
		var email1 = $("#email1").val();
		var email2 = $("#email2").val();
		
		if(member_id == null || member_id == ""){
			alert("아이디를 입력하세요.");
		} 
		else if(member_pwd == null || member_pwd == ""){
			alert("비밀번호를 입력하세요.");
		}
		else if(member_pwd == null || member_pwd == ""){
			alert("비밀번호를 확인 하세요.");
		}
		else if(answer == null || answer == ""){
			alert("답변을 입력하세요.");
		}
		else if(member_name == null || member_name == ""){
			alert("이름을 입력하세요.");
		}
		else if(addr1 == null || addr1 == ""){
			alert("주소를 입력 하세요.");
		}
		else if(addr2 == null || addr2 == ""){
			alert("상세주소를 입력 하세요.");
		}
		else if(mobile2 == null || mobile2 == ""){
			alert("핸드폰 번호를 입력 하세요.");
		}
		else if(mobile3 == null || mobile3 == ""){
			alert("핸드폰 번호를 입력 하세요.");
		}
		else if(email1 == null || email1 == ""){
			alert("E-mail 주소를 입력하세요.");
		}
		else if(email2 == null || email2 == ""){
			alert("E-mail 주소를 입력하세요.");
		} else {
			document.insert_member.action = '<%=cp%>/member/insert_member.do';
		    document.insert_member.submit();
		}
	});	
});

/*다음 주소 API */
function openDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
           $("#postcode_num").val(data.zonecode);
           $("#addr1").val(data.address);
        },
        //테마 색상 변경
        theme: {
            searchBgColor: "#345391",
            queryTextColor: "#FFFFFF"
        }

    }).open();
}
//비밀번호 확인 함수
function check_pwd(){
	var member_pwd = $("#member_pwd").val();
	var member_pwd_confirm = $("#member_pwd_confirm").val();
	
	if(member_pwd != member_pwd_confirm){
		alert("비밀번호가 일치하지 않습니다. 다시 입력하세요.");
		$("#member_pwd_confirm").val("");
	} else {
		alert("비밀번호가 일치 합니다.")
	}
}
//이메일 자동 입력 함수
function email_change(){
	var email3 = $("#email3").val();
	$("#email2").val(email3);
}

//취소 버튼
function call_back(){
	history.go(-1);
}
</script>

</head>

<body>

	<jsp:include page="../header.jsp"/>
	
	<div style="margin-top: 3em;">
		<form class="form-horizontal" role="form" id="insert_member" name="insert_member">
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="member_id">ID:</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="member_id" name="member_id" placeholder="Enter ID">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="member_pwd">Password:</label>
		    <div class="col-sm-8"> 
		      <input type="password" class="form-control" id="member_pwd" name="member_pwd" placeholder="Enter password">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="member_pwd_confirm">Password Confirm:</label>
		    <div class="col-sm-8"> 
		      <input type="password" class="form-control" id="member_pwd_confirm" placeholder="Enter password" onchange="check_pwd()">
		    </div>
		  </div>
	      <div class="form-group">
		    <label class="control-label col-sm-2" for="question">Question:</label>
		    <div class="col-sm-8">
		    	<select class="form-control" id="question" name="question">
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
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="hint_answer">Answer:</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="answer" name="answer" placeholder="Answer">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="member_name">Name:</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="member_name" name="member_name" placeholder="Name">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="address">Address:</label>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="postcode_num" name="postcode_num" placeholder="신 우편번호" readonly="readonly">
		    </div>	
		    <div class="col-sm-2">
		      <input type="button" class="btn btn-default" value="우편번호" onclick="openDaumPostcode();">
		    </div>	    
		  </div>
		  
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="member_name"></label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="addr1" name="addr1" placeholder="주소" readonly="readonly">
		    </div>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="addr2" name="addr2" placeholder="상세주소">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="hint">Tel:</label>
		    <div class="col-sm-1">
		    	<select class="form-control" id="phone1" name="phone1">
			    	<option value="02">02</option>
					<option value="031">031</option>
					<option value="032">032</option>
					<option value="033">033</option>
					<option value="041">041</option>
					<option value="042">042</option>
					<option value="043">043</option>
					<option value="044">044</option>
					<option value="051">051</option>
					<option value="052">052</option>
					<option value="053">053</option>
					<option value="054">054</option>
					<option value="055">055</option>
					<option value="061">061</option>
					<option value="062">062</option>
					<option value="063">063</option>
					<option value="064">064</option>
					<option value="0502">0502</option>
					<option value="0503">0503</option>
					<option value="0504">0504</option>
					<option value="0505">0505</option>
					<option value="0506">0506</option>
					<option value="0507">0507</option>
					<option value="070">070</option>
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>		
				</select>
		     </div>		
		     <div class="col-sm-1">
		     	<input type="text" class="form-control" id="phone2" name="phone2" maxlength="4">
		     </div>
		     <div class="col-sm-1">
		    	<input type="text" class="form-control" id="phone3" name="phone3" maxlength="4">
		     </div>    
		  </div>

		  <div class="form-group">
		    <label class="control-label col-sm-2" for="hint">Mobile:</label>
		    <div class="col-sm-1">
		    	<select class="form-control" id="mobile1" name="mobile1">
			    	<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>	
				</select>
		     </div>		
		     <div class="col-sm-1">
		     	<input type="text" class="form-control" id="mobile2" name="mobile2" maxlength="4">
		     </div>
		     <div class="col-sm-1">
		    	<input type="text" class="form-control" id="mobile3" name="mobile3" maxlength="4">
		     </div>    
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="email">Email:</label>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="email1" name="email1" placeholder="Email">
		    </div>
		    <div class="col-sm-1" style="width: 3%; margin-top: 0.3em;">
		      @
		    </div>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="email2" name="email2" placeholder="Email">
		    </div>
		    <div class="col-sm-2">
		    	<select class="form-control" id="email3" onchange="email_change()">		    	
					<option value="">직접입력</option>
			    	<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="nate.com">nate.com</option>
					<option value="hotmail.com">hotmail.com</option>
					<option value="yahoo.com">yahoo.com</option>
					<option value="empas.com">empas.com</option>
					<option value="korea.com">korea.com</option>
					<option value="dreamwiz.com">dreamwiz.com</option>
					<option value="gmail.com">gmail.com</option>
				</select>
		     </div>
		  </div>
		  
		  <div class="form-group"> 
		    <div class="col-sm-offset-2 col-sm-2">
		      <button type="button" class="btn btn-default" id="check_join">Join</button>
		      <button type="button" class="btn btn-default" onclick="call_back()">Cancel</button>
		    </div>
		  </div>
		</form>
	</div>
</body>
</html>