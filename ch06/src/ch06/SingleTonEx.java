package ch06;

class SingleTon {
	String str;
	//private static  SingleTon instance = new SingleTon();
	private static  SingleTon instance;
	private SingleTon() {
	}
	public static SingleTon getInstance() {
		if (instance == null) instance = new SingleTon();
		return instance;
	}
}

public class SingleTonEx {
	public static void main(String[] args) {
		SingleTon st1 = SingleTon.getInstance();
		SingleTon st2 = SingleTon.getInstance();
		st1.str =  "넌 누구";
		System.out.println(st2.str);
		if (st1 == st2 ) System.out.println("같다");
		else System.out.println("ㅎ");
	}
}
