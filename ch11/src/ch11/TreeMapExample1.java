package ch11;

import java.util.Map;
import java.util.TreeMap;

public class TreeMapExample1 {
	
	public static void main(String[] args) {
		
		TreeMap<Integer, String> scores = new TreeMap<Integer, String>();
		// key, value로 integer, string 사용
		scores.put(new Integer(87), "홍길동"); // Integer 객체로 만들어줌(int x)
		scores.put(new Integer(98), "이동수");
		scores.put(new Integer(75), "박길순");
		scores.put(new Integer(90), "신용권");
		scores.put(new Integer(80), "김자바");
		
		Map.Entry<Integer, String> entry = null;
		
		entry = scores.firstEntry(); // firstentry 는 key중에 가장 낮은 값을 반환 
		System.out.println("가장 낮은 점수 : " + entry.getKey() + " - " + entry.getValue());
		entry = scores.lastEntry(); // lastentry는 key중에 가장 높은 값을 반환 
		System.out.println("가장 높은 점수 : " + entry.getKey() + " - " + entry.getValue() + " \n");
		entry = scores.lowerEntry(new Integer(95)); // lowerentry는 입력한 entry 미만 값을 가진 entry 반환
		System.out.println("95점 아래 점수 : " + entry.getKey() + " - " + entry.getValue());
		entry = scores.higherEntry(new Integer(95)); // higherentry는 해당값 초과 값을 가진 entry 반환
		System.out.println("95점 위의 점수 : " + entry.getKey() + " - " + entry.getValue());
		entry = scores.floorEntry(new Integer(95)); // floorentry는 이하 값을 가진 entry 반환
		System.out.println("95점 이거나 바로 아래 점수 : " + entry.getKey() + " - " + entry.getValue());
		entry = scores.ceilingEntry(new Integer(85)); // ceiling은 이상 값을 가진 entry 반환
		System.out.println("85점 이거나 바로 위의 점수 : " + entry.getKey() + " - " + entry.getValue());
		
		
		while(!scores.isEmpty()) {
			entry = scores.pollFirstEntry(); // 첫번째 entry 부터 빼나감 (가장 낮은 entry값) 
			System.out.println(entry.getKey() + " - " + entry.getValue() + " (남은 객체 수 : " + scores.size() + " )");
		}
	}

}
