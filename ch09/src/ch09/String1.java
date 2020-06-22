package ch09;

public class String1 {

	public static void main(String[] args) {
		String a1 = "Java";
		String a2 = "Java";
		String a3 = new String("Java");
		String a4 = new String("Java");
		String a5 = new String("java");

		System.out.println(a1 + "," + a2 + "," + a3); // Java, Java, Java

		// 주소값
		if (a1 == a2) {
			System.out.println("== a1과 a2는 같다"); // 같다 출력 같은 literal값
		} else {
			System.out.println("== a1과 a2는 다르다.");
		}
		if (a1 == a3) {
			System.out.println("==a1과 a3은 같다");
		} else {
			System.out.println("==a1과 a3은 다르다."); // 다르다 출력 - 참조값으로 새로 넣어줌 이경우 equals로 내용만 비교 
		}

		// 내용
		if (a1.equals(a2)) {
			System.out.println("equals a1과 a2는 같다");
		} else {
			System.out.println("equals a1과 a2는 다르다.");
		}
		if (a1.equals(a3)) {
			System.out.println("equals a1과 a3은 같다");
		} else {
			System.out.println("equals a1과 a3은 다르다");
		}

		if (a1.equals(a4)) {
			System.out.println("a1과 a4는 같다"); // 같다 출력 내용물 비교
		} else {
			System.out.println("a1과 a4는 다르다");
		}
		if (a1.equalsIgnoreCase(a4)) {
			System.out.println("a1과 a4는 같다");
		} else {
			System.out.println("a4과 a4는 다르다");
		}

		// equalsIgnoreCase는 대소문자 관계 없이 equals 검사

		if (a3.equalsIgnoreCase(a5)) {
			System.out.println("equalsIgnoreCase a3과 a5는 같다");
		} else {
			System.out.println("equalsIgnoreCase a3과 a5는 다르다");
		}

		/*
		 * 출력 결과 Java,Java,Java 
		 * == a1과 a2는 같다 
		 * ==a1과 a3은 다르다. 
		 * equals a1과 a2는 같다 
		 * equals a1과 a3은 같다
		 * a1과 a4는 같다
		 * a1과 a4는 같다
		 * equalsIgnoreCase a3과 a5는 같다
		 */

	}

}
