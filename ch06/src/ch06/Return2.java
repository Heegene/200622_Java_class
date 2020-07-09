package ch06;

class F1{
	int  add(int x, int y) {
		return x+y;
	}
	String print(String name) {
		return name + " Return Name";
	}
}

public class Return2 {
	public static void main(String[] args) {
		 F1 f1 = new F1();
		 System.out.println(f1.add(10, 5));
		 int k =  f1.add(7 ,  6);
		 System.out.println("연산결과 : " + k);
		 System.out.println(f1.print("양만춘 "));
		 String result = f1.print("대조영");
		 System.out.println(result);
		 

    }
}