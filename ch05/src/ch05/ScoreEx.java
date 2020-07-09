package ch05;
class Score {
	int        kor = 70;
	// static int 메모리는 공유 됨 
	static int eng = 80;
	int        math = 90;
	void total() {
		System.out.print("kor : " + kor + "   eng : " + eng + "   math : " + math);
		System.out.println("   총점 : " + (kor+eng+math));
	}
}
public class ScoreEx {
	public static void main(String[] args) {
		Score.eng  = 94;   
		Score s1 = new Score();
		Score s2 = new Score();
		Score s3 = new Score();
		s2.kor  = 90;   
		s2.eng  = 99;   
		s2.math = 97;
		s3.kor  = 88;   
	//	s3.eng  = 94;   
		// 과연   eng 의 행방은 ???5
		s3.math = 66;
		s1.total();
		s2.total();
		s3.total(); 
	}
}
