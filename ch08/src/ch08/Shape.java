package ch08;
// 추상Class는  객체 생성이 안됨 
public abstract class Shape {
	public Shape() {};
	int a = 3;
	abstract void draw() ;
	void print() {
		System.out.println("------선과 점으로 구성됐다.-------");
	}
}

class Rectangle extends Shape {
	 void draw() {
		 System.out.println("사..각형을 그린다");
	 }
	 void display() {
		 System.out.println("Rectangle 사각형 Display을 그린다");
	 }
}

class Triangle extends Shape {
	void draw() {
		 System.out.println("삼..각형을 그린다");
	}
}
class Circle extends Shape {
	void draw() {
		 System.out.println("원...을 그린다");
	}
}