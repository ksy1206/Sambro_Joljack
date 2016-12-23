<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.Map" %>
<%@page import="cmd.vo.CmdVO"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	Map sessionData = null;
	  
    boolean isSession = true;
    CmdVO vo = null;
    String member_id="";
    String member_no = "";
    String hp = "";
   
    if (session.getAttribute("sessionData") != null) {
    	
    	 sessionData = (Map)session.getAttribute("sessionData");
		 member_id = sessionData.get("member_id").toString();	
		 member_no = sessionData.get("member_no").toString();	
		 hp = sessionData.get("hp").toString();	
       
    } else {
        isSession = false;
        session.removeAttribute("sessionData");
    }

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD60rwjxUjBDRiDUUfwQvNhjiP8d8hXVD8"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	
});


//대기인원 등록

function insert_wait(){

	var start_time = $("#start_time").val();
	var start_point = $("#start_point").val();
	var end_point = $("#end_point").val();
	var cnt = $("#cnt").val();
	var pay = $("#pay").val();
	var title = $("#title").val();
	
	var member_no = "<%=member_no%>";
	var hp = "<%=hp%>";
// 	if(start_time== "" || start_time == "null" || start_time == null){
// 		alert("시간을 입력하세요!");
// 		return false;
// 	}
// 	if(start_point == "" || start_point == "null" || start_point == null){
// 		alert("출발지를 입력하세요!");
// 		return false;
// 	}
// 	if(end_point == "" || end_point == "null" || end_point == null){
// 		alert("도착지를 입력하세요!");
// 		return false;
// 	}
// 	if(cnt== "" || cnt == "null" || cnt == null){
// 		alert("인원을 입력하세요!");
// 		return false;
// 	}
// 	if(pay == "" || pay == "null" || pay == null){
// 		alert("사례을 입력하세요!");
// 		return false;
// 	}
	
	
	getLocation();
	
	var latitude = $('#latitude').val();
	var longitude = $('#longitude').val();
	
	if(latitude == "" || longitude == ""){
		alert("주소를 정확히 입력하셔야 합니다.");
		return false;
	}
	
	
// 	alert("위도:"+latitude+" 경도:"+longitude);
	
	
	
	var params = "start_time="+start_time+"&start_point="+start_point+"&end_point="+end_point+"&cnt="+cnt+"&pay="+pay+"&title="+title+"&member_no="+member_no+"&latitude="+latitude+"&longitude="+longitude+"&hp="+hp;
	
	    $.ajax({
	        type        : "POST" 
	      , async       : false
	      , url         : "/cmd/insert_carpool.do"
	      , data        : params
	      , dataType    : "json"
	      , timeout     : 30000  
	      , cache       : false    
	      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
	      , error       : function(request, status, error) {
	               alert( "작업 도중 오류가 발생하였습니다. " );
	                
	      }
	      , success     : function(data) {
	           
	      	if(data.result=="1"){
	      		alert("등록성공!");
	      		location.href = "/wsk/wait_socket.do";	
	      	}else{
	      		alert("등록실패!");
// 	      		location.href = "/cmd/board.do";	
	      		return false;
	      	}
	                
	      }
		});
 }
 
 
//위도 경도 구하기
var geocoder = new google.maps.Geocoder(); 
function getLocation() {
		
	var address = $("#start_point").val();
	 
	geocoder.geocode({'address': address}, function(results, status) {
		
		if( status == google.maps.GeocoderStatus.OK ) {  
			
			if (results.length == 1) {
				
				var location = "" + results[0].geometry.location;
				
				location = location.substring(1, location.length-1);
				
				var array_data = location.split(", ");
			    
				var latitude = array_data[0];
				var longitude = array_data[1];
				
				$('#latitude').val(latitude);
				$('#longitude').val(longitude);
				
			} else {
				alert(results.length + "개의 결과를 찾았습니다.");
			}
		} else {
			alert('실패.');
		}
	});
}

</script>

<body>

<div data-role="page" id="pageone">
	<div data-role="header">
	    <div data-role="navbar">
	      <ul>
	        <li><a href="#">카풀 어플</a></li>
	        
	      </ul>
	    </div>
	  </div>
  <div data-role="main" class="ui-content">
   
      
     <div class="ui-field-contain">
     	<label for="title">제목</label>
        <input type="text" name="title" id="title">     
        <label for="start_time">시간</label>
        <input type="text" name="start_time" id="start_time">     
        <label for="start_point">출발지</label>
        <input type="text" name="start_point" id="start_point">       
        <label for="end_point">도착지</label>
        <input type="text" name="end_point" id="end_point">       
        <label for="cnt">인원</label>
        <input type="text" name="cnt" id="cnt">       
        <label for="pay">사례</label>
        <input type="text" name="pay" id="pay">         
      </div>
      
      <div class="ui-block">
      	<button type="button" data-theme="b"  onclick="insert_wait();" >확인</button>
      </div>
   
 
  </div>
  
   <div data-role="footer" data-position="fixed">
   		<input type="hidden" id='latitude' value="">
   		<input type="hidden" id='longitude' value="">
	</div> 
</div>
</body>
</html>