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
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<!-- 세션 없으면 메인페이지로 강제 이동 -->
<c:if test="${sessionScope.sessionData.memberInfo.getMember_no() == null || sessionScope.sessionData.memberInfo.getMember_no() ==''}">
	<script>
		location.href="${pageContext.request.contextPath}/member/login.do";
	</script>
</c:if>
<script type="text/javascript">
$(document).ready(function(){

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
	
	$("#search").click(function(){
		var search_c_name = $("#search_c_name").val();
		var member_no=$("#member_no").val();
		location.href="<%=cp%>/main/modify_companyMove.do?search_c_name="+search_c_name+"&member_no="+member_no;
	});	

});


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

function change_address(){
	var c_address = $("#c_address").val();
	getLocation();
}


function c_modify(c_no){
	var params = "c_no="+c_no;
	$.ajax({
	        type        : "POST"  
	      , async       : false 
	      , url         : "/main/c_noInformation.do"
	      , data        : params
	      , dataType    : "json" 
	      , timeout     : 30000
	      , cache       : false     
	      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
	      , error       : function(request, status, error) {
				alert("작업 도중 오류가 발생하였습니다. 자세한 사항은 고객센터에 문의하십시오.");       
	      }
	      , success     : function(data) {
	    	  var html = "";
	    	  
	    	  html += "<form role='form' method='post' id='modifyCompany_form' name='modifyCompany_form' style='margin-top: 1em;'>";
	    	  html += "<input type='hidden' value='${sessionScope.sessionData.memberInfo.getMember_no()}' name='member_no'>";
	    	  html += 	"<input type='hidden' value='"+data.companyVo.c_no+"' id='c_no' name='c_no'>";
			  html += 	"<div class='form-group'>";
			  html += 		"<label for='c_name'>업체명</label>";
			  html += 		"<input type='text' value='"+data.companyVo.c_name+"' class='form-control' id='c_name' name='c_name'>";
			  html += 	"</div>";
			  
			  html +=	"<div class='form-group'>";
			  html +=		"<label for='c_type'>종류</label>";
			  html +=		"<select id='c_type' name='c_type'>";
			  if(data.companyVo.c_type == '맛집'){
				  html +=		"<option value='맛집' selected='selected'>맛집</option>";
				  html +=		"<option value='화장실'>화장실</option>";
				  html +=		"<option value='옷가게'>옷가게</option>";
				  html +=		"<option value='로드샵'>로드샵</option>";
				  html +=		"<option value='기타'>기타</option>";
			  } else if (data.companyVo.c_type == '화장실'){
				  html +=		"<option value='맛집'>맛집</option>";
				  html +=		"<option value='화장실' selected='selected'>화장실</option>";
				  html +=		"<option value='옷가게'>옷가게</option>";
				  html +=		"<option value='로드샵'>로드샵</option>";
				  html +=		"<option value='기타'>기타</option>";
			  } else if (data.companyVo.c_type == '옷가게'){
				  html +=		"<option value='맛집'>맛집</option>";
				  html +=		"<option value='화장실'>화장실</option>";
				  html +=		"<option value='옷가게' selected='selected'>옷가게</option>";
				  html +=		"<option value='로드샵'>로드샵</option>";
				  html +=		"<option value='기타'>기타</option>";
			  } else if (data.companyVo.c_type == '로드샵'){
				  html +=		"<option value='맛집'>맛집</option>";
				  html +=		"<option value='화장실'>화장실</option>";
				  html +=		"<option value='옷가게'>옷가게</option>";
				  html +=		"<option value='로드샵' selected='selected'>로드샵</option>";
				  html +=		"<option value='기타'>기타</option>";
			  } else if (data.companyVo.c_type == '기타'){
				  html +=		"<option value='맛집'>맛집</option>";
				  html +=		"<option value='화장실'>화장실</option>";
				  html +=		"<option value='옷가게'>옷가게</option>";
				  html +=		"<option value='로드샵'>로드샵</option>";
				  html +=		"<option value='기타' selected='selected'>기타</option>";
			  }			  
			  html +=		"</select>";
			  html +=	"</div>";
			  
			  html +=	"<div class='form-group'>";
			  html +=		"<label for='c_address'>주소</label>";
			  html +=		"<input type='text' value='"+data.companyVo.c_address+"' class='form-control' id='c_address' name='c_address'  onchange='change_address()'>";
			  html +=	"</div>";
			  
			  html +=	"<div class='ui-grid-a'>";
			  html +=		"<div class='ui-block-a'>";
			  html +=			"<input type='text' value='"+data.companyVo.c_latitude+"' id='latitude' name='c_latitude' readonly='readonly'>";
			  html +=		"</div>";
			  html +=		"<div class='ui-block-b'>";
			  html +=			"<input type='text' value='"+data.companyVo.c_longitude+"' name='c_longitude' readonly='readonly'>";
			  html +=		"</div>";
			  html +=	"</div>";
			  
			  html +=	"<div class='form-group'>";
			  html +=		"<label for='c_phone'>연락처</label>";
			  html +=		"<input type='number' value='"+data.companyVo.c_phone+"' class='form-control' id='c_phone' name='c_phone'>";
			  html +=	"</div>";
			  
			  html +=	"<div class='form-group'>";
			  html +=		"<label for='c_content'>상세 정보</label>";
			  html +=		"<textarea class='form-control' rows='10' id='c_content' style='resize:none;' name='c_content'>"+data.companyVo.c_content+"</textarea>";
			  html +=	"</div>";
			  html +=		"<input type='button' value='수정완료' onclick='confirm()' class='btn btn-default' style='position: absolute; right : 1em; margin-bottom: 1em;'>";
			  html +=  "</form>";
	    	  
	    	  $("#div_content").html(html).trigger("create");		    	  
	      }
    	});
}

