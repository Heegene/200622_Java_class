package ch18;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class OraDelete {
	private static final String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	private static final String user = "scott";
	private static final String passwd = "tiger";
	private static String driver = "oracle.jdbc.driver.OracleDriver";
	
	public static void main(String[] args) throws SQLException {
		Scanner sc = new Scanner(System.in);
		System.out.println("삭제할 부서번호 입력");
		

		int deptno = sc.nextInt();

		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "DELETE FROM DEPT WHERE deptno=?";
		try { 
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, passwd);
			ps = conn.prepareStatement(sql);
			ps.setInt(1, deptno);
			
			// result
			int result = ps.executeUpdate();
			if (result > 0) {
				System.out.println("Oraprepare delete 완료");
			} else {
				System.out.println("Oraprepare delete 실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		
	}

		
		
	}

