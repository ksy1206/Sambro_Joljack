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
		
	});//end document
	
	//메뉴 이동 함수
	function move_memu(data){
		if(data == '01'){
			location.href="<%=cp%>/cmdQR/main.do";
		} else if (data == '02'){
			location.href="<%=cp%>/noticeQR/main.do";
		} else if (data == '03'){
			$("#popupCheck").popup("open");			
		} else if (data == '04'){
			location.href="<%=cp%>/cmdQR/bus.do";
		}
	}
	
	//팝업 확인 버튼 눌렀을경우 이동하는 함수
	function popupConfirm(){
		location.href="<%=cp%>/cmdQR/logOut.do";
	}
	
	function popupClose(){
		$("#popupCheck").popup("close");
	}
	
	

</script>
</head>

<body>
<div data-role="page" style="background-color: #fff;">
	<div data-role="header" style="background-color: #0054FF; color: #ffffff;">
		<p style="font-size:24px; margin-top: 1em; margin-bottom: 1em; margin-left: 1em;">
			${sessionScope.sessionData.memberInfo.getMember_name()}님 안녕하세요~!
		</p>
	</div>
	
	<div data-role="content">
		<div style="width: 100%;" align="center">
			<img src="../img/timetable_default.jpg" style="width:15%;" onclick="move_memu('01')">&nbsp;
			<img src="../img/notice_default.jpg" style="width:15%;" onclick="move_memu('02')">&nbsp;&nbsp;&nbsp;
			<img src="../img/default_sc.jpg" style="width:15%;">&nbsp;&nbsp;&nbsp;
			<img src="../img/bus.png" style="width:15%;">&nbsp;&nbsp;&nbsp;
			<img src="../img/logOut_default.jpg" style="width:15%;" onclick="move_memu('03')">
		</div>
		
		<div style="width: 100%; margin-top: 1em;" align="center">
			<img src="../img/bus_time.png" style="width: 95%;">
		</div>

  </div>
  
  	<!-- 팝업 -->
	<div id="popupCheck" style="max-width: 400px;" data-role="popup" data-dismissible="false" class="board_footer_popup">
	    <div class="ui-content" role="main">
	    	<img src="../img/logOut_popup.jpg">
			<p id="">로그아웃 하시겠습니까?</p>
			<div id="" class="ui-grid-a" align="center">
				<div class="ui-block-a">
					<input class="btn btn-default" type="button" value="취소" onclick="popupClose()">
				</div>
				<div class="ui-block-b">
					<input class="btn btn-info" type="button" value="확인" onclick="popupConfirm()">
				</div>
			</div>
	  	</div>    
	 </div>

</div>

	
</body>
</html>