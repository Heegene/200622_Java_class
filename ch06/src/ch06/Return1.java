package ch06;

class C1{
	void divide(int x, int y) {
		if (y==0) {
			System.out.println("y가 0이야   0으로 못 나눠");
			return ; // 여기까지 하고 Method를 부른 곳으로 돌아가라 말이다 
		}
		System.out.printf("%d / %d  = %d\n", x,y, x/y); 
	}
}
public class Return1 {
	public static void main(String[] args) {
		C1 c = new C1();
		c.divide(12, 3);
		c.divide(10, 2);
		c.divide( 7, 0);
		c.divide(10, 3);
		c.divide(2, 3);
	}

}
