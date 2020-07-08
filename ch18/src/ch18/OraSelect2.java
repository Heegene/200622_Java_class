package ch18;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class OraSelect2 {
	private static final String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	//	private static final String url = "jdbc:oracle:thin:@172.30.1.27:1521:xe";
	// 본인 ip주소 쳐도됨 
	// 여기서 127.0.0.1을 localhost로 변경해줘도 됨 1521 -> 포트번호 xe => service id(sid)
	private static final String user = "scott";
	private static final String passwd = "tiger";
	private static String driver = "oracle.jdbc.driver.OracleDriver";
	
	public static void main(String[] args) throws SQLException {
		String sql = "SELECT * FROM emp";
		Connection conn= null;
		Statement stmt = null;
		ResultSet rs = null;
		
		System.out.println("사원 명단");
		System.out.println("사원코드 \t 사원명 \t 업무 \t \t 급여 \t 일자");
		System.out.println("---------------------------------------------");
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, passwd);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				do {
					int empno = rs.getInt(1);
					String ename = rs.getString(2);
					String job = rs.getString(3);
					int sal = rs.getInt("sal");
					Date date = rs.getDate("hiredate");
					
					if (job.length() > 7) {
						System.out.printf("%d\t%s\t%s\t%d\t%TF\n", empno, ename, job, sal, date);
					} else {
						System.out.printf("%d\t%s\t%s  \t%d\t%TF\n", empno, ename, job, sal, date);
					} 
				}
				while (rs.next());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null ) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
			
		
	}

}
