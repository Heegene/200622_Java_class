package ch05;

public class CarEx {
	public static void main (String[] args) {
	    //  선언                생성
		Car myCar = new Car();
		Car yourCar;               // 객체명   Reference 변수명
		yourCar = new Car();       // 생성 
		
		myCar.color = "빨강";
		myCar.speed = 200;
		yourCar.color = "초록";
		yourCar.speed = 150;
		myCar.speedInc(50);
		myCar.print();
		yourCar.print();
	}

}
