package ch05;

public class Variable {
	// Method 밖에 있는것을 전역변수 , Member 변수 
	int      a;        // instance 변수 -> Static 없는 변수      
	String   b;
	static   int k;    // static -> class 변수  , 공유 한다 
	void     aa() {
		     int j = 3;   // Method 속에서 선언한 변수 , 지역변수 
	}
	
   
}
