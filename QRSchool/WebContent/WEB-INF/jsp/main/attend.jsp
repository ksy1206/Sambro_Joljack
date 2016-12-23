<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%  
	String cp = request.getContextPath();
	String member_no="";

	boolean isSession = true;
	
	if (session.getAttribute("member_no") != null) {
	   
		member_no = session.getAttribute("member_no").toString();

	  
	} else {
	    isSession = false;
	    session.removeAttribute("sessionData");
	}
%>
<!DOCTYPE html>
<html>
<head>

<title>출석체크</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>

<link href="<%=cp%>/css/bootstrap.min.css" rel="stylesheet">
<script src="<%=cp%>/js/bootstrap.js"></script>

<!-- 세션 없으면 메인페이지로 강제 이동 -->
<c:if test="${sessionScope.sessionData.memberInfo.getMember_no() == null || sessionScope.sessionData.memberInfo.getMember_no() ==''}">
	<script>
		location.href="${pageContext.request.contextPath}/cmdQR/login.do";
	</script>
</c:if>

<script type="text/javascript">
	
	$(document).ready(function(){
		attend_list();
		attend_count();
	});//end document
	
	//출석, 지각, 병결 등 숫자를 체크하는 함수.
	function attend_count(){
		var class_code = $("#class_code").val();
		var params = "member_no="+<%=member_no%>+"&class_code="+class_code;
		
		$.ajax({
	        type        : "POST" 
	      , async       : false
	      , url         : "/cmdQR/attend_count.do"
	      , data        : params
	      , dataType    : "json"
	      , timeout     : 30000  
	      , cache       : false    
	      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
	      , error       : function(request, status, error) {
	               alert( "작업 도중 오류가 발생하였습니다. " );	                
	      }
	      , success     : function(data) {
	    	  if(data.count.count_attend_01 == null || data.count.count_attend_01 == "" || data.count.count_attend_01 == "undefined"){
	    		  document.getElementById("attend01").innerHTML = "출석 : 0";
	    	  } else {
	    		  document.getElementById("attend01").innerHTML = "출석 : "+data.count.count_attend_01;
	    	  }
	    	  if(data.count.count_attend_02 == null || data.count.count_attend_02 == "" || data.count.count_attend_02 == "undefined"){
	    		  document.getElementById("attend02").innerHTML = "지각 : 0";
	    	  } else {
	    		  document.getElementById("attend02").innerHTML = "지각 : "+data.count.count_attend_02;
	    	  }
	    	  if(data.count.count_attend_03 == null || data.count.count_attend_03 == "" || data.count.count_attend_03 == "undefined"){
	    		  document.getElementById("attend03").innerHTML = "결석 : 0";
	    	  } else {
	    		  document.getElementById("attend03").innerHTML = "결석 : "+data.count.count_attend_03;
	    	  }
	    	  if(data.count.count_attend_04 == null || data.count.count_attend_04 == "" || data.count.count_attend_04 == "undefined"){
	    		  document.getElementById("attend04").innerHTML = "병가 : 0";
	    	  } else {
	    		  document.getElementById("attend04").innerHTML = "병가 : "+data.count.count_attend_04;
	    	  }
	      }
		});
	}
	
	//리스트 불러오기 함수
	function attend_list(){
		var class_code = $("#class_code").val();
		var params = "member_no="+<%=member_no%>+"&class_code="+class_code;
		
	    $.ajax({
	        type        : "POST" 
	      , async       : false
	      , url         : "/cmdQR/attend_list.do"
	      , data        : params
	      , dataType    : "json"
	      , timeout     : 30000  
	      , cache       : false    
	      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
	      , error       : function(request, status, error) {
	               alert( "작업 도중 오류가 발생하였습니다. " );	                
	      }
	      , success     : function(data) {
	    	  var html = "";
		    	  html += "<table class='table table-striped' style='text-align: center; font-size: 20px;'>";
		    	  html += "<tbody>";
		    	  html += "<tr style='background-color: #6799FF !important; color: #fff; font-size: 14px !important;'>";
		    	  html += "<td>날&nbsp;짜</td>";
		    	  html += "<td>이&nbsp;름</td>";
		    	  html += "<td>출&nbsp;석</td>";
		    	  html += "<td>이의신청</td>";
		    	  html += "</tr>";
		    	  
		    	  $.each(data.list, function(index, list){
			    	  html += "<tr>";
			    	  html += "<td>"+list.insertDate+"</td>";
			    	  html += "<td>"+list.member_name+"</td>";
			    	  html += "<td>"+list.attend+"</td>";
			    	  if(list.attend == "출석"){
			    		  html += "<td><input type='button' value='신청' class='btn btn-warning'></td>";
			    	  } else {
			    		  html += "<td><input type='button' value='신청' class='btn btn-warning' onclick='question("+list.class_no+")'></td>";
			    	  }
			    	  
			    	  html += "</tr>";		    		  
		    	  });
		    	  
		    	  html += "</tbody>";
		    	  html += "</table>";

			$("#attend_list_view").html(html);
	      }
		});
	}
	
	//QR코드를 브릿지 통신을 이용해 안드로이드 스튜디오에 있는 qrcode()함수를 부르기
	function go_qrCode(){
		window.myAndorid.qrcode();
	}
	
	//안드로이드 qrcode()함수 호출 후 리턴 함수
	function receive_qrcode(data){
		if(data == "http://m.site.naver.com/0gFaU"){		
			attend_check();
			
			var class_code = $("#class_code").val();
			var attend = $("#attend").val();
			
			if(attend != null && attend != ''){
				var params = "member_no="+<%=member_no%>+"&class_code="+class_code+"&attend="+attend;
				
		 	    $.ajax({
		 	        type        : "POST" 
		 	      , async       : false
		 	      , url         : "/cmdQR/save_attend.do"
		 	      , data        : params
		 	      , dataType    : "json"
		 	      , timeout     : 30000  
		 	      , cache       : false    
		 	      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
		 	      , error       : function(request, status, error) {
		 	               alert( "작업 도중 오류가 발생하였습니다. " );	                
		 	      }
		 	      , success     : function(data) {
		 	    	  
		 	    	 var today = new Date();	 	    	 
	 	    	     var currentTime =
		 	    		(today.getYear()+1900)+"년 "+
		 	    		(today.getMonth()+1)+"월 "+
		 	    		 today.getDate()+"일 "+
		 	    		 today.getHours()+"시 "+
		 	    		 today.getMinutes()+ "분 ";
	 	    	     var html = "";
		 	    	  
		 	 			if(data.attend_data == "출석"){
		 	 				html += "<img src='../img/red_good.jpg' style='width:70%;'><br>";
		 	 				html += "<a href='#' data-rel='back' data-ajax='false'> 모범학생 이군요~!</a>";
		 	 			} else {	 	 				
		 	 				html += "<img src='../img/red_bad.jpg' style='width:70%; margin-bottom: 1em;'><br>";
		 	 				html += "<a href='#' data-rel='back' data-ajax='false'> 다음엔 조금 더 일찍...!</a>";
		 	 			}	 	 			
		 	 			document.getElementById("now").innerHTML = currentTime;
	 	 				$("#popupImg").html(html);
	 	 				$("#popupCheck").popup("open");
	 	 				attend_list();
	 	 				attend_count();
		 	      }
		 		});			
			} else {
				alert("출석 가능한 시간이 아닙니다.");
			}
		}
	}
	// 시간 체크 함수입니다.
	// 변수에 시간과 날짜를 가져와서, 시간표별로 조건이 맞는지 확인 한 후 출석, 지각, null로 표시를 합니다.
	// null 경우에는 출석 가능한 시간이 아니라는 alert창을 보여줍니다.
	function attend_check(){
		var class_code = $("#class_code").val();
		var attend = "";
		
		var time = new Date();
		var date = time.getDate();
		var hours = time.getHours();
		var minutes = time.getMinutes();
		var day = time.getDay();
		
		if(class_code == '01'){
			if( day == 3 ){
				if(hours < 8){
					attend = "";
				} else if (hours == 8){
					attend = "출석";
				} else if (hours > 9 && hours < 12){
					attend = "지각";
				} else if (hours > 12){
					attend = "";
				}				
			}
		} else if(class_code == '02'){
			if( day == 4 ){
				if(hours < 8){
					attend = "";
				} else if (hours == 8){
					attend = "출석";
				} else if (hours > 9 && hours < 12){
					attend = "지각";
				} else if (hours > 12){
					attend = "";
				}				
			}
		} else if(class_code == '03'){
			if( day == 5 ){
				if(hours < 8){
					attend = "";
				} else if (hours == 8){
					attend = "출석";
				} else if (hours > 9 && hours < 12){
					attend = "지각";
				} else if (hours > 12){
					attend = "";
				}				
			}
		} else if(class_code == '04'){
			if( day == 3 ){
				if(hours < 12){
					attend = "";
				} else if (hours == 12){
					attend = "출석";
				} else if (hours > 13 && hours < 16){
					attend = "지각";
				} else if (hours > 16){
					attend = "";
				}				
			}
		} else if(class_code == '05'){
			if( day == 4 ){
				if(hours < 12){
					attend = "";
				} else if (hours == 12){
					attend = "출석";
				} else if (hours > 13 && hours < 16){
					attend = "지각";
				} else if (hours > 16){
					attend = "";
				}
			}
		} else if(class_code == '06'){
			if (day == 5 ){
				if(hours < 12){
					attend = "";
				} else if (hours == 12){
					attend = "출석";
				} else if (hours > 13 && hours < 16){
					attend = "지각";
				} else if (hours > 16){
					attend = "";
				}				
			}
		}
		
		$("#attend").val(attend);
	}
	
	//이의신청 팝업창 함수
	function question(class_no){
		$("#class_no").val(class_no);
		$("#popupAttend").popup("open");
	}
	
	//팝업 닫기 함수
	function popupClose(){
		$("#popupAttend").popup("close");
	}
	
	//팝업 확인 눌렀을 경우 실행되는 함수
	function qusetion_confirm(){
		var class_no = $("#class_no").val();
		var reason = $("#reason").val();
		var params = "class_no="+class_no+"&reason="+reason;
		
	    $.ajax({
	        type        : "POST" 
	      , async       : false
	      , url         : "/cmdQR/question_add.do"
	      , data        : params
	      , dataType    : "json"
	      , timeout     : 30000  
	      , cache       : false    
	      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
	      , error       : function(request, status, error) {
	               alert( "작업 도중 오류가 발생하였습니다. " );	                
	      }
	      , success     : function(data) {
	    	  	popupClose();
				alert("이의 신정이 완료 되었습니다.");
	      }
		});
	}
	
	//뒤로가기 버튼 클릭시
	function call_back(){
		history.go(-1);
	}

