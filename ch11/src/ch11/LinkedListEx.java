package ch11;

import java.util.Iterator;
import java.util.LinkedList;

public class LinkedListEx {
	
	public static void main(String[] args) {
	LinkedList<String> kk = new LinkedList<>();
	String[] animal = {"산토끼", "고양이", "진돗개", "치와와", "콩이"};
	for (int i = 0; i < animal.length; i++ ) {
		kk.add(animal[i]); // Arraylist처럼 .add 사용 
	}
	
		
	int i = 0;
	Iterator<String> it = kk.iterator();
	while(it.hasNext()) {
		System.out.println(i + "-> " + it.next());
		i++;
	}
	System.out.println(kk.toString());
	
	System.out.println("----------------------poll1-------------------------");
	
	i = 0;
	while(!kk.isEmpty()) {
		System.out.println(i + "->" + kk.poll()); // 빼오면서 메모리에서 삭제됨 첫번째거부터 삭제됨 
		i++;
		
	}
	
	System.out.println("kk.size is " + kk.size());
		// 사이즈가 0이 됨(뺐으니까) 
	}

}
