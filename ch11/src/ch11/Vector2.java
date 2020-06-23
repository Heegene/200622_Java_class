package ch11;

import java.util.Collections;
import java.util.Vector;

public class Vector2 {
	public static void print(Vector<String> vc) {
		for (String str: vc) {
			System.out.print(str + "\t");
		}
		System.out.println("\n------------------------------------------------");
		
	}
	
	public static void main(String[] args) {
		Vector<String> vc = new Vector<>();
		vc.add("수박"); // 순서대로 들어감 0. 수박 1. 고추 ... 
		vc.add("고추");
		vc.add("수박");
		vc.add("대추");
		vc.add("오이");
		System.out.println("갯수 : " + vc.size()); // 5개 
		print(vc);
		// 1번 자리에 끼워 넣기
		vc.add(1, "키위"); // 1번자리에 있던 고추는 뒤로 밀려남 
		print(vc);
		vc.set(4, "복숭아"); // 4번 자리에 있던 대추가 복숭아로 교체됨 
		print(vc);
		vc.remove(0); // 수박이 제거되고 0번 인덱스 이후의 것이 앞으로 땡겨짐 
		print(vc); 
		System.out.println("2번 인덱스 is " + vc.get(2)); // 수박 
		System.out.println("수박 문의 (포함 여부) " + vc.contains("수박")); // true
		System.out.println("수박 문의(index) " + vc.indexOf("수박")); // 2
		System.out.println("수박 문의(last index) " + vc.lastIndexOf("수박")); // 2
		
		for (int i = 0; i < vc.size(); i++) {
			if (vc.get(i).equals("고추")) { // 고추를 딸기로 변환
				vc.set(i, "딸기");
				
			}
		Collections.replaceAll(vc,"딸기","강아지");	// 포문 안써도 이걸로 교체 가능 
		}
		print(vc);
		
	}
}
