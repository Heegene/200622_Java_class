package ch11;

public class Car {
	
	void print() {
		System.out.println("난 차야");
	}
}

class Bus extends Car {
	@Override
	void print() {
		// TODO Auto-generated method stub
		System.out.println("난 버스야");
	}
	void move() {
		System.out.println("승객 50명이야");
	}
}

class Taxi extends Car {
	@Override
	void print() {
		System.out.println("난 택시야");
		
		// TODO Auto-generated method stub
	}
}