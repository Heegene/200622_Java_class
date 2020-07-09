package ch07;
// 1. 다음 문제의 에러를 찾아서 고쳐라
class Product {          // Product생성자를 없애서 default사용
	int price;	int bonusPoint;
	// Product() {}      // default생성자를 만든다
	Product(int price) {
		this.price = price;
		bonusPoint = (int) (price / 10.0); 
	}
}
class Tv extends Product {
	Tv() {
		super(1000);    // super() 매개변수에 맞는 부모 생성자 호출
	}
	public String toString() { 
		return "TV";
	}
}
class ProductEx {
	public static void main(String[] args) {
		Tv t = new Tv();
	}
}