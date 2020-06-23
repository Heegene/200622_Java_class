package ch11;

import java.util.ArrayList;
import java.util.Arrays;

public class ArrayL1 {
	
	public static void main(String[] args) {
		ArrayList<String> al = new ArrayList<>();
		
		al.add("구렁2");
		al.add("조렁이");
		al.add("구렁2");
		al.add("구렁4");
		al.add("구렁3");
		
		for (int i = 0; i < al.size(); i++) {
			System.out.println(al.get(i)); // 포문으로 하나씩 출력 
		}
		
		System.out.println("=================================");
		
		for (String str : al) {
			System.out.println(str); // 향상된 for문 
		}
		
		System.out.println(al.toString()); //이렇게도 출력할 수 있음(배열내용 한번에 보기) 
		
	}

}
