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
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD60rwjxUjBDRiDUUfwQvNhjiP8d8hXVD8"></script>
<!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDJ0uu0VBkZECtdYYHornJC-tILZi6Td_4"></script> -->
<!-- 세션 없으면 메인페이지로 강제 이동 -->
<c:if test="${sessionScope.sessionData.memberInfo.getMember_no() == null || sessionScope.sessionData.memberInfo.getMember_no() ==''}">
	<script>
		location.href="${pageContext.request.contextPath}/member/login.do";
	</script>
</c:if>
<script type="text/javascript">
$(document).ready(function(){
	
	var checkPage = $("#return_value").val();
	if(checkPage == "addOk"){
		alert("등록이 완료 되었습니다.");
		$("#return_value").val("");
	}
	
	$("#add_dangerArea").click(function(){
		location.href="<%=cp%>/main/adminDangerAreaAdd.do"
	});
	
	$("#delete_dangerArea").click(function(){
		var member_no = $("#member_no").val();
		location.href="<%=cp%>/main/adminDangerAreaDelete.do?member_no="+member_no;
	});
	
	$("#go_home").click(function(){
		location.href="<%=cp%>/main/main.do"
	});
	
	$("#singUp").click(function(){
		var d_name = $("#d_name").val();
		var d_address = $("#d_address").val();
		var d_content = $("#d_content").val();
		var latitude = $("#latitude").val();
		var longitude = $("#longitude").val();
		
		if(d_name == null || d_name == ""){
			alert("위험지역 이름을 입력해 주세요.")
		} else if (d_address == null || d_address == ""){
			alert("위험지역 주소(위치)를 정확하게 입력해 주세요.")
		} else if (d_content == null || d_content == ""){
			alert("위험지역 상세 정보를 입력해 주세요.")
		} else if (latitude == null || latitude == ""){
			alert("정확한 주소입력 후 위도 경도값을 확인하세요.")
		} else {
			confirm();
		}
		
	});
	
});

function change_address(){
	var c_address = $("#d_address").val();
	getLocation();
}

function confirm(){
    document.addDangerArea.action = '<%=cp%>/main/addDangerArea.do';
    document.addDangerArea.submit();
 }

//위도 경도 구하기
var geocoder = new google.maps.Geocoder(); 
function getLocation() {
		
	var address = $("#d_address").val();

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
</head>
<body>
	<div data-role="page">	
		
		<div data-role="hearder" data-position="fixed">
			<h1 style="font-size: 1.8em; margin-left: 1em;">
				위험지역 관리
				<img src="../img/home.png" id="go_home" style="width: 1.2em;  position: absolute; right: 1em;">
			</h1>
			
		</div>
		
		<input type="hidden" value="${return_value}" id="return_value">
		
		
		<div data-role="content">
			<div class="btn-group btn-group-justified">
			   <a href="#" id="add_dangerArea" class="btn btn-primary" style="background-color: #C4DEFF !important;">위험지역 등록</a>
			   <a href="#" id="delete_dangerArea" class="btn btn-primary" style="background-color: #fff !important;">위험지역 삭제</a>
			</div>			
			
			<form role="form" method="post" id="addDangerArea" name="addDangerArea" style="margin-top: 1em;">
			
			<input type="hidden" value="${sessionScope.sessionData.memberInfo.getMember_no()}" id="member_no" name="member_no">
				
			  <div class="form-group">
			    <label for="d_name">위험지역 이름</label>
			    <input type="text" class="form-control" id="d_name" name="d_name">
			  </div>
			  
			  <div class="form-group">
			    <label for="d_address">주소(위치)</label>
			    <input type="text" class="form-control" id="d_address" name="d_address" onchange="change_address()">
			  </div>
			  
			  <div class="ui-grid-a">
			  	<div class="ui-block-a">
					<input type="text" id="latitude" name="d_latitude" readonly="readonly" placeholder="위도">
				</div>
				<div class="ui-block-b">
					<input type="text" id="longitude" name="d_longitude" readonly="readonly" placeholder="경도">
				</div>				  
			  </div>
			  
			  <div class="form-group">
				<label for="d_content">상세 정보</label>
				<textarea class="form-control" rows="10" id="d_content" style="resize:none;" name="d_content"></textarea>
			  </div>
			  <input type="button" value="등록" id="singUp" class="btn btn-default" style="position: fixed; right:1.5em !important;">
			</form>
		</div>
				
	</div>
</body>
</html>