package ch11;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

public class HashMapEx2 {
	public static void main(String[] args) {
		
	
	HashMap<String, String> hm = new HashMap<>();
	hm.put("이승우", "010-2222-3333"); // put을 사용하여 값 입력 
	hm.put("손흥민", "010-2244-3333");
	hm.put("전지현", "010-2255-3333");
	System.out.println("이승우 TEL : " + hm.get("이승우")); // 값을 가져옴
	System.out.println("손흥민 TEL : " + hm.get("손흥민"));
	System.out.println("전지현 TEL : " + hm.get("전지현"));

	Set<String> st = hm.keySet(); // keyset을 이용한 값 추출
	// Keyset 메소드로 모든 키를 Set 컬렉션으로 얻은 다음, 반복자를 통해 키를 하나씩 얻고 get()을 통해 값 가져옴 
	for (String str: st) {
		System.out.println(str + "의 전화[Set] ==> " + hm.get(str));
	}
	
	Iterator<String> it = hm.keySet().iterator(); // iterator를 이용한 값 추출
	while(it.hasNext()) {
		String key = it.next();
		System.out.println(key+ "의 전화 [Iterator] ==> " + hm.get(key));
	}
	
	
	}
}
