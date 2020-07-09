package ch05;

class A1 {
	  int x, y;
	  void  add() {
		   System.out.println("합: " +(x+y));
	  }
}

public class Test {
	public static void main(String[] args) {
		A1 a1 = new A1();
		a1.x = 11; 
		a1.y = 7;
		a1.x = 11;
		a1.y =  7;
		a1.add();
	}

}
