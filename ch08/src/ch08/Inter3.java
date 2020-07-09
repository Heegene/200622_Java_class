package ch08;

interface F1 {
	void aa();
}
interface F2 {
	void bb();
}
// Interface끼리는 다중 상속 가능
interface F3 extends F1, F2 {
	void cc();
}

class F4 implements F3 {
	    public void aa() {
			// TODO Auto-generated method stub
		    System.out.println("aa method"); 
		}
		@Override
		public void bb() {
			// TODO Auto-generated method stub
		    System.out.println("bb method"); 
		}
		@Override
		public void cc() {
			// TODO Auto-generated method stub
		    System.out.println("cc method"); 
		}
}

class F5 implements F1, F2 {
	public void bb() {
		// TODO Auto-generated method stub
	    System.out.println("F5 bb method"); 
	}
	public void aa() {
		// TODO Auto-generated method stub
	    System.out.println("F5 aa method"); 
	}
}

public class Inter3 {
	public static void main(String[] args) {
		F3 f3 = new F4();
		f3.aa();
		f3.bb();
		f3.cc();
		F5 f5 = new F5();
		f5.aa();
		f5.bb();
	}
}
