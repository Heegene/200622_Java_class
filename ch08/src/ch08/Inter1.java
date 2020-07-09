package ch08;
//  -------------------------------------------------------
// 인터페이스는 1) 양식의 역할( 큼) 함 , 
//          2) 다중상속 지원(극히 일부분..)
//          3) class 와 class 를 연결 해줌 (중요)
//-------------------------------------------------------
public interface Inter1 {
    int   a = 3   ;   // interface에 있는 모든 멤버변수는 Public Static
    abstract void display();
    void print()  ;    // 모든 public    
}

class D1  implements Inter1 {
	public  void display() {
		// a = a+1;
		System.out.println("재정의 했으...a-->"+a);
	}
	public  void print() {
		System.out.println("나도야 간다");
	}
}
