package ch05;

class Car1 {
	String color;
	static int    speed;
	void   print() {
		System.out.println("색깔: " + color);
		System.out.println("속도: " + speed);
		System.out.println("-------------------");
	}
}
public class Car1Ex { 
	public static void main (String[] args) {
		Car1.speed = 130;   // static붙어 있는것은 객체 선언 없이 사용 가능 (공유 됨)
	    //  선언                생성
		Car1 c1 = new Car1();
		Car1 c2 = new Car1();
		
		c1.color = "빨강";		
		c1.speed = 200;
		c2.color = "노랑";		
 //		c2.speed = 150;
		c1.print();
		c2.print();
//		c1.color = "초록";
//		yourCar.speed = 150;
//		yourCar.print();
	}
}
 