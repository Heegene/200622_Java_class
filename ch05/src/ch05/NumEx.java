package ch05;

class  AA1 {
	int        num1 ;
	static int num2 ;
	AA1() {
		num1 ++;
		num2++;
		
	}
	void print() {
		System.out.println("num1 = " +num1+", num2 = " + num2);
	}
}

public class NumEx {
	public static void main(String[] args) {
		AA1 a1 = new AA1(); 
		a1.print();
		AA1 a2 = new AA1(); 
		a2.print();
		AA1 a3 = new AA1(); 
		a3.print();
		
	}

}
