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
	
	//시간표 클릭시 이동하는 함수
	function move_class(class_code){
		if(class_code == '01'){
			location.href="<%=cp%>/cmdQR/attend.do?class_code="+class_code+"&member_no=<%=member_no%>";
		} else if (class_code == '02'){
			location.href="<%=cp%>/cmdQR/attend.do?class_code="+class_code+"&member_no=<%=member_no%>";
		} else if (class_code == '03'){
			location.href="<%=cp%>/cmdQR/attend.do?class_code="+class_code+"&member_no=<%=member_no%>";
		} else if (class_code == '04'){
			location.href="<%=cp%>/cmdQR/attend.do?class_code="+class_code+"&member_no=<%=member_no%>";
		} else if (class_code == '05'){
			location.href="<%=cp%>/cmdQR/attend.do?class_code="+class_code+"&member_no=<%=member_no%>";
		} else if (class_code == '06'){
			location.href="<%=cp%>/cmdQR/attend.do?class_code="+class_code+"&member_no=<%=member_no%>";
		}
	}
	
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
			<img src="../img/timetable.jpg" style="width:15%;" onclick="move_memu('01')">&nbsp;
			<img src="../img/notice_default.jpg" style="width:15%;" onclick="move_memu('02')">&nbsp;&nbsp;&nbsp;
			<img src="../img/default_sc.jpg" style="width:15%;">&nbsp;&nbsp;&nbsp;
			<img src="../img/default_bus.jpg" style="width:15%;" onclick="move_memu('04')">&nbsp;&nbsp;&nbsp;
			<img src="../img/logOut_default.jpg" style="width:15%;" onclick="move_memu('03')">
		</div>
		
		<table border="1" width="100%" height="70%" style=" text-align: center; table-layout: fixed; background-color: #EAEAEA; margin-top: 1em; font-size: 20px;">
		    <tr style="background-color: #5586EB; color: #fff;">
		    	<td style="width: 100px;;"></td>
		    	<td>월</td>
		    	<td>화</td>
		    	<td>수</td>
		    	<td>목</td>
		    	<td>금</td>
		    </tr>
		    <tr style="color: #fff;">    
		    	<td style="width: 50px; background-color: #FFBB00; color: #fff; table-layout: fixed;">09:00 ~ 10:00</td>
		    	<td></td>
		    	<td></td>
		    	<td rowspan="3" onclick="move_class('01')" style="background-color: #3DB7CC;">네트워크<br> 508</td>
		    	<td rowspan="3" onclick="move_class('02')" style="background-color: #3DB7CC;">기업탐구<br> 508</td>
		    	<td rowspan="3" id="25" onclick="move_class('03')" style="background-color: #3DB7CC;">Web<br> 308</td>
		    </tr>
		    <tr>
		    	<td style="width: 50px; background-color: #FFBB00; color: #fff; table-layout: fixed;">10:00 ~ 11:00</td>
		    	<td id="9"></td>
		    	<td id="10"></td>
		    </tr>
		    <tr>
		    	<td style="width: 50px; background-color: #FFBB00; color: #fff;">11:00 ~ 12:00</td>
		    	<td id="15"></td>
		    	<td id="16"></td>
		    </tr>
		    <tr>
		    	<td style="width: 50px; background-color: #FFBB00; color: #fff;">12:00 ~ 13:00</td>
		    	<td id="19"></td>
		    	<td id="20"></td>
		    	<td id="21"></td>
		    	<td id="22"></td>
		    	<td id="23"></td>
		    </tr>
		    <tr style="color: #fff;">
		    	<td style="width: 50px; background-color: #FFBB00; color: #fff;">13:00 ~ 14:00</td>
		    	<td></td>
		    	<td></td>
		    	<td rowspan="3" id="26" onclick="move_class('04')" style="background-color: #3DB7CC;">응용<br> 201</td>
		    	<td rowspan="3" id="28" onclick="move_class('05')" style="background-color: #3DB7CC;">프로젝트<br> 310</td>
		    	<td rowspan="3" id="29" onclick="move_class('06')" style="background-color: #3DB7CC;">App<br> 201</td>
		    </tr>
		    <tr>
		    	<td style="width: 50px; background-color: #FFBB00; color: #fff;">14:00 ~ 15:00</td>
		    	<td></td>
		    	<td></td>
		    </tr>
		    <tr>
		    	<td style="width: 50px; background-color: #FFBB00; color: #fff;">15:00 ~ 16:00</td>
		    	<td id="37"></td>
		    	<td></td>
		    </tr>
		</table>
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