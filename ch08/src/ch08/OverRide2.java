package ch08;
class B1 {
	void print1() {
		System.out.println("바꾸기 가능 ");
	}
	final void print2() {
		System.out.println("변경 금지 ");
    }
}
class B2 extends B1 {  // final은 상속 금지 
	void print1() {
		System.out.println("난 자식 메소드 ");
	}
//	void print2() {   // final이 있는 Method는 재정의 금지 
//	}
}
public class OverRide2 {
	public static void main(String[] args) {
		B1 b1 = new B2();
		b1.print1();
		b1.print2();
	}
}