function confirm(){
    document.modifyCompany_form.action = '<%=cp%>/main/modifyCompany_form.do';
    document.modifyCompany_form.submit();
 }

</script>
</head>
<body>
	<div data-role="page">	
		<input type="hidden" value="${sessionScope.sessionData.memberInfo.getMember_no()}" id="member_no">
		<div data-role="hearder" data-position="fixed">
			<h1 style="font-size: 1.8em; margin-left: 1em;">
				업체 관리
				<img src="../img/home.png" id="go_home" style="width: 1.2em; vertical-align: top; position: absolute; right: 1em;">
			</h1>
		</div>
		
		<div data-role="content">
			<div class="btn-group btn-group-justified">
			   <a href="#" id="add_company" class="btn btn-primary" style="background-color: #fff !important;">업체 등록</a>
			   <a href="#" id="modify_company" class="btn btn-primary" style="background-color: #C4DEFF !important;">업체 수정</a>
			   <a href="#" id="delete_company" class="btn btn-primary" style="background-color: #fff !important;">업체 삭제</a>
			</div>
			
			<div style="margin-top: 1em;">
				<div class="ui-grid-a" style="margin-bottom: 1em;">
					<div class="ui-block-a" style="width: 70%">
						<c:if test="${search_c_name == null || search_c_name == '' || search_c_name == 'undefined'}">
							<input type="text" id="search_c_name" placeholder="검색할 업체명을 입력하세요." style="width: 100%">
						</c:if>
						<c:if test="${search_c_name != null && search_c_name != '' && search_c_name != 'undefined'}">
							<input type="text" id="search_c_name" value="${search_c_name}" placeholder="검색할 업체명을 입력하세요." style="width: 100%">
						</c:if>						
					</div>
					<div class="ui-block-b" style="width: 30%;">
						<input type="button" value="검색" id="search" class="btn btn-info" style="margin-top: 0.5em; margin-left: 2.5em;">
					</div>
				</div>
			
				<div id="div_content">
					<c:forEach var="data" items="${companyList}">
						<div style="border:solid 2px #487BE1; padding:.3em; position:relative; margin-bottom:.5em;">
							<p>업 체 명 : ${data.c_name}</p>
							<p>주    소 : ${data.c_address}</p>
							<p>연 락 처 : ${data.c_phone}</p>
							<input type="button" value="수정" onclick="c_modify('${data.c_no}')" class="btn btn-warning" style="position: absolute; right: 1em;  top: 1em;">						
						</div>
					</c:forEach>
				</div>
			</div>	

		</div>				
	</div>
</body>
</html>