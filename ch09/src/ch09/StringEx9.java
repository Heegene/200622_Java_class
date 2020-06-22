package ch09;

public class StringEx9 {
	public static void main(String[] args) {
		String fullName = "Hello.Java";
		int index = fullName.indexOf('.');
		System.out.println("index -> " + index);
		String fileName = fullName.substring(0, index);
		
		String ext = fullName.substring(index+1);
		System.out.println(fullName+ " 의 확장자를 제외한 이름은 " + fileName);
		System.out.println(fullName + " 의 확장자는 " + ext);
// 출력결과
/*		index -> 5
		Hello.Java 의 확장자를 제외한 이름은 Hello
		Hello.Java 의 확장자는 Java
*/
		
	}
}
