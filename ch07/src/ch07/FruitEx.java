package ch07;

public class FruitEx {
     public static void main(String[] args) {
    	 // 판매자
  		FruitSeller fs1  = new FruitSeller("김준수", 100, 0);
 		FruitSeller fs2  = new FruitSeller("정선아",  80, 1000);
 		// 구매자
		FruitBuyer  fb1  = new FruitBuyer("옥주현" ,    0, 20000);
		FruitBuyer  fb2  = new FruitBuyer("안예은",    10, 10000);
		FruitBuyer  fb3  = new FruitBuyer("류정한",     0, 10000);
		FruitBuyer  fb4  = new FruitBuyer("신성록",     0, 12000);
		
		fs1.showSellResult();   // 김준수
		fs2.showSellResult();   // 정선아

		fb1.showBuyResult();    // 옥주현
		fb2.showBuyResult();    // 안예은
		fb3.showBuyResult();
		fb4.showBuyResult();
		
		fb1.buy(fs1, 3000);  
		fb2.buy(fs2, 2000);
		fb3.buy(fs2, 5000);
		fb4.buy(fs1, 5000);
		
		fs1.showSellResult();
		fs2.showSellResult();
		fb1.showBuyResult();
		fb2.showBuyResult();
		fb3.showBuyResult();
		
	}
}
