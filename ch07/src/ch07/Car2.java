package ch07;

public class Car2 {
	int  a = 7;
    void move() {
    	System.out.println("차 이동");
    }
}

class Bus extends Car2 {
	int  a = 25;
	void move() {
		System.out.println("40명 태우고 이동");
	}
}

class Ambulance extends Car2 {
	int  a = 100;
	void move(){
		System.out.println("사이렌 울리며 이동");
	}
	void special() {
		System.out.println("환자를 태우고 있다");
		
	}
}

class FireEngine extends Car2 {
	int  a = 11;
	void move() {
		System.out.println("물뿌리면서 이동");
	}
}