package ch06;

class Car2 {
	String  name;
	String  color;
	int     speed;
	 //   this 인스턴스 자신을 가리키는 참조변수. 인스턴스의 주소가 저장되어있음
     //   모든 인스턴스 메서드에 지역변수로 숨겨진 채로 존재
     //   인스턴스변수와 지역변수를 구별하기 위해 참조변수 this사용
	Car2(String name, String color, int speed) {
		this.name  = name;
		this.color = color;
		this.speed = speed;
	}
	void print() {
		System.out.println(name + "\t" + color+"\t"+speed );
	}
}
public class Car2Ex {
	public static void main(String[] args) {
		Car2 c1 = new Car2("소나타","빨강", 150);
		Car2 c2 = new Car2("카니발","검정", 120);
		c1.print(); 
		c2.print(); 
	}

}
