

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class HeaderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public HeaderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter(); // client와의 연결통로
		out.println("<html>");
		out.println("<head><title>form</title><head>");
		out.println("<body>");
		
		Enumeration<String> headerNames = request.getHeaderNames();	
		// request가 가진 getHeadernames 메소드 - 헤더이름을 문자열
		// Enumeration 객체로 반환해줌
		// while을 통해 name과 values를 알아냄 
		while (headerNames.hasMoreElements()) {
			String headerName = headerNames.nextElement();
			String headerValues = request.getHeader(headerName);
			out.println(headerName + " : " + headerValues + " <br> ");
		}
		
		out.println("</body>");
		out.println("</html>");
		
			
		// response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		// get을 호출하나 post를 호출하나 결국 doget이 구현됨
	}

}
