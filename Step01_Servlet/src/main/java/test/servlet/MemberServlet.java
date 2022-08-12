package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dto.MemberDto;

@WebServlet("/member/list")
public class MemberServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//DB 에서 불러온 회원 목록이라고 가정하자
	    List<MemberDto> list=new ArrayList<>();
	    list.add(new MemberDto(1, "김구라", "노량진"));
	    list.add(new MemberDto(2, "해골", "행신동"));
	    list.add(new MemberDto(3, "원숭이", "상도동"));
	    
	    resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter pw = resp.getWriter();

		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset=\"utf-8\">");
		pw.println("<title>회원 목록 보기</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h1>회원 목록</h1>");
				pw.println("<table border=\"1\">");
				pw.println("<thead>");
					pw.println("<tr>");
						pw.println("<th>번호</th>");
							pw.println("<th>이름</th>");
								pw.println("<th>주소</th>");
								pw.println("</tr>");
				pw.println("</thead>");
				pw.println("<tbody>");
				// 반복문 돌면서 tr 만들기
				for(MemberDto dto : list) {
					pw.println("<tr>");
						pw.println("<td>"+ dto.getNum()+"</td>");
						pw.println("<td>"+ dto.getName()+"</td>");
						pw.println("<td>"+ dto.getAddr()+"</td>");
	                pw.println("</tr>");
				}
				pw.println("</tbody>");
		pw.println("</table>");
		pw.println("</body>");
		pw.println("</html>");
		//pw.flush();//방출
		pw.close();//닫아주기 (auto flush)
	}
}
