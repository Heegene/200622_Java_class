package ch06;

class A1 {
	  void a1() {
		  System.out.println("대박");
	  }
}

class A2 {
	void a22() {
		  System.out.println("쪽박");
	}
}
public class Method3 {
    public static void main(String[] args) {
   	 A1 a1 = new A1();
	 A2 a2 = new A2();
	 a1.a1();
	 a2.a22();
    }

}
