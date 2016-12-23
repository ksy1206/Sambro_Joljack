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

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Tomcat7의 webSocket 테스트<P>
 * 이 모듈을 사용할 경우 Singleton으로 동작하지 않는다. sessions가 각 호출 시 마다 생성되므로 static으로 정해 줘야 한다.<br>
 * 브라우져가 websocket을 지원 해야 한다.<br>
 * 웹 소켓 연결 후 별도 close 동작 없이 브라우져를 닫을 경우 자동으로 OnClose가 호출 된다.
 * @author KimSH
 * @see https://blog.idrsolutions.com/2013/12/websockets-an-introduction/
 */
@Controller("TestWebSocketController")
@ServerEndpoint(
		value="/echo/{clientId}"
				
		)
public class TestWebSocket {

    private static final java.util.Set<Session> sessions = java.util.Collections.synchronizedSet(new java.util.HashSet<Session>());
    private volatile String clientId; 
    /**
     * 웹 소켓 테스트 화면
     * @return
     */
    @RequestMapping("webSocket.do")
    public String testView(){
        return "main/test";
    }

    /**
     * @OnOpen allows us to intercept the creation of a new session.
     * The session class allows us to send data to the user.
     * In the method onOpen, we'll let the user know that the handshake was 
     * successful.
     */
    @OnOpen
    public void onOpen(Session session, @PathParam("clientId") String clientId){
    	this.clientId = clientId;
        System.out.println("Open session id : " + session.getId());
        System.out.println("Open clientId id : " + clientId);
        try {
            final Basic basic = session.getBasicRemote();
            basic.sendText("Connection Established");
            
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
        
        sessions.add(session);
    }
    
    /**
     * 모든 사용자에게 메시지를 전달한다.
     * @param self
     * @param message
     */
    private void sendAllSessionToMessage(Session self, String message){
        try {
            for( Session session : TestWebSocket.sessions ){
                if( ! self.getId().equals(session.getId()) &&  ! session.getId().equals("1") &&  ! self.getId().equals("1")){
                    session.getBasicRemote().sendText("All : " + message);
                }
                
              
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    /**
     * When a user sends a message to the server, this method will intercept the message
     * and allow us to react to it. For now the message is read as a String.
     */
    @OnMessage
    public void onMessage(String message, Session session){
        System.out.println("Message from " + session.getId() + ": " + message);
        System.out.println("Open clientId id!! : " + clientId);
        try {
            final Basic basic = session.getBasicRemote();
            	  basic.sendText("to : " + message);
     
            
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        
        sendAllSessionToMessage( session, message );
    }
    
    @OnError
    public void onError( Throwable e, Session session){
        
    }
    
    /**
     * The user closes the connection.
     * 
     * Note: you can't send messages to the client from this method
     */
    @OnClose
    public void onClose(Session session){
        System.out.println("Session " +session.getId()+" has ended");
        sessions.remove(session);
    }
    
    
}



