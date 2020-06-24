package ch11;

import java.util.HashSet;
import java.util.Iterator;

public class HashSetEx {
	public static void main(String[] args) {
		HashSet<String> hs = new HashSet<>();
		hs.add("콩이");
		hs.add("고양이");
		hs.add("야옹이");
		hs.add("강아지");
		hs.add("강아지"); // 중복을 허용하지 않음 
		hs.add("갱얼쥐");
		for(String str: hs) {
			System.out.println(str);
		}
		
		System.out.println("--------------------------------");
		Iterator<String> it = hs.iterator();
		while(it.hasNext()) {
			System.out.println(it.next()); // 순서도 콩이, 고양이, 야옹이, 갱얼쥐, 강아지 나옴
			// 넣은 순서대로 나오는 것이 아님 
		}
		
	}
	

}
