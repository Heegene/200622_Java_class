package ch11;

import java.util.ArrayList;
import java.util.Iterator;

public class ArrayList1 {
	public static void main(String[] args) {
		
		ArrayList<String> list=new ArrayList<String>();
		list.add("사과");
		list.add("바나나");
		list.add("귤");
		list.add("오렌지");
		list.add("바나나");
		System.out.println("요소의 개수 is "+ list.size());
		System.out.println(">> Iterator 객체로 요소 얻기");
		
		Iterator<String> elements = list.iterator(); // 요소를 iterator 형식으로 돌려줌 
		// 사과 	바나나 	귤 	오렌지 	바나나 	 <-- 이게 elements 안에 들어가게됨
		while(elements.hasNext()) { //다음거 남아있으면
			System.out.print(elements.next() + " \t"); // 그다음거 가져오기 
		}
		System.out.println("\n");
		System.out.println(">> get 메소드로 요소 얻기");
		
		for(int i = 0; i <list.size(); i++ ) {
			System.out.print(list.get(i)+ "\t");
		}
		System.out.println();
		
		System.out.println(list.toString());
	}
	

}
