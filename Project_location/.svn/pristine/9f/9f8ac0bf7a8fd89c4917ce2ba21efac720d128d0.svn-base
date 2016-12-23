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
	
	$("#pageMove_list").click(function(){
		var latitude = $("#latitude").val();
		var longitude = $("#longitude").val();
		location.href="<%=cp%>/main/move_list.do?latitude="+latitude+"&longitude="+longitude;
	});
	
	$("#pageMove_main").click(function(){
		location.href="<%=cp%>/main/main.do"
	});
	
	$("#move_adminLogin").click(function(){
		location.href="<%=cp%>/main/admin_login.do"
	});	
	
});

//전화,문자 연결		
function connect(url, number){
	location.href=url+":"+number;
}

</script>

</head>
<body>
	<div data-role="page">
	
		<input type="hidden" value="${companyVo.c_latitude}" id="c_latitude">
		<input type="hidden" value="${companyVo.c_longitude}" id="c_longitude">
		
		<div data-role="hearder" data-position="fixed" style="text-align: center; background-color: #21B4D6;">
			<p style="font-size: 3em !important; color: #fff;">My Precious</p>
		</div>
		
		<div data-role="content">						
		  <div class="form-group">
		    <label for="c_name">업체명</label>
		    <input type="text" value="${companyVo.c_name}" class="form-control" id="c_name" name="c_name" readonly="readonly">
		  </div>
		  
		  <div class="form-group">
		    <label for="c_type">업종</label>
			<input type="text" value="${companyVo.c_type}" class="form-control" id="c_type" name="c_type" readonly="readonly">
		  </div>
		  
		  <div class="form-group">
		    <label for="c_address">주소</label>
		    <input type="text" value="${companyVo.c_address}" class="form-control" id="c_address" name="c_address" readonly="readonly">
		  </div>
		  
		  <div class="form-group">
		    <label for="c_phone">연락처</label>
		    <input type="number" value="${companyVo.c_phone}" class="form-control" id="c_phone" name="c_phone" readonly="readonly">
		  </div>
		  
		  <div class="form-group">
			<label for="c_content">상세 정보</label>
			<textarea class="form-control" rows="10" id="c_content" style="resize:none;" name="c_content" readonly="readonly">${companyVo.c_content}</textarea>
		  </div>
		  
		  <div>
		  	<div id="map-canvas" style="width: 100%; height: 250px;"></div>
		  </div>
		  
		  <div class="ui-grid-a" style="margin-top: 1em;">
			<div class="ui-block-a" style="text-align: center;">
				<input type="button" onclick="connect('tel','${companyVo.c_phone}');" value="통 화" class="btn btn-info" style="margin-bottom: 1em;">
			</div>
			<div class="ui-blick-b" style="text-align: center;">
				<input type="button" onclick="connect('sms','${companyVo.c_phone}');" value="문 자" class="btn btn-info" style="margin-bottom: 1em;">
			</div>					
		  </div>
		  		
		</div>			
				
		<div data-role="footer" data-position="fixed" style="text-align: center; background-color: #21B4D6;" id="move_adminLogin">
			<p style="margin-top: 10px; color: #fff;">관리자 로그인</p>
		</div>
				
	</div>
</body>
<script type="text/javascript">
      function initialize() {
		var latitude = $("#c_latitude").val();
		var longitude = $("#c_longitude").val();
        var mapLocation = new google.maps.LatLng(latitude, longitude); // 지도에서 가운데로 위치할 위도와 경도 
        var markLocation = new google.maps.LatLng(latitude, longitude); // 마커가 위치할 위도와 경도         

        var mapOptions = {
          center: mapLocation, // 지도에서 가운데로 위치할 위도와 경도(변수)
          zoom: 18, // 지도 zoom단계
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        var map = new google.maps.Map(document.getElementById("map-canvas"), // id: map-canvas, body에 있는 div태그의 id와 같아야 함
            mapOptions);
        var size_x = 60; // 마커로 사용할 이미지의 가로 크기
        var size_y = 60; // 마커로 사용할 이미지의 세로 크기         

        // 마커로 사용할 이미지 주소
        var image = new google.maps.MarkerImage( 'http://www.larva.re.kr/home/img/boximage3.png',
                            new google.maps.Size(size_x, size_y),
                            '',
                            '',
                            new google.maps.Size(size_x, size_y));
        var marker = "";
        marker = new google.maps.Marker({ 
               position: markLocation, // 마커가 위치할 위도와 경도(변수)
               map: map,
               icon: image, // 마커로 사용할 이미지(변수)
            info: '바로 여기~!'
        });
      }

      google.maps.event.addDomListener(window, 'load', initialize);
</script>
</html>