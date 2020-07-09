package ch06;

public class Method2 {
//	    void hi() {
	   static void hi() {
		System.out.println("안녕하세요  이하이 !!");
		
	}
	public static void main(String[] args) {
		Method1 m1 = new Method1();
	    for (int i = 0; i < 20 ; i ++ ) {
	    	// Class명.method() 또는 Method명이 static로 지정되어 있을때 Class명 생략가능  
	    	//m1.hi();
	    	hi();
	    	// Class안에 사용하려는 Method가 실행문과 같은 Class에 있을때 생략가능 
	    }
	}

}
