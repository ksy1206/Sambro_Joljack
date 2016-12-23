<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%  
	// 로그인 session check
	String cp = request.getContextPath();
	String member_no="";
	String member_id="";
	boolean isSession = true;
	
	if (session.getAttribute("member_no") != null) {
	   
		member_no = session.getAttribute("member_no").toString();
		member_id = session.getAttribute("member_id").toString();
	  
	} else {
	    isSession = false;
	    session.removeAttribute("sessionData");
	}
%>
<!DOCTYPE html>
<html>
<head>

<title>북마켓</title>
<meta charset="utf-8" />
<link href="<%=cp%>/css/bootstrap.min.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="<%=cp%>/js/bootstrap.js"></script>
<script type="text/javascript"  src="<%=cp%>/js/jquery.form.js"></script>
<link rel="stylesheet" href="../css/header.css">
<script type="text/javascript">
$(document).ready(function(){
	
	$('#category').change(function(){
		var category_no = $("#category").val();
		var params = "category_no="+category_no;
		
		$.ajax({
	        type        : "POST"  
	      , async       : false 
	      , url         : "<%=cp%>/cmd/get_category_sub.do"
	      , data        : params
	      , dataType    : "json" 
	      , timeout     : 30000   
	      , cache       : false     
	      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
	      , error       : function(request, status, error) {
	  	    alert("작업 도중 오류가 발생하였습니다.");
			
	      }
	      , success     : function(data) {
				var html = "<option value='0'>---선택---</option>";
                $.each(data.category_sub_list, function (index, category_sub_list) {
               	 	html+= "<option value='"+category_sub_list.category_sub_no+"'>"+category_sub_list.category_sub_name+"</option>";
                });
				
                $('#category_sub').html(html);
	    	   
	      }
		});
	});
	
	
	var member_no = "<%=member_no%>";
	
   if(member_no == null||member_no == ""||member_no == undefined){
	  
   		$('#login_li').css('display','');
   		$('#join_li').css('display','');
   		$('#logout_li').css('display','none');
   		$('#insert_modal_li').css('display','none');
   		$('#myroom_li').css('display','none');
   		$('#pocket_li').css('display','none');
   		$('#msg_li').css('display','none');
   		
   		
   }else{
	  
	    $('#login_li').css('display','none');
	    $('#join_li').css('display','none');
  		$('#logout_li').css('display','');
  		$('#insert_modal_li').css('display','');
  		$('#myroom_li').css('display','');
   		$('#pocket_li').css('display','');
   		$('#msg_li').css('display','');
   } 
   
   
   
 //---------------------------------------
// 폼 전송후 콜백함수 호출
//---------------------------------------	
var options = {
	dataType : "json",
    contentType : "application/x-www-form-urlencoded;charset=UTF-8",
	success : function(data){
		
			if(data.resultCode == '1') {
				
				$("#fileUploadPath").val(data.fileUploadPath);
				$("#fileNewName").val(data.fileName);
				$("#destination").val(data.destination);
				saveCompanyFile();
			 	
					
			}else{
				alert("첨부파일 등록에 실패하였습니다.");
			   
			}										
			
	},
	error : function(xhr, error, data) {
		alert("파일 업로드에 실패하였습니다.");
		
	}
}
	
$("#file_upload").ajaxForm(options);	


});//end document


function insert_modal(){
	$('#insert_modal_btn').click();
}

