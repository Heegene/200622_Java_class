package ch09;

public class PersonEx {
	public static void main(String[] args) {
		
		Person p1 = new Person(1111, "콩이");
		Person p2 = new Person(1111, "콩이");
		// '이콩이'를 '콩이'로 바꿔도 다르다고 나옴
		// 주소값이 다르기 때문 
		
		if (p1.equals(p2)) {
			System.out.println("같다");
		} else { 
			System.out.println("다르다");
		}
		
	}
}
