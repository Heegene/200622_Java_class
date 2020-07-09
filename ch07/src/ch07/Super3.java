package ch07;

class D1 {
	D1() {
		System.out.println("D1 매개변수 없는 조상 생성자");
	}
	D1(int x) {
		this();  // 자신 Class의 생성자 
		System.out.println("D1 매개변수 1개 조상: x = " + x);
	}
}

class D2 extends D1 {
	D2(int x) {
	//	super(x); // 조상 Class의 1개 매개변수 생성자 
		System.out.println("D2 매개변수 1개 부모: x = " + x);
	}
	D2(int x , int y) {
		this(x);   // 자신 Class의 1개 매개변수 생성자 
		System.out.println("D2 매개변수 2개 부모: x = " + x + " , y " +y);
	}
}

class C3 extends D2 {
	C3(int x , int y) {
		super(x,y);  // // 조상 Class의 2개 매개변수 생성자 
		System.out.println("C3 매개변수 2개 자식: x = " + x + " , y " +y);
	}
    void c3() {
    	System.out.println("C3 자식 허걱");
    }
}

public class Super3 {
	public static void main(String[] args) {
		C3 c = new C3(7, 15);
		c.c3();
	}

}
