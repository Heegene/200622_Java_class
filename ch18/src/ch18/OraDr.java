package ch18;

import java.sql.Connection;
import java.sql.DriverManager;

public class OraDr {
	private static final String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	// 여기서 127.0.0.1을 localhost로 변경해줘도 됨 1521 -> 포트번호 xe => service id(sid)
	private static final String user = "scott";
	private static final String passwd = "tiger";
	public static void main(String[] args) {
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		
		try {
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(url, user, passwd);
			System.out.println("Start");
			
			
			if( conn != null) {
				System.out.println("연결 성공");
			}
			else {
				System.out.println("연결 실패");
			}
			
			
			conn.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		
		
		
	}

}
