<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>


<script type="text/javascript">

$(document).ready(function(){
	list();
});

function start_compte_pas(){
	window.myAndorid.testd();
}

function callback(data){
	$("#compte_pas_data").val(data);
	
	setTimeout(function(){
		save_data('01');
	}, 200);
}

$(function() {
  $( "#datepicker1" ).datepicker({
    dateFormat: 'yy-mm-dd',
	closeText:'취소',
	showButtonPanel: true,
	onClose: function () {
		
	}
  });
});

$(function() {
  $( "#datepicker2" ).datepicker({
    dateFormat: 'yy-mm-dd',
	closeText:'취소',
	showButtonPanel: true,
	onClose: function () {
		
	}
  });
});

function close_popup(){	
	$('.ui-datepicker-close').click();
}

function openPopup_01(){
	$("#popupAdd01").popup("open");	
}

function popupClose_01(){
	$("#popupAdd01").popup("close");
}

function popupConfirm_01(){
	save_data('02');
}

function openPopup_02(){
	$("#popupAdd02").popup("open");	
}

function popupClose_02(){
	$("#popupAdd02").popup("close");
}

function openPopup_03(){
	getLanking();
	$("#popup03").popup("open");	
}

function popupClose_03(){
	$("#popup03").popup("close");
}

function popupConfirm_02(){
	save_data('03');
}

function list(){
	var member_no = $("#member_no").val();
	
	var params = "member_no="+member_no;
	
    $.ajax({
        type        : "POST" 
      , async       : true
      , url         : "/cmd/select_list.do"
      , data        : params
      , dataType    : "json"
      , timeout     : 30000  
      , cache       : false    
      //, contentType : "application/x-www-form- urlencoded;charset=UTF-8"
      , error       : function(request, status, error) {
         alert( "작업 도중 오류가 발생하였습니다. 자세한 사항은 고객센터에 문의하십시오." );    
      }
      , success     : function(data) {
    	  var html = "";
   	  
    	  $.each(data.list, function (index, list) {
    		  html += "<div style='border: 1px solid;'>";
    		  html += "<div align='left' style='margin-left: 0.5em;'>"
    		  html += list.insertDate;
    		  html += "</div>";
    		  html += "<div align='right' style='margin-right: 0.5em;'>"
    		  html += list.data;
    		  html += "</div>";
    		  html += "</div>";
    	  });
    	  
    	  $( "#list").html(html).trigger("create");    	      	  
      }
	});
}

function save_data(check){

	var member_no = $("#member_no").val();
	var data = "";
	var insertDate = "";
	var work = "";
	
	if(check == '01'){
		var dt = "";
		dt = new Date();
		dt = dt.getFullYear()+'-'+(("00"+(dt.getMonth()+1)).slice(-2))+'-'+("00"+dt.getDate()).slice(-2);
		data = $("#compte_pas_data").val();
		var data2 = data.split('걸음');
		work = data2[0];
		insertDate = dt;
	}
	if(check == '02'){
		data = $("#exercise").val();
		insertDate = $("#datepicker1").val();
	}
	if(check == '03'){
		data = $("#food").val();
		insertDate = $("#datepicker2").val();
	}
	
	var params = "member_no="+member_no+"&data="+data+"&insertDate="+insertDate+"&category="+check+"&work="+work;
	
    $.ajax({
        type        : "POST" 
      , async       : true
      , url         : "/cmd/save_data.do"
      , data        : params
      , dataType    : "json"
      , timeout     : 30000  
      , cache       : false    
      //, contentType : "application/x-www-form- urlencoded;charset=UTF-8"
      , error       : function(request, status, error) {
         alert( "작업 도중 오류가 발생하였습니다. 자세한 사항은 고객센터에 문의하십시오." );    
      }
      , success     : function(data) {
    	  alert("저장 완료");
    	  
    	  popupClose_01();
    	  popupClose_02();
    	  list();
      }
	});
}

function getLanking(){
	var dt = "";
	dt = new Date();
	dt = dt.getFullYear()+'-'+(("00"+(dt.getMonth()+1)).slice(-2))+'-'+("00"+dt.getDate()).slice(-2);
	var insertDate = dt;
	var params = "insertDate="+insertDate;
	
    $.ajax({
        type        : "POST" 
      , async       : true
      , url         : "/cmd/getLanking.do"
      , data        : params
      , dataType    : "json"
      , timeout     : 30000  
      , cache       : false    
      //, contentType : "application/x-www-form- urlencoded;charset=UTF-8"
      , error       : function(request, status, error) {
         alert( "작업 도중 오류가 발생하였습니다. 자세한 사항은 고객센터에 문의하십시오." );    
      }
      , success     : function(data) {    	  
    	  var html = "";
       	  
    	  $.each(data.list, function (index, list) {
    		  html += "<div align='center' class='ui-grid-a'  style='border: 1px solid;'>";
    		  html += "<div class='ui-block-a'>"
    		  html += "<p>"+list.member_name+"</p>";
    		  html += "</div>";
    		  html += "<div class='ui-block-b'>"
    		  html += "<p>"+list.work+"걸음</p>";
    		  html += "</div>";
    		  html += "</div>";
    	  });
    	  $( "#lanking_list").html(html).trigger("create");
      }
	});
}

</script>
</head>
<body>

