package ch11;

import java.util.ArrayList;

public class ArrayL2 {
	public static void main(String[] args) { // static 에서 호출하려면 당하는애도 static 
		ArrayList<String> list = new ArrayList<>();
		
		list.add("수박"); // add를 통해 아이템 삽입 
		list.add("사과");
		list.add("바나나");
		list.add("수박");
		list.add("대추");
		list.add("바나나");
		System.out.println("갯수 " + list.size());
		
		print(list);
		
		// 1번 자리에 끼워넣기
		list.add(1,"키위"); // 인덱스 지정하고 String 넣어서 아이템 삽입(원래 그 자리에 있던 아이템은 뒤로 밀려남)
		print(list);
		
		list.set(4,  "봉숭아"); // 해당 아이템 갈아끼우기 
		print(list);
		
		list.remove(0); // 0번 인덱스 아이템 삭제되면서 빈자리는 뒤에서 땡겨옴 
		print(list);
		
		System.out.println("3번 인덱스" + list.get(3));
		System.out.println("바나나 문의 1 : " + list.contains("바나나")); // true
		System.out.println("바나나 문의 2 : " + list.indexOf("바나나")); // 2 첫번째 바나나 가져옴 
		System.out.println("바나나 문의 3 : " + list.lastIndexOf("바나나")); // 5 마지막에 있는 바나나 가져옴
		
		for (int i = 0; i < list.size(); i++) {
			if(list.get(i).equals("바나나")) { // 모든 바나나를 딸기로 변경 
				list.set(i, "딸기");
			}
		}
		print(list);
		
		System.out.println(list.toString()); // 이렇게도 확인 가능한데 왜 자꾸 콘솔에 이상하게 띄우지?
	}

	private static void print(ArrayList<String> list) {
		// TODO Auto-generated method stub
		for (String str: list) {
			System.out.print(str + " \t");
		}
		System.out.println("\n -----------------------------------------");
	}
}
