package ch08;
// 추상 Class
abstract class C1 {
	int k;
	public C1() {
		System.out.println("추상Class 생성자 " );
	}
	void setK(int k) {
		this.k = k;
	}
	abstract void print();  // 하나이상의 추상 메소드가 존재 해야 함
}

class C2 extends C1 {
	void print() {
		System.out.println("C2 k = " + k);
	}
}

public class OverRide3 {
	public static void main(String[] args) {
		// C1 c1 = new C1();  추상 Class는 생성 안됨
		C1 c1 = new C2(); 
		c1.setK(12);
		c1.print(); 
		C2 c2 = new C2(); 
		c2.setK(7);
		c2.print();     // c2.k 와 c1.k  --> 각각의 값은 다름 
		c1.print(); 
	}

}
