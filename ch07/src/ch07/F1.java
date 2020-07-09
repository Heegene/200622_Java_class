package ch07;

public class F1 {
    String  name;
    F1(String name) {
    	this.name = name;
    }
    void    a1() {
    	System.out.println("이름: " + name);
    }
    
   public static void main(String[] args) {
	F1 f1  = new F1("연개소문");
	F2 f2  = new F2("김두한");
	F1 f3  = f2;         // Up Casting 가능
	f3.a1();
	// f3.a2(); 부모로 형 변환시 부모가 가진 멤버변수 또는 메소드만 가용 가능 
	
	// F2 f4  = (F2)f1;  // 자식에다 부모 클래스 대입하려면 반드시 형 변환 해도 실행시 문제 발생 
	// 부모/자식 멤버변수 , 메소드 다 사용 가능 
	F2 f5  = (F2) f3;    // 자식을 부모에 넣었다가 다시 원위치 -->  문제 없음  
	
	f5.a1();
	f5.a2();
   }
}

class F2 extends F1 {
	F2(String name) {
		super(name);
		}
	void a2() {
		System.out.println("난 자식 메소드");
	}
}

