package ch06;

class Static2 {
	int        a = 7;
	static int b = 10;
	void       print1() {
		System.out.println("a= " + a+ ", b = " +b);
	}
	static void       print2() {
		// a가 객체를 선언해야 쓸수 있음 , static Method는 static변수만 사용가능
		//System.out.println("a= " + a+ ", b = " +b);
		System.out.println( " b = " +b);
	}
}

public class StaticTest {
    public static void main(String[] args) {
	    
    	Static2.print2();
    	Static2 s2 = new Static2();
    	s2.print1();
    }
}
