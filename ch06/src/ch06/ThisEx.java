package ch06;

class G1 {
	G1() {
		System.out.println("매개변수가 없는 생성자");
	}
	G1(String str) {
		this();   // 항상 맨 상위 지정 
		System.out.println("매개변수가 없는 1개 " + str);
	}
	G1(String str , String k) {
		this(str);  // 같은 Class내 다른 생성자 Call
		System.out.println("매개변수가 2개: " + str + " , " + k);
	}
}
public class ThisEx {
     public static void main(String[] args) {
		G1 g1 = new G1("대박","사건");
	}
}
