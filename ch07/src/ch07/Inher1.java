package ch07;

class A1 {
	 int a = 7;
	A1() {
		System.out.println("난 부모Class");
	}
	void am1() {
		System.out.println("부모 Method a1");;
	}
	void am2() {
	System.out.println("부모 Method a2");;
    }
}

class A2 extends A1 {
	int b = 10;
	A2() {
		System.out.println("난 자식 Class");
	}
	void am2() {
		super.a = 33;
		System.out.println("자식 Method a2");;
	}
}


public class Inher1 {
   public static void main(String[] args) {
	A2 a = new A2();
	a.am1();
	a.am2();
	System.out.println("a = " + a.a);
	System.out.println("b = " + a.b);
    }
   
}
