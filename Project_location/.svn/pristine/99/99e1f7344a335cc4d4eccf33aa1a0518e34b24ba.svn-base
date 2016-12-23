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
<!-- <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script> -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD60rwjxUjBDRiDUUfwQvNhjiP8d8hXVD8"></script>
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
	
	$("#singUp").click(function(){
		var c_name = $("#c_name").val();
		var c_type = $("#c_type").val();
		var c_address = $("#c_address").val();
		var c_phone = $("#c_phone").val();
		var c_content = $("#c_content").val();
		var latitude = $("#latitude").val();
		var longitude = $("#longitude").val();
		
		if(c_name == null || c_name == ""){
			alert("업체명을 입력해 주세요.")
		} else if (c_type == null || c_type == ""){
			alert("업체의 종류를 입력해 주세요.")
		} else if (c_address == null || c_address == ""){
			alert("업체 주소를 입력해 주세요.")
		} else if (c_phone == null || c_phone == ""){
			alert("업체 연락처를 입력해 주세요.")
		} else if (c_content == null || c_content == ""){
			alert("업체의 상세 정보를 입력해 주세요.")
		} else if (latitude == "위도"){
			alert("정확한 주소입력 후 주소변환 버튼을 클릭해 주세요.")
		} else {
			confirm();
		}
		
	});
	
});

function change_address(){
	var c_address = $("#c_address").val();
	getLocation();
}

function confirm(){
    document.addCompany_form.action = '<%=cp%>/main/addCompany_form.do';
    document.addCompany_form.submit();
}

//위도 경도 구하기
var geocoder = new google.maps.Geocoder(); 
function getLocation() {
		
	var address = $("#c_address").val();

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
		<input type="hidden" value="${sessionScope.sessionData.memberInfo.getMember_no()}" id="member_no" name="member_no">
		<div data-role="hearder" data-position="fixed">
			<h1 style="font-size: 1.8em; margin-left: 1em;">
				업체 관리
				<img src="../img/home.png" id="go_home" style="width: 1.2em;  position: absolute; right: 1em;">
			</h1>
			
		</div>
		
		<input type="hidden" value="${return_value}" id="return_value">
		
		<div data-role="content">
			<div class="btn-group btn-group-justified">
			   <a href="#" id="add_company" class="btn btn-primary" style="background-color: #C4DEFF !important;">업체 등록</a>
			   <a href="#" id="modify_company" class="btn btn-primary" style="background-color: #fff !important;">업체 수정</a>
			   <a href="#" id="delete_company" class="btn btn-primary" style="background-color: #fff !important;">업체 삭제</a>
			</div>			
			
			<form role="form" method="post" id="addCompany_form" name="addCompany_form" style="margin-top: 1em;">
			
			<input type="hidden" value="${sessionScope.sessionData.memberInfo.getMember_no()}" id="member_no" name="member_no">
			
			  <div class="form-group">
			    <label for="c_name">업체명</label>
			    <input type="text" class="form-control" id="c_name" name="c_name">
			  </div>
			  
			  <div class="form-group">
			    <label for="c_type">업종</label>
				<select id="c_type" name="c_type">
				  <option selected="selected" value="">업종 선택</option>
				  <option value="맛집">맛집</option>
				  <option value="화장실">화장실</option>
				  <option value="옷가게">옷가게</option>
				  <option value="로드샵">로드샵</option>
				  <option value="기타">기타</option>
				</select>
			  </div>
			  
			  <div class="form-group">
			    <label for="c_address">주소</label>
			    <input type="text" class="form-control" id="c_address" name="c_address" onchange="change_address()">
			  </div>
			  
			  <div class="ui-grid-a">
			  	<div class="ui-block-a">
					<input type="text" value="위도" id="latitude" name="c_latitude" readonly="readonly">
				</div>
				<div class="ui-block-b">
					<input type="text" value="경도" id="longitude" name="c_longitude" readonly="readonly">
				</div>				  
			  </div>
			  
			  <div class="form-group">
			    <label for="c_phone">연락처</label>
			    <input type="number" class="form-control" id="c_phone" name="c_phone">
			  </div>
			  
			  <div class="form-group">
				<label for="c_content">상세 정보</label>
				<textarea class="form-control" rows="10" id="c_content" style="resize:none;" name="c_content"></textarea>
			  </div>
			  <input type="button" value="등록" id="singUp" class="btn btn-default" style="position: fixed; right:1.5em !important;">
			</form>
		</div>
				
	</div>
</body>
</html>