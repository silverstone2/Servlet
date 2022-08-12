package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/send")
public class SendServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 한글 깨짐 방지
		req.setCharacterEncoding("utf-8");
		
		// msg 읽어오기
		String requestedMsg=req.getParameter("msg");
	    System.out.println("requested message : "+requestedMsg);
	    
	    resp.setCharacterEncoding("utf-8");
	    resp.setContentType("text/html; charser=utf-8");
	    
	    PrintWriter pw=resp.getWriter();
	      pw.println("<doctype html>");
	      pw.println("<html>");
	      pw.println("<head>");
	      pw.println("<meta charset='utf-8'>");
	      pw.println("<title>메세지 전송 결과 페이지</title>");
	      pw.println("</head>");
	      pw.println("<body>");
	      pw.println("메세지 잘 받았어 클라이언트야!");
	      pw.println("<br>");
	      pw.println("<div><a href=\"/Hello/\">인덱스로 돌아가기</a></div>");
	      pw.println("</body>");
	      pw.println("</html>");
	}
}
