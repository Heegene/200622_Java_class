package ch09;

public class System1 {
	public static void main(String[] args) {
		String path = System.getenv("path");
		String java_home = System.getenv("JAVA_HOME");
		System.out.println("path->" + path);
		System.out.println("java_home -> " + java_home);
		
// 출력 결과
//	C:/Program Files/Java/jre1.8.0_172/bin/server;C:/Program Files/Java/jre1.8.0_172/bin;C:/Program Files/Java/jre1.8.0_172/lib
// /amd64;C:\Program Files (x86)\Common Files\Oracle\Java\javapath;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\Program Files\Git\cmd;C:\Program Files\Java\jdk1.8.0_172\bin;C:\WINDOWS\System32\OpenSSH\;C:\Users\
// user\AppData\Local\Programs\Microsoft VS Code\bin;C:\Users\
//		user\AppData\Local\Microsoft\WindowsApps;C:\Program Files\Java\jdk1.8.0_172\bin;;C:\Java Programming\Tools;
//	C:\Program Files\Java\jdk1.8.0_172

		
	}
	
	
}
