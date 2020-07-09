package ch05;

public class Car {
	String color;  // Member 변수 , 필드 
	int    speed;
	
	// Method ( 영문자 또는 $로 시작) 두번째부터 숫자가능 
	void   speedInc(int upSpeed) {
		   this.speed  += upSpeed;
		   System.out.println(speed+"속도를 올렸다.");
	}
	void   speedUp() {
		   System.out.println(speed+"속도를 말만 올렸다.");
	}
	
	void   print() {
		  System.out.println("색깔: " + color);
		  System.out.println("속도: " + speed);
	}

}
