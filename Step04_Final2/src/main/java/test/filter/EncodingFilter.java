package test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

// "/*" 가 프로젝트에 오는 모든 요청에 대해 필터링을 하겠다는 의미(/는 최상위 경로를 의미함)
// /* == /Step04_Final/ 하위의 모든 요청
@WebFilter("/*")
public class EncodingFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	/*
	 * request 에 들어오는 참조값은 원래 HttpServletRequest 객체의 참조값이다.
	 * response 에 들어오는 참조값은 원래 HttpServletResponse 객체의 참조값이다.
	 */
	@Override //HttpServlet의 부모type임
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//1. 만일 인코딩 설정이 되지 않았다면
		if(request.getCharacterEncoding()==null) {
			// Post 방식 전송했을 때 한글 깨짐 방지
			request.setCharacterEncoding("utf-8");
		}
		//2. 요청의 흐름 이어가기(통과의 느낌)
		chain.doFilter(request, response);
		
	}
	
	// init()은 이 필터가 최초 호출되었을 때 한번만 호출되는 메소드 - 필터에서 어떤 동작을 준비하고 싶을 때 한다.
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
