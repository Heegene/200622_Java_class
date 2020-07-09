package ch06;

public class Score {
	   public static void main(String[] args) {
	    	String[] tit  = { "이  름 ", "국어", "영어"  , "수학", "총점", "평균" };
	    	String[] name = { "이효리", "김소현", "정선아", "김준수","김가로","홍길동" };
	    	int[][] score = {{90,80,70},{76,86,90},{90,78,90},{80,80,80},{50,60,70},{30,70,90}};
	    	
	    	CalCul cal1 = new CalCul("성적표", tit, name, score, 52);
	    	cal1.print();
	   }
}