function chk_product(){
	var member_no = "<%=member_no%>";
	var product_name = $("#product_name").val();
	var product_maker = $("#product_maker").val();
	var product_company = $("#product_company").val();
	var product_price = $("#product_price").val();
	var category_no = $("#category").val();
	var category_sub_no = $("#category_sub").val();

	var file = $("#file").val();
	
	
	if(member_no == null||member_no == ""||member_no == undefined){
        alert( "회원만 이용가능합니다.");
         return false;
   } 
	if(product_name == null||product_name == ""||product_name == undefined){
        alert( "제품명을 입력하세요.");
         return false;
   } 
	if(product_maker == null||product_maker == ""||product_maker == undefined){
        alert( "제작자를 입력하세요.");
         return false;
   } 
	if(product_company == null||product_company == ""||product_company == undefined){
        alert( "제작사를 입력하세요.");
         return false;
   }
	if(product_price == null||product_price == ""||product_price == undefined){
        alert( "제품명을 입력하세요.");
         return false;
   } 
	if(category_no == null||category_no == ""||category_no == undefined){
        alert( "분류를 선택하세요.");
         return false;
   } 
	if(category_sub_no == null||category_sub_no == ""||category_sub_no == undefined){
        alert( "상세분류를 선택하세요.");
         return false;
   } 
	if(file == null||file == ""||file == undefined){
        alert( "이미지를 등록하세요.");
         return false;
   }else{
	   var frm = $('#file_upload'); 
	   frm.submit(); 	
   } 
}



	function saveCompanyFile(){
		
		
		var file_cnt = 0;
		var file_stat = "";
		var member_id = "<%=member_id%>";
		var file = $("#file").val();
		
		
		
		var fileName = $("#fileNewName").val();
		
	
		var params = "member_id=" + member_id;
		
       
		if(file != null && file != "" && file != undefined){
			file_cnt += 1;
			file_stat = ",1";
			var destination =  jQuery("#destination").val();
			params += "&fileNewName=" + jQuery("#fileNewName").val() + "&fileUploadPath=" + jQuery("#fileUploadPath").val() +
			"&destination=" + jQuery("#destination").val(); 
		}

		file_stat  = file_stat.substring(1, file_stat.length);
		params += "&file_cnt="+file_cnt+"&file_stat="+file_stat;
		
		$.ajax({
	            type        : "POST"  
	          , async       : true 
	          , url         : "/cmd/saveCompanyFile.do"
	          , data        : params
	          , dataType    : "json" 
	          , timeout     : 30000   
	          , cache       : false     
	          //, contentType : "application/x-www-form-urlencoded;charset=UTF-8"
	          , error       : function(request, status, error) {
	      	    alert("작업 도중 오류가 발생하였습니다. 자세한 사항은 고객센터에 문의하십시오.");
				
	          }
	          , success     : function(data) {


        		  $("#fileUploadPath").val(data.fileUploadPath);
				  $("#fileNewName").val(data.fileNewName);
				
		      		insert_product();
 
	          }
    	});
							
	}	
	
	
	
function insert_product(){
		
		var product_kind = $("#product_kind").val();
		var product_name = $("#product_name").val();
		var product_maker = $("#product_maker").val();
		var product_company = $("#product_company").val();
		var category_no = $("#category").val();
		var category_sub_no = $("#category_sub").val();
		var product_price = $("#product_price").val();
		var member_no = "<%=member_no%>";
		var file = $("#file").val();
		var fileName = $("#fileNewName").val();

		var params = "file_name=" + fileName + "&file_path=" + jQuery("#fileUploadPath").val()+ "&product_name=" + product_name+ "&product_maker=" + product_maker + "&product_price=" + product_price
		+ "&product_company=" + product_company+ "&category_no=" + category_no+ "&category_sub_no=" + category_sub_no+ "&member_no=" + member_no + "&product_kind=" + product_kind;

		
   	 	$.ajax({
	        type        : "POST"  
	      , async       : false 
	      , url         : "/cmd/insert_product.do"
	      , data        : params
	      , dataType    : "json" 
	      , timeout     : 30000   
	      , cache       : false     
	      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
	      , error       : function(request, status, error) {
				alert("작업 도중 오류가 발생하였습니다. 자세한 사항은 고객센터에 문의하십시오.");
				
	      }
	      , success     : function(data) {
	  		 	alert("등록완료");
	  		 	location.reload();
	      }
    	});	
	}	
	
	function go_myroom(check){
		var member_no = $("#session_member_no").val();
		if(check == "1"){
			if(member_no == null || member_no == ""){
				alert("로그인 후 이용해 주세요.");
			} else {
				location.href="<%=cp %>/myList/move_myroom.do?member_no="+member_no;
			}			
		} else if (check == "2"){
			if(member_no == null || member_no == ""){
				alert("로그인 후 이용해 주세요.");
			} else {
				location.href="<%=cp %>/myList/move_basket.do?member_no="+member_no;
			}	
		}
	}

</script>

</head>

