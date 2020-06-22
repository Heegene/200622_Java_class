package ch09;

import java.util.Calendar;

public class Week1 {
	
	public static void main(String[] args) {
		Calendar cal = Calendar.getInstance();
		int day = cal.get(Calendar.DAY_OF_WEEK);
		String week = "";
		
		switch (day) {
		case 1: week = "일요일";
				break;
		case 2: week = "월요일";
				break;
		case 3: week = "화요일";
				break; 	
		case 4: week = "수요일";
				break;
		case 5: week = "목요일";
				break;
		case 6: week = "금요일";
				break;
		case 7: week = "토요일";
				break;
		}
		System.out.println(day + " 오늘은 " + week + " 입니다.");
		
		
		
	}

}
