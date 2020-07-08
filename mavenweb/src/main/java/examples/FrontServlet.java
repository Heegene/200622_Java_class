package examples;
// 서비스 메소드만 오버라이딩한상태

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontServlet
 */
public class FrontServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// front 라고 요청이 들어왔을때
		// was는 요청을 추상화한 객체에 httpservrequest 와
		// 응답에 필요한 부분을 추상화한 객체에 response만듦
		// 서블릿 실행될때 서비스 메소드에 각각의 인자값을 넣어서 보냄
		// 랜덤값 만들어서 보내기
		int diceValue = (int)(Math.random()*6) +1;
		
		// setattribute에 값을 맡겨둠 
		request.setAttribute("dice", diceValue); // dice 에 diceValue
		
		// 어디로이동할지 getrequestdispatcher  항상 /로 시작
		RequestDispatcher requestDispatcher 
		// 이 값을 /next 페이지로 넘겨줄거다
		    = request.getRequestDispatcher("/next");
		requestDispatcher.forward(request, response);
		
	}

}
