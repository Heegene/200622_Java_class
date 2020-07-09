
package ch05;

import java.io.IOException;

class   B1 {
	void hap(int end) {
		int sum = 0 ;
		for (int i = 1; i <= end; i ++) {
			sum += i;
		}
		System.out.println("1부터" +end+"까지 합 : "+sum);
	}
	
}
public class Test2 {
	public static void main(String[] args) throws IOException {
		System.out.println("숫자를 1자리 입력하세요");
		int end = System.in.read() - '0';
		B1 b1 = new B1();
		b1.hap(end);
		
		
	}

}
