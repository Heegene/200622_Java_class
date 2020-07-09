package ch05;

class D1 {
	int       a1 =  7;
	final int UPPER = 10;   // 변경불가 영문자 / 대문자 권장 
}

public class FinalEx {
	public static void main(String[] args) {
		D1 d1 = new D1();
		d1.a1 = 7;
	//	d1.UPPER = 20;   //변경불가 
	}

}
