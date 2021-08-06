package yogi.members;
import javax.servlet.http.HttpServletRequest;//클래스에서는 리퀘스트 객체 못가져다쓰니까 임포트
import javax.servlet.http.Cookie;//기본임포트인 쿠키도 임포트
import java.util.Map;
import java.net.URLEncoder; 
import java.net.URLDecoder; 
import java.io.IOException;
public class CookieBox {
	//map은 인터페이스이다 map을구현한 hashmap클래스를 통해서 map객체 생성
        private Map<String, Cookie> cookieMap 
    = new java.util.HashMap<String, Cookie>();
        //클라이언트가 가져온 쿠키를 저장할려고 맵생성한거임
        //맵객체생성//키값으로 스트링객체//값으로는 쿠키라는 객체저장
        //맵에다가 쿠키의 이름과 쿠키객체를 저장한다
    public CookieBox(HttpServletRequest request) {//생성자하나//리퀘스트 객체받아서 
        Cookie[] cookies = request.getCookies();//클라이언트가 가져온 쿠키 배열로 먼저 받음
        if (cookies != null) {//생성된 배열이 널이 아니면
            for (int i = 0 ; i < cookies.length ; i++) {
                cookieMap.put(cookies[i].getName(), cookies[i]);
                //배열에있는걸 꺼내서 이름으로 구분하고 맵에 넣는것 이런 시나리오 전체를 봐야함
                //배열은 쿠키객체가들어있고 이름은 모름
                //맵 컨테이너 에다가 쿠키의 이름과 쿠키객체를 저장한다
                //배열에 들어가있는 쿠키객체들을 굳이 맵으로 옮긴 이유는
                //간편하게 내가 키값만 줘서 꺼내쓸수있기때문에 맵을 쓴거다..!이게 핵심이야!
                //그런데 맵을쓰면 쿠키의 이름을 키로 주고 값에다가 객체를 주게된거
              }
        }
    }
  //클라이언트가 요청한 쿠키는 키값이 쿠키이름 값은 쿠키객체로 맵에 옮겨담아있는 상태인데
    public Cookie getCookie(String name) {//그냥 만들어 둔것
    	//여기서 쿠키 이름 받아서(key값) 쿠키객체(value값) 리턴
        return cookieMap.get(name);
        //이걸로 키값으로 name을 넣어줘서  쿠키객체를 뽑아내는것//배열을쓰면 이걸못한다!
    }
       public String getValue(String name) throws IOException {//이름 받아서 값을 리턴
        Cookie cookie = cookieMap.get(name);//일단 쿠키객체얻어내고
        if (cookie == null) {
            return null;
        }
        return URLDecoder.decode(cookie.getValue(), "euc-kr");
        //얻어낸 쿠키객체를 통해 쿠키의 값을 얻어내는것
    }
    public boolean exists(String name) {
    	//쿠키 이름 받아서  쿠키객체가 있나 없나 확인하고 있으면 true 없으면 false리턴
        return cookieMap.get(name) != null;
    }
    //생성자는 클라이언트가 쿠키를 가지고 요청했을때이고
    //밑에 createcookie메소드들은 객체생성 필요없이 쿠키를 만들어내는것
    //위와 아래는 다른얘기
    public static Cookie createCookie(String name, String value) throws IOException {
    	return new Cookie(name, URLEncoder.encode(value, "euc-kr"));//쿠키 객체생성
    	 //메소드 오버로딩1//쿠키의 이름과 값만 받아서 쿠키 객체 리턴
        //static이 붙어서 객체생성 필요없이 쿠키 객체생성
    }
    public static Cookie createCookie(String name, String value,int maxAge) throws IOException {
        Cookie cookie = new Cookie(name, URLEncoder.encode(value, "euc-kr"));
        cookie.setMaxAge(maxAge);
        return cookie;
    }
    public static Cookie deleteCookie(String name, String value,int maxAge) throws IOException {
        Cookie cookie = new Cookie(name, URLEncoder.encode(value, "euc-kr"));
        cookie.setMaxAge(maxAge);
        return cookie;
    }
    public static Cookie createCookie(String name, String value, String path,//메소드 오버로딩2 
        int maxAge) throws IOException {
        Cookie cookie = new Cookie(name, URLEncoder.encode(value, "euc-kr"));
        cookie.setPath(path);//패스 설정
        cookie.setMaxAge(maxAge);//유효 시간 설정
        return cookie;//그리고 쿠키 리턴
    }
    public static Cookie createCookie(String name, String value, String domain,//메소드 오버로딩3
            String path, int maxAge) throws IOException {
        Cookie cookie = new Cookie(name, URLEncoder.encode(value, "euc-kr"));
        cookie.setDomain(domain); //도메인설정
        cookie.setPath(path);
        cookie.setMaxAge(maxAge);
        return cookie;
    }
}