package ch06;
import java.io.IOException;
import java.util.Scanner;
class E1 {
	  int  result = 1;
	  void factorial(int cnt) {
		   if ( cnt > 1  )  {
			    result  *=cnt;  
				System.out.print( cnt +" * " );
			    factorial(--cnt);
		   }
		   else {
			System.out.println( cnt  );
			   System.out.println("Factorial 결과는  " + result );
			   return;
		   }
	  }
}

public class FactorialEx {
   public static void main(String[] args) throws IOException {
	    E1  e   = new E1();
		int InNum ;
		System.out.println("Factorial 할 10이하의   숫자를 입력하세요 ?  "  );
   	    Scanner sc = new Scanner(System.in);
     	 InNum = sc.nextInt();
		// InNum = System.in.read() - '0';
	     e.factorial(InNum);
   }
}
