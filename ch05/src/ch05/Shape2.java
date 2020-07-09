package ch05;

import java.io.IOException;

public class Shape2 {
     public static void main(String[] args) throws IOException {
    	 final int TRIANGLE    = 1;
       	 final int RECTANGLE   = 2;
       	 final int CIRCLE      = 3;
    	 
		 System.out.println("1 ~ 3 사이 숫자 입력 ???");
    	 int num = System.in.read() - '0';
    	 if       (num == TRIANGLE ) {
    		 System.out.println("삼각형을 그린다");
    	 } else if( num == RECTANGLE) {
    		 System.out.println("사각형을 그린다");
    	 } else if( num == CIRCLE) {
    		 System.out.println("원형을 그린다");
     	 } else  {
		     System.out.println("1~3 입력 ㅎㅎ");
	     }
     }
}
