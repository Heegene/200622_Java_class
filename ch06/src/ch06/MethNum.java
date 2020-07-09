package ch06;
class B1 {
	 // Method overLodding  --> 같은 class 내 매개변수 갯수가 다르거나 ,Data형이 다른 경우 
	void print() { 
		System.out.println("매개변수 없음");
	}
	void print(int a1) {
		System.out.println("매개변수 int  1개:" + a1);
	}
	void print(String x1) {
		System.out.println("매개변수 Str  1개:" + x1);
	}
	void print(int a1, String x1) {
		System.out.printf("매개변수 int  1개[%d] Str  1개[%s]:",a1,x1);
	}
}

public class MethNum {
	public static void main (String[] args) {
		B1 b1 = new B1();
		b1.print();
		b1.print(7);
		b1.print("만두좀 주지");
		b1.print(23, "개  만두좀 주지");
		 
	}

}