</script>
</head>

<body>
<div data-role="page" style="background-color: #fff;">
	<div data-role="header" style="background-color: #0054FF; color: #ffffff;">
		<div class="ui-grid-a">
			<div class="ui-block-a" style="font-size: 34px; width: 48%;" onclick="call_back()">
				&nbsp;&nbsp;&lt;
			</div>
			<div class="ui-block-b" style="font-size: 24px; margin-top: 0.3em;">출석</div>
		</div>
	</div>
	
	<input type="hidden" value="${class_code }" id="class_code">
	<input type="hidden" value="" id="attend">
	<input type="hidden" value="" id="class_no">
	
	<div data-role="content">
		<div style="width: 100%;" align="center">
			<div class="ui-grid-a well well-sm" style="margin-bottom: 1em;">
				<div class="ui-block-a" style="font-size: 20px;">
					<c:if test="${class_code == '01' }">네트워크</c:if>
					<c:if test="${class_code == '02' }">기업탐구</c:if>
					<c:if test="${class_code == '03' }">Web</c:if>
					<c:if test="${class_code == '04' }">응용</c:if>
					<c:if test="${class_code == '05' }">프로젝트</c:if>
					<c:if test="${class_code == '06' }">App</c:if>
				</div>
				<div class="ui-block-b" style="font-size: 20px;">2학년 2학기</div>
			</div>
		</div>
		<div style="width: 100%;" align="center">
			<input type="button" value="QR출석체크" onclick="go_qrCode()" class="btn btn-primary">
