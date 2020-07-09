package ch05;

import java.io.IOException;

public class Shape {
     public static void main(String[] args) throws IOException {
		 System.out.println("1 ~ 3 사이 숫자 입력 ???");
    	 int num = System.in.read() - '0';
    	 if       (num == 1 ) {
    		 System.out.println("삼각형을 그린다");
    	 } else if( num ==2) {
    		 System.out.println("사각형을 그린다");
    	 } else if( num ==3) {
    		 System.out.println("원형을 그린다");
     	 } else  {
		     System.out.println("1~3 입력 ㅎㅎ");
	     }
     }
}
