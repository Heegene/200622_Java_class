package ch18;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OraSelect3 {
	private static final String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	//	private static final String url = "jdbc:oracle:thin:@172.30.1.27:1521:xe";
	// 본인 ip주소 쳐도됨 
	// 여기서 127.0.0.1을 localhost로 변경해줘도 됨 1521 -> 포트번호 xe => service id(sid)
	private static final String user = "scott";
	private static final String passwd = "tiger";
	private static String driver = "oracle.jdbc.driver.OracleDriver";

	// 선택결과를 복수개로 가져오는것 LIST로 구현
	public static void main(String[] args) throws SQLException {
		List<String> list = new ArrayList<>();
		
		try {
			Class.forName(driver);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		String sql = "SELECT * FROM emp";
		
		try (Connection conn = DriverManager.getConnection(url,user,passwd);
		     PreparedStatement ps = conn.prepareStatement(sql)) {
			
			try (ResultSet rs = ps.executeQuery()) {
				
				while (rs.next()) {
					String empno = rs.getString(1);
					String ename = rs.getString("ename");
					String role = empno + "\t"+ ename + "\n";
					list.add(role);
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println(list);
		}
		
	}
}
