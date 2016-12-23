<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.util.Map" %>
<%@page import="cmd.vo.CmdVO"%>

<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	Map sessionData = null;
	  
    boolean isSession = true;
    CmdVO vo = null;
    String member_id="";
    String member_no = "";
    if (session.getAttribute("sessionData") != null) {
    	
    	 sessionData = (Map)session.getAttribute("sessionData");
		 member_id = sessionData.get("member_id").toString();	
		 member_no = sessionData.get("member_no").toString();
       
    } else {
        isSession = false;
        session.removeAttribute("sessionData");
    }

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

    <script type="text/javascript">
   
    $(document).ready(function(){
    	
    	$('#openSocket').click();
    	
			
    });
	
	
    	var webSocket;
      
        var messages = $("#messages").val();
      
        function openSocket() {
          
            if (webSocket !== undefined && webSocket.readyState !== WebSocket.CLOSED) {
                writeResponse("소켓이 이미 오픈되어있습니다.");
                return;
            }
            
            
            webSocket = new WebSocket ('ws://192.168.0.19:8080/wsk/<%=member_no%>');
			
           
            webSocket.onopen = function(event) {
                // For reasons I can't determine, onopen gets called twice
                // and the first time event.data is undefined.
                // Leave a comment if you know the answer.
                if (event.data === undefined)
                    return;
				
                writeResponse(event.data);
            };

            webSocket.onmessage = function(event) {
            	
                writeResponse(event.data);
            };

            webSocket.onclose = function(event) {
                writeResponse("Connection closed");
            };
        }

       
        function send(text) {
            webSocket.send(text);
        }

        function closeSocket() {
            webSocket.close();
        }

        function writeResponse(text) {
      
        	if(text == "matching"){
        		$('#check_popup').click();
        		Tcounter(60);
        	}
        	
//          var messages = $("#messages").html(); 
//        	 $("#messages").html(messages+"<br/>" + text);
        }
        
        
function matching_ok(){
	$('#chk_mat').val("Y");
	send("matching_ok");
	Tcounter2(600);
}

    </script>
    
<body>
<div data-role="page" id="pageone">
	<div data-role="header">
	    <div data-role="navbar">
	      <ul>
	        <li><a href="#">카풀 어플</a></li>
	      
	        
	      </ul>
	    </div>
	  </div>
  <div data-role="main" class="ui-content">
    
    
      <div style="text-align: center;">
   		<h1>대기중..</h1>
      </div>
       <div id="timeview2" style="text-align: center; display: none;"></div> 
      <button type="button" id="report" onclick="javascript:alert('신고가 접수되었습니다.');" style="display: none;">신고하기</button>
       <button type="button" id="openSocket" onclick="openSocket();" style="display: none;">Open</button>
        <button type="button" onclick="send();" style="display: none;">Send</button>
        <button type="button" onclick="closeSocket();" style="display: none;">Close</button>
        
  </div>
  
   
	<a href="#myPopupDialog" data-rel="popup" data-position-to="window" data-transition="fade" id="check_popup"></a>
	<div data-role="popup" id="myPopupDialog">
	      <div data-role="header">
	        	<h4>알림</h4>
	      </div>
	
	      <div data-role="main" class="ui-content">
	      	<div>도움을 받으시겠습니까?</div>
	        <div id="timeview" style="text-align: center;"></div> 
			<input type="hidden" id="chk_mat" value="N">  		
	  		<a href="#" class="ui-btn ui-corner-all  ui-btn-inline ui-btn-a"  onclick="matching_ok();" data-rel="back">확인</a>
	  		<a href="#" id="cs_btn" class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-b" data-rel="back">취소</a>
       	   
	      </div>
	
	      
 	</div>
 	
 	
 	<div data-role="footer" data-position="fixed">

	</div> 
</div>


    


</body>
<script language='javascript'>
function Display(min,sec) {
 var disp;
 if( min <= 9 ) disp=" 0";
 else disp=" ";

 if( min >= 60 ) {
  hour = parseInt( min / 60 );

  if( hour >=24 ) {
    day = parseInt( hour / 24 );
    disp += day + "일 :" + ( hour % 24 ) + "시간 :" + parseInt( min % 60 ) + "분 :";
  }
  else {
    disp +=  hour + "시간 :" + parseInt( min % 60 ) + "분 :";
  }
 }
 else {
  disp += min + "분 :";
 }

 if( sec <= 9 ) disp += "0" + sec + "초";
 else disp += sec + "초";

 return(disp);
}

 

function Tcounter(timegap) {
 csec1j = timegap % 60;
 cmin1j = ( timegap - csec1j ) / 60;
 TcounterZero();
}

function TcounterZero() {
 csec1j--;

 if(csec1j == -1) {
  csec1j = 59;
  cmin1j--;
 }
 
//  document.all.timeview.value = Display( cmin1j, csec1j );

 $("#timeview").html(csec1j+"초") ;
 
 if( ( cmin1j == 0 ) && ( csec1j == 0 ) ) {
	var chk_mat = $('#chk_mat').val();
	 if(chk_mat == "N"){
   		$("#cs_btn").click(); //남은 시간이 0 이 되었을때 처리부분
	 }else if(chk_mat == "Y"){ 
		 $("#report").css("display",""); //남은 시간이 0 이 되었을때 처리부분
	 }
//   location.href="http://www.naver.com"; //남은 시간이 0 이 되었을때 처리부분

 }
 else{
  Tcounter = setTimeout( "TcounterZero()", 1000 );
 }
}


function Tcounter2(timegap2) {
	 csec1j2 = timegap2 % 60;
	 cmin1j2 = ( timegap2 - csec1j2 ) / 60;
	 TcounterZero2();
	}

	function TcounterZero2() {
	 csec1j2--;

	 if(csec1j2 == -1) {
	  csec1j2 = 59;
	  cmin1j2--;
	 }
	 
	//  document.all.timeview.value = Display( cmin1j, csec1j );
	 $("#timeview2").html(csec1j2+"초") ;
	
	 
	 if( ( cmin1j2 == 0 ) && ( csec1j2 == 0 ) ) {
		var chk_mat = $('#chk_mat').val();
		 if(chk_mat == "N"){
	   		$("#cs_btn").click(); //남은 시간이 0 이 되었을때 처리부분
		 }else if(chk_mat == "Y"){ 
			 $("#report").css("display",""); //남은 시간이 0 이 되었을때 처리부분
		 }
	//   location.href="http://www.naver.com"; //남은 시간이 0 이 되었을때 처리부분

	 }
	 else{
	  Tcounter2 = setTimeout( "TcounterZero2()", 1000 );
	 }
	}


</script>

</html>