<div data-role="page" style="background-color: #f40958;">

	<input type="hidden" value="${sessionScope.sessionData.memberInfo.getMember_no()}" id="member_no">
	<input type="hidden" value="133걸음-234kcl-34m" id="compte_pas_data">

	<div data-role="header" data-position="fixed" style="background-color: #3f51b5; color: #fff;">
		<h3>Vingle Village</h3>
	</div>
	
	<div data-role="content" class="main_content">
		<div id="list" align="center" style="margin-top: 1em; color: #fff"></div>
	</div>
	
	<div data-role="footer" class="ui-grid-c" data-position="fixed" align="center" style="border: 0; background-color: #f40958; color: #fff; margin-bottom: 1em;">
		<div class="ui-block-a"><input type="button" value="만 보 기" onclick="start_compte_pas()"></div>
		<div class="ui-block-b"><input type="button" value="운동 추가" onclick="openPopup_01()"></div>
		<div class="ui-block-c"><input type="button" value="식단 추가" onclick="openPopup_02()"></div>
		<div class="ui-block-d"><input type="button" value="랭 킹 " onclick="openPopup_03()"></div>	
	</div>
	
	<!--01 팝업 -->
	<div id="popupAdd01" data-overlay-theme="a" style="max-width: 400px; background-color: #dddfe2;" data-role="popup" data-dismissible="false">
	    <div role="main">			
	    	<div>
	    		<div align="center">
	    			<p style="font-size: 20px;">운동</p>
	    			<input type="text" id="datepicker1" readonly="readonly" placeholder="날짜입력">
	    		</div>
	    		
				<fieldset class="ui-field-contain">
					<select name="" id="exercise">
					<option value="계단 오르기-135kal">계단 오르기 - 135kal</option>
					<option value="골프-300kal">골프 - 300kal</option>
					<option value="권투-600kal">권투 - 600kal</option>
					<option value="댄스-450kal">댄스 - 450kal</option>
					<option value="마라톤-2700kal">마라톤 - 2700kal</option>
					<option value="맨손체조-210kal">맨손체조 - 210kal</option>
					<option value="배드민턴-123kal">배드민턴 - 123kal</option>
					<option value="산책-246kal">산책 - 246kal</option>
					<option value="수영-400kal">수영 - 400kal</option>
					<option value="스노우보드-487kal">스노우보드 - 487kal</option>
					<option value="스케이트-250kal">스케이트 - 250kal</option>
					<option value="스키-480kal">스키 - 480kal</option>
					<option value="에어로빅-360kal">에어로빅 - 360kal</option>
					<option value="인라인스케이트-570kal">인라인스케이트 - 570kal</option>
					<option value="자전거타기-480kal">자전거타기 - 480kal</option>
					<option value="조깅-588kal">조깅 - 588kal</option>
					<option value="줄넘기-142kal">줄넘기 - 142kal</option>
					<option value="축구-1250kal">축구 - 1250kal</option>
					<option value="카약-300kal">카약 - 300kal</option>
					<option value="탁구-147kal">탁구 - 147kal</option>
					<option value="테니스-186kal">테니스 - 186kal</option>
					</select>
				</fieldset>
	    	</div>
	    
			<div class="ui-grid-a">
				<div class="ui-block-a"><input type="button" value="취소" onclick="popupClose_01()"></div>
				<div class="ui-block-b"><input type="button" value="등록" onclick="popupConfirm_01()"></div>
			</div>
	  	</div>
	 </div>
	 
	<!--02 팝업 -->
	<div id="popupAdd02" data-overlay-theme="a" style="max-width: 400px; background-color: #dddfe2;" data-role="popup" data-dismissible="false">
	    <div role="main">			
	    	<div>
	    		<div align="center">
	    			<p style="font-size: 20px;">식단</p>
	    			<input type="text" id="datepicker2" readonly="readonly" placeholder="날짜입력">
	    		</div>
				<fieldset class="ui-field-contain">
					<select name="" id="food">
					<option value="감자-66kal">감자 - 66kal</option>
					<option value="고구마-128kal">고구마 - 128kal</option>
					<option value="과자-510kal">과자 - 510kal</option>
					<option value="규카츠-370kal">규카츠 - 370kal</option>
					<option value="돈까스-574kal">돈까스 - 574kal</option>
					<option value="돼지고기-236kal">돼지고기 - 236kal</option>
					<option value="떡볶이-1200kal">떡볶이 - 1200kal</option>
					<option value="라면-500kal">라면 - 500kal</option>
					<option value="볶음밥-500kal">볶음밥 - 500kal</option>
					<option value="빵-400kal">빵 - 400kal</option>
					<option value="삼계탕-677kal">삼계탕 - 677kal</option>
					<option value="소고기-500kal">소고기 - 500kal</option>
					<option value="아이스크림-300kal">아이스크림 - 300kal</option>
					<option value="우동-396kal">우동 - 396kal</option>
					<option value="음료수-250kal">음료수 - 250kal</option>
					<option value="찌개-300kal">찌개 - 300kal</option>
					<option value="초콜릿-560kal">초콜릿 - 560kal</option>
					<option value="치킨-1000kal">치킨 - 1000kal</option>
					<option value="카레-400kal">카레 - 400kal</option>
					<option value="커피-250kal">커피 - 250kal</option>
					<option value="햄버거-560kal">햄버거 - 560kal</option>
					</select>
				</fieldset>
	    	</div>
	    
			<div class="ui-grid-a">
				<div class="ui-block-a"><input type="button" value="취소" onclick="popupClose_02()"></div>
				<div class="ui-block-b"><input type="button" value="등록" onclick="popupConfirm_02()"></div>
			</div>
	  	</div>
	 </div>
	 
	<!--03 팝업 -->
	<div id="popup03" data-overlay-theme="a" style="max-width: 400px; background-color: #dddfe2;" data-role="popup" data-dismissible="false">
	    <div role="main">
	    	<h3 style="margin-right: 0.5em; margin-left: 0.5em;">오늘 걸음수 랭킹</h3>
	    	<div id="lanking_list"></div>
	  	</div>
	  	<input type="button" value="확 인" onclick="popupClose_03()">
	 </div>
	
</div>

</body>
</html>