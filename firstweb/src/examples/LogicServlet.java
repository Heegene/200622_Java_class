package examples;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LogicServlet
 */
@WebServlet("/logic")
public class LogicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogicServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int v1 = (int) (Math.random()* 100) + 1;
		int v2 = (int) (Math.random()* 100) + 1;
		int result = v1 + v2;
		// 랜덤한 수 2개 집어넣고 result에 합 넣음
		
		// 해당 값을 jsp에 넘기기 위해 setattribute에 담음
		request.setAttribute("v1", v1);
		request.setAttribute("v2", v2);
		request.setAttribute("result", result);
		// 3개의 값 넣음
		
		// jsp 파일에 담기위해 해당페이지를 넣어줌
		// jsp가 web-content 바로 밑에 있으면 그냥 /result.jsp
		// 해당결과가 jsp 디렉토리 밑에 있다 그러면
		// /jsp/result.jsp 이렇게 해야함 
		RequestDispatcher rd = request.getRequestDispatcher("/result.jsp");
		// request dispatcher 객체가 얻어짐
		
		rd.forward(request, response);
		
		
		
	}

}