<!-- 			<input type="button" value="출첵체크" onclick="receive_qrcode()" class="btn btn-primary"> -->
		</div>
		
		<div class="panel panel-default" style="margin-top: 1em;" id="attend_list_view">
		
		</div>
  </div>
	
	<div data-role="footer" data-position="fixed" align="center" style="font-size: 14px;">
		<p style="margin-top: 1em;">
			<div class="ui-grid-c">
				<div class="ui-block-a" id="attend01"></div>
				<div class="ui-block-b" id="attend02"></div>
				<div class="ui-block-c" id="attend03"></div>
				<div class="ui-block-d" id="attend04"></div>
			</div>
		</p>
	</div>
	
	<!-- 팝업 -->
	<div id="popupCheck" style="max-width: 400px;" data-role="popup" data-dismissible="false" class="board_footer_popup">
	    <div class="ui-content" role="main" align="center">
			<p id="now"></p>
			<div id="popupImg"></div>
	  	</div>    
	 </div>
	 
	 <!-- 팝업 -->
	<div id="popupAttend" style="max-width: 400px;" data-role="popup" data-dismissible="false" class="board_footer_popup">
	    <div class="ui-content" role="main" align="center">
			<p id="">사유를 적어 주세요.</p>
			<textarea id="reason" placeholder="이의 신정 이유"></textarea>
			<input type="button" class="btn btn-primary" value="등록" onclick="qusetion_confirm()">
			<input type="button" class="btn btn-primary" value="취소" onclick="popupClose()">
	  	</div>    
	 </div>
	
	
	
</div>
	
</body>
</html>