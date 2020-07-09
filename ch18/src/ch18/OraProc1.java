package ch18;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Scanner;

public class OraProc1 {
	private static final String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	private static final String user = "scott";
	private static final String passwd = "tiger";
	private static String driver = "oracle.jdbc.driver.OracleDriver";
	
	public static void main(String[] args) throws SQLException {
		Scanner sc = new Scanner(System.in);
		Connection conn = null;
		CallableStatement cs = null;
		
		System.out.println("부서번호 입력");
		String deptno = sc.nextLine();
		System.out.println("부서명 입력");
		String dname = sc.nextLine();
		System.out.println("위치 입력");
		String loc = sc.nextLine();
		
		String sql = "{call dept_Insert(?, ?, ?)";
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, passwd);
			
			cs = conn.prepareCall(sql);
			cs.setString(1,  deptno);
			cs.setString(2, dname);
			cs.setString(3, loc);
			
			int result = cs.executeUpdate();
			if (result > 0) {
				System.out.println("Oracle Callable Statement 입력성공");
				
			} else {
				System.out.println("입력 실패");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if( cs != null) {
				cs.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
	}

}