<body>
	<div class="container">
	<input type="hidden" value="${sessionScope.sessionData.memberInfo.getMember_no()}" id="session_member_no">
		<div align="center">
				<strong onclick="location.href='<%=cp %>/cmd/main.do';">DACOMCOM</strong>
			<ul class="nav_bookmarket">
				<li id="login_li"><a href="<%=cp %>/member/move_login.do">login</a></li>
				<li id="join_li"><a href="<%=cp %>/member/move_join.do">join</a></li>
				<li id="logout_li"><a href="<%=cp %>/member/move_logout.do">logout</a></li>
				<li id="myroom_li"><a href="#" onclick="go_myroom('1')">myroom</a></li>
				<li id="pocket_li"><a href="#" onclick="go_myroom('2')">장바구니</a></li>
				<li id="insert_modal_li"><a href="#" onclick = "insert_modal();" >상품등록</a></li>
				<li id="msg_li"><a href="<%=cp%>/cmd/get_msg.do">쪽지함</a></li>
			</ul>
		</div>
		<br><br>
		<div align="center" class="menu_bookmarket">		
			<ul class="nav_bookmarket">

				<li><a href="<%=cp%>/cmd/get_book.do">대학교재</a></li>
				<li><a href="<%=cp%>/cmd/get_supply.do">학습용품</a></li>
				<li><a href="<%=cp %>/community/main.do">커뮤니티</a></li>

			</ul>
		</div>
	</div>
	
<button type="button" data-toggle="modal" data-target="#insert_modal" id="insert_modal_btn" style="display: none;"></button>	
	<!-- 모달부분 -->
<div id="insert_modal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" id="modal_title_h4">상품등록</h4>
      </div>
      <div class="modal-body" style="height: 100%; margin-bottom: 250px;">
     	 <div class="form-group">
		      <label class="col-sm-2 control-label">상품종류</label>
		      <div class="col-sm-10">
		      	<select class="form-control" name="product_kind" id="product_kind">
			    	<option value="1">대학교재</option>
			    	<option value="2">학습용품</option>
			    	
				</select>
		      </div>
		    </div>
		    <div class="form-group">
		      <label class="col-sm-2 control-label">상품명</label>
		      <div class="col-sm-10">
		        <input class="form-control" id="product_name" type="text" value="" > 
		      </div>
		    </div>
		     <div class="form-group" >
		      <label class="col-sm-2 control-label">저자</label>
		      <div class="col-sm-10">
		        <input class="form-control" id="product_maker" type="text" value="">
		      </div>
		    </div>
		   	<div class="form-group" >
		      <label class="col-sm-2 control-label">출판사</label>
		      <div class="col-sm-10">
		        <input class="form-control" id="product_company" type="text" value="">
		      </div>
		    </div>
		    <div class="form-group" >
		      <label class="col-sm-2 control-label">가격</label>
		      <div class="col-sm-10">
		        <input class="form-control" id="product_price" type="number" value="">
		      </div>
		    </div>
		     <div class="form-group">
		      <label class="col-sm-2 control-label">계열</label>
		      <div class="col-sm-10">
		      	<select class="form-control"  id="category">
			    	<option value="0">---선택---</option>
			    	<option value="1">경상계열</option>
					<option value="2">공학계열</option>
					<option value="3">농축산학계열</option>
					<option value="4">대학출판부</option>
					<option value="5">법학계열</option>
					<option value="6">사법대 계열</option>
					<option value="7">사회과학 계열</option>
					<option value="8">어문학 계열</option>
					<option value="9">예체능/문화/기타 계열</option>
					<option value="10">의약학/간호 계열</option>
					<option value="11">인문학 계열</option>
					<option value="12">자연과학 계열</option>
				</select>
		      </div>
		    </div>
		    <div class="form-group">
		      <label class="col-sm-2 control-label">계열상세</label>
		      <div class="col-sm-10">
		      	<select class="form-control" id="category_sub">
			    	<option value="0">---선택---</option>
			    
				</select>
		      </div>
		    </div>
		     <div class="form-group">
		      <label class="col-sm-2 control-label">이미지</label>
		      <div class="col-sm-10">
	      		<input type="hidden" id="fileUploadPath" name="fileUploadPath" value=""/>
				<input type="hidden" id="fileNewName" name="fileNewName" value="" />
				<input type="hidden" id="destination" name="destination" value="" />
    			<form id="file_upload" name="file_upload" method="post"  enctype="multipart/form-data" action="<%=cp%>/comm/saveFileUpload.do?fileGbn=file">
					<input class="form-control" id="file" name="file" type="file" value="" > 
				</form>
		        
		      </div>
		    </div>
		
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" data-dismiss="modal" onclick="chk_product();">등록</button>
        <button type="button" class="btn btn-warning" data-dismiss="modal">닫기</button>
      </div>
    </div>

  </div>
</div>
</body>
</html>