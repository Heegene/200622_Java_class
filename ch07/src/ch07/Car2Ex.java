package ch07;

public class Car2Ex {
	public static void main(String[] args) {
		Car2[] car = new Car2[3];
		car[0] = new Bus();
		car[1] = new Ambulance();
		car[2] = new FireEngine(); 
		 
		for(Car2 c : car) {
			c.move();                 //  실행은 부모와 같은 이름의 자식 메소드가 실행 (자식 메소드  수행)
			System.out.println("for Car2-->" +c.a);  // 멤버변수는 부모것만 적용
			c.move();
			// 실행 불가 --> c.special();  // Child 수행
			if ( c instanceof Ambulance) {   // instanceof 는 해당 메소드 있는것만 수행 
			     Ambulance am = (Ambulance) c;
			     am.special();
				 System.out.println("Ambulance:"+am.a);  // 멤버변수는 부모것만 적용
			}
		}
	}

}
