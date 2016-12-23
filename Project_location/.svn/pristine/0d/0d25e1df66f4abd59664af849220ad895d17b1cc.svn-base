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
<!-- <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script> -->
<!-- 세션 없으면 메인페이지로 강제 이동 -->
<c:if test="${sessionScope.sessionData.memberInfo.getMember_no() == null || sessionScope.sessionData.memberInfo.getMember_no() ==''}">
	<script>
		location.href="${pageContext.request.contextPath}/member/login.do";
	</script>
</c:if>
<script type="text/javascript">
$(document).ready(function(){
	
	
	$("#pageMove_list").click(function(){
		var member_no = $("#member_no").val();
		var latitude = $("#latitude").val();
		var longitude = $("#longitude").val();
		location.href="<%=cp%>/main/move_list.do?latitude="+latitude+"&longitude="+longitude+"&member_no="+member_no;
	});
	
	$("#pageMove_main").click(function(){
		location.href="<%=cp%>/main/main.do"
	});
	
	$("#move_adminLogin").click(function(){
		location.href="<%=cp%>/main/admin_login.do"
	});
	
	$("#pageMove_dangerArea").click(function(){
		location.href="<%=cp%>/main/dangerArea.do"
	});
	
	window.myAndorid.locations();

	
});

//위치 위도,경도 저장
function receiveLocation(location) {
	
	var array_data = location.split("$");  // 위도 경도 문자열로 잘라 배열넣기
	
	//히든에 위도 경도 저장하기
	$("#latitude").val(array_data[0]);
	$("#longitude").val(array_data[1]);
	
	initialize();
	
}

</script>

</head>
<body>
	<div data-role="page">		
		
		<input type="hidden" value="${sessionScope.sessionData.memberInfo.getMember_no()}" id="member_no" name="member_no">
		<input type="hidden" value="37.6063242" id="latitude">
		<input type="hidden" value="127.0925842" id="longitude">
		
		<div data-role="hearder" data-position="fixed" style="text-align: center; background-color: #21B4D6;">
			<p style="font-size: 3em !important; color: #fff;">My Precious</p>
		</div>
		
		<div data-role="content" align="center">
			<input type="button" value="내 위치" class="btn btn-info" id="pageMove_main" style="margin-bottom: 1em;">
			<input type="button" value="리스트" class="btn btn-info" id="pageMove_list" style="margin-bottom: 1em; right: 0em !important;">
			<input type="button" value="위험지역" class="btn btn-info" id="pageMove_dangerArea" style="margin-bottom: 1em; right: 0em !important;">
			<div id="map-canvas" style="width: 100%; height: 250px;"></div>
		</div>		
		
		<div data-role="footer" data-position="fixed" style="text-align: center; background-color: #21B4D6;" id="move_adminLogin">
			<p style="margin-top: 10px; color: #fff;">어플 관리</p>
		</div>
				
	</div>
</body>

<script type="text/javascript">
      function initialize() {
		var latitude = $("#latitude").val();
		var longitude = $("#longitude").val();
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
            info: '바로 여기~!',
//             title: '' // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
        });        

//         var content = ""; // 말풍선 안에 들어갈 내용         

        // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
//         var infowindow = new google.maps.InfoWindow({ content: content});
//         google.maps.event.addListener(marker, "click", function() {
//             infowindow.open(map,marker);
//         });
      }

      google.maps.event.addDomListener(window, 'load', initialize);
</script>
</html>