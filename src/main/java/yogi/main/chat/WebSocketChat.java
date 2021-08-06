package yogi.main.chat;

import java.util.ArrayList;
import java.util.List;
 
import javax.websocket.server.ServerEndpoint;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
 
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
 
import javax.websocket.RemoteEndpoint.Basic;
 
@Controller
//@ServerEndpoint(value="/echo") 는 /echo 라는 url 요청을 통해 웹소켓에 들어가겠다라는 어노테이션입니다.
@ServerEndpoint(value="/echoecho")
public class WebSocketChat {
    
    private static final List<Session> sessionList=new ArrayList<Session>();;
    private static final Logger logger = LoggerFactory.getLogger(WebSocketChat.class);
    public WebSocketChat() {
        // TODO Auto-generated constructor stub
        System.out.println("웹소켓(서버) 객체생성");
    }
    @RequestMapping(value="/chatchat")
    public ModelAndView getChatViewPage(ModelAndView mav) {
        mav.setViewName("main/chat2");
        return mav;
    }
	//웹 소켓이 연결되면 호출되는 이벤트
  	//@onOpen 는 클라이언트가 웹소켓에 들어오고 서버에 아무런 문제 없이 들어왔을때 실행하는 메소드입니다.
    @OnOpen
    public void onOpen(Session session) {
        logger.info("Open session id:"+session.getId());
        try {
            final Basic basic=session.getBasicRemote();
            basic.sendText("Connection Established");
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        sessionList.add(session);
    }
    
	//모든 사용자에게 메시지를 전달한다.
	//sendAllSessionToMessage()는 어떤 누군가에게 메시지가 왔다면 그 메시지를 보낸 자신을 제외한 연결된 세션(클라이언트)에게 메시지를 보내는 메소드.
    private void sendAllSessionToMessage(Session self,String message) {
        try {
            for(Session session : WebSocketChat.sessionList) {
                if(!self.getId().equals(session.getId())) {
                    session.getBasicRemote().sendText(message);
                }
            }
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
    }
    
	//웹 소켓으로부터 메시지가 오면 호출되는 이벤트
	//@onMessage 는 클라이언트에게 메시지가 들어왔을 때, 실행되는 메소드입니다.
    @OnMessage
    public void onMessage(String message,Session session) {
        logger.info("Message From "+message.split(":")[0] + ": "+message.split(":")[1]);
        try {
            final Basic basic=session.getBasicRemote();
            basic.sendText("나 : "+ message.split(":")[1]);
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        sendAllSessionToMessage(session, message);
    }
    
	//웹 소켓이 에러가 나면 호출되는 이벤트
    @OnError
    public void onError(Throwable e,Session session) {
        
    }
    
	//웹 소켓이 닫히면 호출되는 이벤트
	//@onClose 는 클라이언트와 웹소켓과의 연결이 끊기면 실행되는 메소드입니다.
    @OnClose
    public void onClose(Session session) {
        logger.info("Session "+session.getId()+" has ended");
        sessionList.remove(session);
    }
}