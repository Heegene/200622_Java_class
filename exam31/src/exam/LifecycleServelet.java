package exam;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/LifecycleServelet")
public class LifecycleServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LifecycleServelet() {
        super();
        System.out.println("LifeCycleServelet가!! 생성!");
    }

	public void init(ServletConfig config) throws ServletException {
		System.out.println("init 호출됨");
	}

	public void destroy() {
		System.out.println("destroy 호출됨");
		// 내용이 변경되면 destory() 메소드가 호출됨
		// destory() 메소드 호출된 다음에 페이지 새로고침하면
		// 다시 객체생성부터 함 
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("service 호출됨");
		// 페이지를 새로고침할 때마다 service가 호출됨
	
		
	}

}
