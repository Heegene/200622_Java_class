package ch11;

import java.util.HashMap;

public class HashMapEx {
	public static void main(String[] args) {
		HashMap<String, String> hm = new HashMap<>();
		hm.put("이승우", "010-2222-3333"); // put을 사용하여 값 입력 
		hm.put("손흥민", "010-2244-3333");
		hm.put("전지현", "010-2255-3333");
		System.out.println("이승우 TEL : " + hm.get("이승우")); // 값을 가져옴
		System.out.println("손흥민 TEL : " + hm.get("손흥민"));
		System.out.println("전지현 TEL : " + hm.get("전지현"));
		System.out.println("이콩이 TEL : " + hm.get("이콩이")); // 없는 값 입력하면 null 나옴 
	}
}
