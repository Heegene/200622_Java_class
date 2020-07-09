package ch07;

public class FruitSeller {
	String  name;   // 판매자
	int     apple   =  20,   money = 0;
	final int PRICE = 1000 ;
	FruitSeller(String name ,int apple, int money) {
		this.name = name;
		this.apple = apple;
		this.money = money;
	}
	
	int    sell(String buyer , int amt) {
		   int num = amt / PRICE ;
		   apple -=  num;
		   money +=  amt;
		   System.out.printf(" %s가 %s에게  %d만큼 샀다\n", buyer, name, amt); 
		   return num;
	}
	
	void showSellResult() {
	    System.out.println("===================== ");
		System.out.println(name +" 판매자 사과갯수: " + apple);
		System.out.println(name +" 판매자 현재현금: " + money);
	}

}

class FruitBuyer {
	String name;    // 구매자
	int apple = 0 ,	money = 10000;
	FruitBuyer(String name  , int apple, int money) {
		this.name = name;
		this.apple = apple;
		this.money = money;
	}
	void  buy(FruitSeller fs , int amt) {
		int num = fs.sell(name, amt);
		apple += num;
		money -= amt;
	}
	void showBuyResult() {
	    System.out.println("--------------------------- ");
		System.out.println(name +" 구매자 사과갯수: " + apple);
		System.out.println(name +" 구매자 현재현금: " + money);
	}
	
}