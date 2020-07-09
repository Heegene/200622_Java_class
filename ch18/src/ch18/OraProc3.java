package ch18;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Scanner;

public class OraProc3 {
	private static final String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	private static final String user = "scott";
	private static final String passwd = "tiger";
	private static String driver = "oracle.jdbc.driver.OracleDriver";
	
	
	public static void main(String[] args) throws SQLException {
		Scanner sc = new Scanner(System.in);
		System.out.println("수정할 사원코드");
		String empno = sc.nextLine();
		
		Connection conn = null;
		CallableStatement cs = null;
		String sql = "{? = call fc_update_sal(?)";
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, passwd);
			cs = conn.prepareCall(sql);
			
			cs.setString(2, empno);
			cs.registerOutParameter(1, java.sql.Types.DOUBLE);
			cs.executeQuery();
			
			Double sal = cs.getDouble(1);
			
			
			if (sal > 0 ) {
				System.out.println("callable statement 수정 성공");
			}
			else {
				System.out.println("수정 실패");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (cs != null) {
				cs.close();
			}
			if (conn != null) {
				
				conn.close();
			}
		}
		
		
	}

}
