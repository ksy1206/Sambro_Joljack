package cmd.controller;


import java.io.IOException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.apache.commons.collections.bag.SynchronizedSortedBag;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cmd.service.CmdService;
import cmd.vo.CmdVO;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

@Controller("WebSocketController")
@RequestMapping("/wsk")
@ServerEndpoint(
		value="/wsk/{channel_id}"
		)
public class WebSocket {
	 private static final java.util.Set<Session> sessions = java.util.Collections.synchronizedSet(new java.util.HashSet<Session>());
	 private static final Map<String,String> sMap = java.util.Collections.synchronizedMap(new HashMap<String,String>());


    @Resource(name = "cmdService")
	private CmdService cmdService;
    private volatile String channel_id; 
    

   
	//대기중 화면
		@RequestMapping(value="/wait_socket.do")
		public String wait_socket(HttpServletRequest req, HttpServletResponse res,
	 			@RequestParam Map<String, Object> pMap) throws Exception {

			
//			this.cmdService.insert_channel(pMap);
			
			return "main/wait";

		}
		
		//차량 대기중 화면
		@RequestMapping(value="/wait_socket_car.do")
		public String wait_socket_car(HttpServletRequest req, HttpServletResponse res,
	 			@RequestParam Map<String, Object> pMap) throws Exception {
			String member_no = req.getParameter("member_no");
			
			HttpSession session = req.getSession(true);
			session.setAttribute("member_no_car", member_no);
			session.setAttribute("hp_no_car",req.getParameter("hp"));
			return "main/wait_carUser";

		}
		

    /**
     * @OnOpen allows us to intercept the creation of a new session.
     * The session class allows us to send data to the user.
     * In the method onOpen, we'll let the user know that the handshake was 
     * successful.
     */
    @OnOpen
    public void onOpen(Session session, @PathParam("channel_id") String channel_id){
    	
    	this.channel_id = channel_id;
    	System.out.println("Open channel_id : " + channel_id);
        System.out.println("Open session id : " + session.getId());
  
        try {
            final Basic basic = session.getBasicRemote();
            basic.sendText("Connection Established");
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
          sessions.add(session);
//        sMap.put(session.getId(),channel_id);
        
        sMap.put(session.getId(),channel_id);
    }
    
    /**
     * 모든 사용자에게 메시지를 전달한다.
     * @param self
     * @param message
     */
    private void sendAllSessionToMessage(Session self, String message){
        try {
        	System.out.println("맵의크기-->"+sMap.size());
//        	/*
        	Iterator<String> it = sMap.keySet().iterator();

        	String [] c_val = new String[sessions.size()];
        	String [] s_val = new String[sessions.size()];
        	
        	int i = 0;
        	while (it.hasNext()) {
        	
        		
        		String session_str = (String) it.next();
         		
				c_val[i] = sMap.get(session_str).toString();
				
				if(c_val[i].equals(channel_id)){
					s_val[i] = session_str;
				}else{
					s_val[i] = "null";
				}
//				System.out.println("s_val["+i+"]"+s_val[i]);
//				System.out.println("==================================");
				i++;
        	}
        	
        	
        	  for( Session session : WebSocket.sessions ){
        		  
                  if( ! self.getId().equals(session.getId())){
                	 for (int j = 0; j < s_val.length; j++) {
//                		 System.out.println("s_val["+j+"]--->"+s_val[j]);
//                		 System.out.println("self.getId()--->"+self.getId());
//                		 System.out.println("session.getId()--->"+session.getId());
//                		 System.out.println("===================================");
                		 
                		 if(session.getId().equals(s_val[j])){
//                			  System.out.println(j+"번째 in");
//                			  System.out.println("++++++++++++++++++++++++++++++++++");
                			  session.getBasicRemote().sendText(message);
                    		  
                    	  }
					}
                	
                  }
                 
              }
//           */
//        	 for( Session session : WebSocket.sessions ){
//                 if( ! self.getId().equals(session.getId()) &&  ! self.getId().equals("1")){
//                     session.getBasicRemote().sendText("All : " + message);
//                 }
//        	 }
        	 
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    /**
     * 유저가 메세지를 보낼때 이 메서드가 메세지를 인터셉트 한다.
     */
    @OnMessage
    public void onMessage(String message, Session session){
    	
        System.out.println("Message from " + session.getId() + ": " + message);

        try {
     
        	final Basic basic = session.getBasicRemote();
            basic.sendText(message);
        } catch (IOException ex) {
            ex.printStackTrace();
        }
       
        sendAllSessionToMessage(session, message);
    }
    
    @OnError
    public void onError( Throwable e, Session session){
        
    }
    
    /**
     * 
     */
    @OnClose
    public void onClose(Session session){
        System.out.println("Session " +session.getId()+" has ended");
        sMap.remove(session.getId());
        sessions.remove(session);
        
    }
    
    
}



