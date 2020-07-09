package ch05;

class Sonata {
	Sonata() {
		System.out.println("난 기본 " );
	}
	Sonata(int a) {
		System.out.println("문의 수는 " + a );
	}
	Sonata(String str) {
		System.out.println("옵션 " + str );
	}
}
public class ConstrEx1 {
	public static void main(String[] args) {
		Sonata s1 = new Sonata();
		Sonata s2 = new Sonata(4);
		Sonata s3 = new Sonata("에어백");
	}

}
