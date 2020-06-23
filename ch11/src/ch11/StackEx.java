package ch11;

import java.util.Stack;

public class StackEx {
	public static void main(String[] args) {
		String[] pet = {"산토끼", "고양이", "진돗개", "치와와", "콩이"};
		Stack<String> st = new Stack<>();
		for (String str:pet) {
			System.out.println("push --> " + str);
			st.push(str); // 산토끼 고양이 진돗개 치와와 콩이
		}
		
			
		System.out.println("--------------------------");
		while(!st.isEmpty()) {
			System.out.println("Pop-->" + st.pop()); // push한 순서의 반대로 나옴 First In Last Out 
			// 콩이 치와와 진돗개 고양이 산토끼 
		}
		
	}

}
