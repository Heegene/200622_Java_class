package ch05;

class Card{
	String kind; // 인스턴스 변수
	int number;
	static int width  = 100; // 클래스 변수
	static int height = 250; 
}

// c1 : Heart,7 크기 : 100, 250 c2 : Heart,7 크기 : 50,80
public class CardTest {
	public static void main(String[] args) {
		Card c1 = new Card(); 	// 객체1 생성
		c1.kind = "Heart";	    // 인스턴스 변수
		c1.number = 7;
		Card c2 = new Card();	// 객체2 생성
		c2.kind = "Spade";   	// 인스턴스 변수
		c2.number = 4;
		System.out.print("Instance c1 : " + c1.kind + "," + c1.number);
		// 클래스 접근
		System.out.println("  Class 크기 : " + Card.width+ "," + Card.height); 
	    // 참조변수로 클래스 변수 접근
	    c1.width = 50;
	    c2.height = 80;
	    System.out.print("c2 : " + c1.kind +","+c1.number);
	    System.out.println(" 크기 : " + c2.width+"," +c2.height);
	}
}

