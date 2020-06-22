package ch09;

public class Math1 {
	public static void main(String[] args) {
		// Math는 기본적으로 포함되어 있어서 import 불필요
		// java.lang에 기본적으로 포함된 내용
		// 로또번호 추출기 
		
		int[] i = new int[6]; // int배열에 공간 6개 마련
		for (int j = 0; j < 6; j ++) { // 6번 반복 
			int i1 = (int) (Math.random() *45) + 1; // i1 = 매스랜덤으로 추출한 1~45의 수
			i[j] = i1; // 대입 
			
		}
		
		for (int j = 0; j < i.length ; j++) { // 포문을 이용한 출력을 위해 i의 길이만큼 반복
			System.out.println(j + " : " + i[j]); // 0~5번째: 아까 추출한 값 출력 
		}
	
		
	}
}
