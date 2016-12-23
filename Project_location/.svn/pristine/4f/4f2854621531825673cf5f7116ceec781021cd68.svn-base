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
function logout(){
	location.href="<%=cp%>/web/logout.do";
}
$(document).ready(function(){
	var checkPage = $("#return_value").val();
	if(checkPage == "addOk"){
		alert("등록이 완료 되었습니다.");
		$("#return_value").val("");
	}
	
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
			alert("업체의 종류를 입력해 주세요.(ex] 치킨, 피자 등...)")
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
    document.addCompany_form.action = '<%=cp%>/web/addCompany_form.do';
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
<div class="container-fluid" style="background-color:#2196F3;color:#fff;height:100px;">
  <h1>관리자 PAGE <input type="button" value="로그아웃" onclick="logout()" class="btn btn-default" style="right: 1em; position: absolute;"></h1>
</div>
<br>
<input type="hidden" value="${return_value}" id="return_value">
<div class="container">
  <div class="row">
    <nav class="col-sm-3">
      <ul class="nav nav-pills nav-stacked" data-spy="affix" data-offset-top="205">
<!--         <li class="active"><a href="#" onclick="">맛집 등록</a></li> -->
		<li class="active"><a href="#" onclick="company_add()">업체 등록</a></li>
        <li><a href="#" onclick="company_modify_delete()">업체 수정 및 삭제</a></li>
        <li><a href="#" onclick="dangerArea_add()">위험지역 등록</a></li>
        <li><a href="#" onclick="dangerArea_delete()">위험지역 삭제</a></li>
      </ul>
    </nav>
    <div class="col-sm-9">   
      <h1>업체 등록</h1>
      	<form role="form" method="post" id="addCompany_form" name="addCompany_form" style="margin-top: 1em;">
			<div>
			<input type="hidden" value="${sessionScope.sessionData.memberInfo.getMember_no()}" id="member_no" name="member_no">
			
			  <div class="form-group">
			    <label for="c_name">업체명</label>
			    <input type="text" class="form-control" id="c_name" name="c_name">
			  </div>
			  
			  <div class="form-group">
			    <label for="c_type">업종</label>
				<select class="form-control" id="c_type" name="c_type">
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
			  
			  <div style="margin-bottom: 1em;">
				<input type="text" value="위도" id="latitude" name="c_latitude" readonly="readonly">
				<input type="text" value="경도" id="longitude" name="c_longitude" readonly="readonly">
			  </div>

			  <div class="form-group">
			    <label for="c_phone">연락처</label>
			    <input type="number" class="form-control" id="c_phone" name="c_phone">
			  </div>
			  
			  <div class="form-group">
				<label for="c_content">상세 정보</label>
				<textarea class="form-control" rows="10" id="c_content" style="resize:none;" name="c_content"></textarea>
			  </div>
			  <input type="button" value="등록" id="singUp" class="btn btn-default">
			  </div>
		</form>
    </div>
  </div>
</div>
</body>
</html>