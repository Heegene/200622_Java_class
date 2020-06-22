package ch09;

import java.util.Calendar;
import java.util.Date;

public class Calen1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Calendar cal = Calendar.getInstance();
		// 싱글톤이므로 가져오기 위해 getInstance 사용
		
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH);
		int day = cal.get(Calendar.DATE);
		System.out.printf("오늘은 %d년 %d월 %d일 입니다. \n", year, month+1, day);
		// printf로 처리해야 %d가 첫번째, 두번째, 세번째에 원하는걸 집어넣어줌
		// calendar 0부터 시작해서 month+1을 해 주어야 함 
		
		int hour = cal.get(Calendar.HOUR);
		int min = cal.get(Calendar.MINUTE);
		int sec = cal.get(Calendar.SECOND);
		
		System.out.printf("지금은 %d: %d: %d 초입니다. \n", hour, min, sec);
		
		Date dt = cal.getTime();
		System.out.println(dt);
		int dy1 = cal.get(Calendar.DAY_OF_MONTH);
		int dy2 = cal.get(Calendar.DAY_OF_YEAR);
		
		System.out.println(dy1 + " ," + dy2);

	}

}
