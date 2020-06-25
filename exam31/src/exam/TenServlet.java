package exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TenServlet
 */
@WebServlet("/ten") // annotation 으로 webservelet 이라는 것이 만들어져 있음
// ten이라는 url이 맘에 안들면 이부분을 수정하면 됨 
// 요청하는 주소값을 이걸로 바꿈

public class TenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TenServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클라이언트가 요청받아오는 객체와 응답하는 객체를 만들어냄
		// 응답은 httpserveletResponse에 있음
		// 그래서 응답은 httpserveletresponse에 넣어줘야함
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<h1>1-10까지 출력</h1>");
		for (int i = 1; i <= 10; i++) {
			out.print(i+"<br>"); // 줄바꿈
		}
		out.close();
		
		// 어차피 html 안에서는 줄바꿈 의미없으니 println 노상관
		// getwriter를 printwriter 객체ㅏ가 리턴받을수잇음
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}
