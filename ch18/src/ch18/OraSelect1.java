package ch18;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class OraSelect1 {
	private static final String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	//	private static final String url = "jdbc:oracle:thin:@172.30.1.27:1521:xe";
	// 본인 ip주소 쳐도됨 
	// 여기서 127.0.0.1을 localhost로 변경해줘도 됨 1521 -> 포트번호 xe => service id(sid)
	private static final String user = "scott";
	private static final String passwd = "tiger";
	private static String driver = "oracle.jdbc.driver.OracleDriver";
	public static void main(String[] args) throws SQLException {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("부서코드를 입력하세요.");
		int deptno = sc.nextInt();
		String sql = "SELECT dname, loc FROM dept WHERE deptno=" + deptno;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, passwd);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			
			if(rs.next()) {
				String dname = rs.getString("dname"); // 이렇게 텍스트로 입력할수도 있음 
				String loc = rs.getString(2); // 이렇게 인덱스번호 int로 넣어줘도 가능
				System.out.println("부서코드 :" + deptno);
				System.out.println("부서명 : " + dname);
				System.out.println("부서위치 : " + loc);
			}
			 
			else {
				System.out.println("자료가 없습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				rs.close();
			}
			
			if(stmt != null) {
				rs.close();
			}
			
			if (conn != null) {
				conn.close();
			}
		}
		sc.close();
		
		
		
		
	}

}
