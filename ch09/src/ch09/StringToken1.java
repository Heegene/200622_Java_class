package ch09;

import java.util.StringTokenizer;

public class StringToken1 {
	// token = 하나의 움직임의 단위 .나 ,로 구분하겠다는 표시 
	public static void main(String[] args) {
		
		StringTokenizer st = new StringTokenizer("산딸기, 집딸기, 판딸기.집딸기, 알카리딸기",",");
		// 구분자를 ,만 적으면 판딸기.집딸기는 붙어서 나옴 
		// st에 산딸기, 집딸기, 판딸기.집딸기,알카리딸기 라는 값이 저장됨
		while (st.hasMoreElements()) { // 다음 element가 있는 동안 true 
			System.out.println(st.nextElement());
		}
		
		// 출력결과
/*		산딸기
		 집딸기
		 판딸기
		집딸기
		 알카리딸기
*/
	}
}
