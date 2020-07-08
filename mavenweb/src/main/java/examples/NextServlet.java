package examples;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NextServlet
 */
@WebServlet("/next")
public class NextServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NextServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html"); // 응답타입 꼭 지정
		PrintWriter out = response.getWriter(); // 겟라이터 지정
		out.println("<html>"); 
		out.println("<head><title>form</title></head>");
		out.println("<body>");
		
		// request가 setattribute로 갖고있었던걸
		// get으로 가져옴
		
		
		int dice = (Integer)request.getAttribute("dice");
		// "dice", diceValue 이렇게 맡겼으니까
		// dice = diceValue 이렇게 값이 할당되어 있음
		// 맡길때 dice는 string이지만 뒤의 diceValue(두번째 arg)는 object 타입으로 됨
		// 오브젝트 타입이므로 받을때 다시 Integer로 변환
		
		
		out.println("dice : " + dice); // 숫자만큼 출력
			for (int i = 0; i < dice; i++) {
				// out.println("Hello!"); 이 안에선 줄바꿈 안됨
				out.print("Hello!<br>");
				// 리다이렉트는 url이 바뀌지만
				// forward는 url이 바뀌지 않음
				
			}
		out.println("</body>");
		out.println("</html>");
		
	}

}
