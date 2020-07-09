package ch06;

public class Method1 {
	public static void main(String[] args) {
		Method1 m1 = new Method1();
	    for (int i = 0; i < 20 ; i ++ ) {
	    	// Reference명.method()
	    	m1.hi();
	    }
	}
	void hi() {
		System.out.println("안녕하세요 하이 이하이 !!");
		
	}

}
