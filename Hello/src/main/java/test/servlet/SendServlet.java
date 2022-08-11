package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//3. 요청 맵핑(처리할 요청 경로를 작성). 반드시 /로 시작을 해야하고, 프로젝트명(/Hello)은 쓰지 않는다.
@WebServlet("/send")
public class SendServlet extends HttpServlet {//1. HttpServlet 클래스를 상속받는다.
   
   //2. service() 메소드를 오버라이드
   @Override
   protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      System.out.println("request received");
      
      //한글 깨지지 않게 받기.다만 응답 인코딩은 또 따로 해줘야 한다.
      req.setCharacterEncoding("utf-8");

      
      // msg라는 파라미터명으로 전송되는 문자열 읽어오기.
      String requestedMsg=req.getParameter("msg"); //여러개의 파라미터가 전달될 수 있기 때문에, 구분해서 전달되어야 한다.
      System.out.println("requested message : "+requestedMsg);
      
      //한글 응답 인코딩 설정
      resp.setCharacterEncoding("utf-8");
      //응답 컨텐츠 설정
      resp.setContentType("text/html; charser=utf-8");
      
      //요청을 한 클라이언트에게 문자열을 응답할 객체를 얻어오기.
      PrintWriter pw=resp.getWriter();
      pw.println("<doctype html>");
      pw.println("<html>");
      pw.println("<head>");
      pw.println("<meta charset='utf-8'>");
      pw.println("<title>제목입니다.</title>");
      pw.println("</head>");
      pw.println("<body>");
      pw.println("<p>oh~</p>");
      pw.println("<p>who are you?</p>");
      pw.println("<p><img src=\"http://localhost:8888/Hello/images/kim1.png\"></p>");
      pw.println("<img src='http://localhost:8888/Hello/images/kim1.png'>");
      pw.println("<br>");
      pw.println("<div><a href=\"/Hello/\">인덱스로 돌아가기</a></div>");
      pw.println("</body>");
      pw.println("</html>");
      //마크업 안 해도 나오긴 나오는데... 그냥 문자열만 뱉을 뿐...
//      pw.println("print test1"); //요청을 한 웹브라우저에 출력이 됨.
//      pw.println("print test2");
//      pw.println("프린트 테스트3");
      pw.flush(); // 방출
      pw.close(); // 닫아주기.
      
      //새로운 servlet이 추가가 되면 껐다 켜야 적용이 된다.
   }
}