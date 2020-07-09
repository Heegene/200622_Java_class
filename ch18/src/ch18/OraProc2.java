package ch18;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Scanner;

public class OraProc2 {
	private static final String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	private static final String user = "scott";
	private static final String passwd = "tiger";
	private static String driver = "oracle.jdbc.driver.OracleDriver";
	
	public static void main(String[] args) throws SQLException {
		Scanner sc = new Scanner(System.in);
		System.out.println("사번 입력");
		int empno = sc.nextInt();
		
		
		String sql = "{call emp_Info2(?, ?, ?)}";
		
		Connection conn = null;
		CallableStatement cs = null;
		
		try {
			Class.forName(driver);
			
			conn = DriverManager.getConnection(url, user, passwd);
			cs = conn.prepareCall(sql);
			cs.setInt(1, empno);
			cs.registerOutParameter(2, java.sql.Types.VARCHAR);
			cs.registerOutParameter(3, java.sql.Types.DOUBLE);
			
			cs.executeQuery();
			
			String ename = cs.getString(2);
			double sal = cs.getDouble(3);
			
			System.out.println("사번 :" + empno);
			System.out.println("이름 :" + ename);
			System.out.println("급여 :" + sal);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
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
