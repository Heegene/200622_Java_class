package ch11;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.Properties;

public class PropertiesExample {
	public static void main(String[] args) throws FileNotFoundException, IOException {
		Properties pt = new Properties();
		String path = PropertiesExample.class.getResource("database.properties").getPath();
		// =을 사이에 두고 key와 value로 나눠짐 
		
		System.out.println("1 path " + path);
		path = URLDecoder.decode(path, "utf-8"); // path를 utf-8로 디코딩함 스페이스가 %20 이렇게도어있는걸 바꿔줌
		pt.load(new FileReader(path)); // path 읽어서 파일 로드되어서 파일 내용이 메모리에 로드됨 
		String driver = pt.getProperty("driver"); // 지정된것별로 값 넣음 
		String url = pt.getProperty("url");
		String userName = pt.getProperty("username");
		String password = pt.getProperty("password");
		
		System.out.println("드라이버: " + driver);
		System.out.println("url : " + url);
		System.out.println("username" + userName);
		System.out.println("password : " + password);
		
		
	}
}
