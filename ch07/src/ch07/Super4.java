package ch07;

class E1 {
	 int x;    // x = 50
	 E1() {
		 System.out.println("허걱");  // Default 생성자 
	 }
     E1(int x) {
    	 this();
    	 this.x   = x;
     }
}

class E2 extends E1 {
	E2() { super(50);}
	E2(int x) {    // x = 25
		this();
		this.x = x;
	}
	void print() {
		System.out.println(" x = " +x);
	}
	
}

public class Super4 {
	public static void main(String[] args) {
		E2 e = new E2(25);
		e.print();
	}
     
}
