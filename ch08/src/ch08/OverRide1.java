package ch08;

 class A1 {
	  public void print() {
		 System.out.println("  부모 메소드");
	}
}
// Override 경우 부모 선언자보다 같거나 넓어야 함 
class A2 extends A1{
    @Override   // 어노테이션은 규칙에 맞게 Check  , Comment는 그냥 주석
 	public void print() {
		System.out.println(" 자식 메소드");
	}
}
public class OverRide1 {
	public static void main(String[] args) {
		A1 a1 = new A1();
		A1 a2 = new A2();
		A2 a3 = new A2();
		a1.print();
		a2.print();
		a3.print();
	}
	

}
