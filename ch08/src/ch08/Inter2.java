package ch08;
interface E1 {
	void aa();
}
interface E2 extends E1 {
	void bb();
}
interface E3 extends E2 {
	void cc();
}
class E4 implements E3 {
	public void bb() {
		System.out.println("E4 난 E2에 있는 Method bb()");
	};
	public void aa() {
		System.out.println("E4 난 E1에 있는 Method aa()");
	}
	public void cc() {
		System.out.println("E4 난 E3에 있는 Method cc()");
	}
}
public class Inter2 {
	public static void main(String[] args) {
		E2 e2 = new E4(); // e2.aa,e2.bb만 사용 가능 ,   e2.cc()는 사용 불가 
		E4 e4 = new E4();
		e2.aa();   // E1
	//	e2.cc();   // E1
		e4.aa();   // E1
		e4.bb();   // E2
		e4.cc();   // E3 
	}
}
