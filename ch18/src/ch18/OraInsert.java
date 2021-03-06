package ch18;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class OraInsert {
	private static final String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	//	private static final String url = "jdbc:oracle:thin:@172.30.1.27:1521:xe";
	// 본인 ip주소 쳐도됨 
	// 여기서 127.0.0.1을 localhost로 변경해줘도 됨 1521 -> 포트번호 xe => service id(sid)
	private static final String user = "scott";
	private static final String passwd = "tiger";
	public static void main(String[] args) throws SQLException {
		Scanner sc = new Scanner(System.in);
				System.out.println("부서번호 입력");
				String deptno = sc.nextLine();
				
				System.out.println("부서명 입력 ");
				String dname = sc.nextLine();
				
				System.out.println("위치 입력");
				String loc = sc.nextLine();
				
				
				Connection conn = null;
				Statement stmt = null;
				String driver = "oracle.jdbc.driver.OracleDriver";
				String sql = String.format("INSERT INTO DEPT VALUES(%s, '%s', '%s')", deptno, dname, loc);
				
				try {
					Class.forName(driver);
					conn = DriverManager.getConnection(url, user, passwd);
					
					stmt = conn.createStatement();
					
					int result = stmt.executeUpdate(sql);
					if (result > 0) {
						System.out.println("입력 성공");
					} else {
						System.out.println("입력 실패");
						
					}
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				} finally {
					if (stmt != null) {
						stmt.close();
					}
					if (conn != null) {
						conn.close();
					}
				}
				
		
		
	}

}
