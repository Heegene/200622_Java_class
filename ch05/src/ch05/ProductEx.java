package ch05;

class Product {
	{
		System.out.println("Instance 초기화 Block");
	}
	static {
		System.out.println("Class 초기화 Block");
    }
	Product () {
		System.out.println("생성자 초기화 Block");
	}
	void print() {
		System.out.println("Method  Block");
	}
}

public class ProductEx {
	public static void main(String[] args) {
		Product p1 = new Product();
		Product p2 = new Product();
		Product p3 = new Product();
		p1.print();
		p2.print();
		p3.print();
		
	}
	
}

