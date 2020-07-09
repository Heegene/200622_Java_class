package ch07;

class C1 {
//  생성자가 없으면 Default를 Compiler가 만들어 준다.	
	C1() {
		System.out.println("매개변수 없는 부모 생성자");
	}
	C1(String str) {
		System.out.println("매개변수 있는 부모 생성자 1 str  " + str);
	}

	void cc1() {
		System.out.println("C1 cc1 야호! 금요일이다");
	}
}
class C2 extends C1 {
	C2( ) {
		// super("헐~~");  // 매개변수 1개 짜리 부모 생성자 호출 
		System.out.println("매개변수 없는 자식 생성자");
		// super("헐~~");  // 매개변수 1개 짜리 부모 생성자 호출 
    }
	void cc1() {
		// super.cc1();
		System.out.println("C2  cc1 야호! 금요일이다");
	}
	void cc2() {
		System.out.println("cc2 자식 Method cc2 ");
	}
}
public class Super2 {
	public static void main(String[] args) {
		C2 c = new C2();
		c.cc2();
		c.cc1();
		//c.super.cc1();
	}
}
