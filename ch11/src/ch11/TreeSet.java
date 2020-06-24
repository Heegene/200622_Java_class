package ch11;


public class TreeSet {
	public static void main(String[] args) {
		java.util.TreeSet<Integer> ts = new java.util.TreeSet<>();
		while(ts.size()!=6) {
			int num = (int) (Math.random()*45) + 1;
			System.out.println("Num -> " + num);
			ts.add(num);
		}
		
		System.out.println(ts); 
		// 6, 17, 20, 26, 27, 43
		// 자동으로 정렬됨
		// hashset과 마찬가지로 중복 허용X
		// hashset, treeset 둘다 검색속도는 빠른편이고
		// 대신 자동정렬 기능이 있음 
	}

}
