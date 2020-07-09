package ch06;

public class CalCul {
//	성적표
//
//	이  름 	국어	영어	수학	총점	   	 평균	
//	이효리	90	80	70	240		 80
//	김소현	76	86	90	252		 84
//	정선아	90	78	90	258		 86
//	김준수	80	80	80	240	 	 80
//	김가로	50	60	70	180		 60
//	홍길동	30	70	90	190		 63
//	====================================================
//	합계     	416	454	490	1360	453
//	평  균 	69	75	81	226	     75

	
	int sum, length;
	int[] tot;
	String[] tit;
	int len;
	String[] name;
	int[][] score;
	String st;

	CalCul(String st, String[] tit, String[] name, int[][] score, int len) {
		this.st = st;
		this.tit = tit;
		this.name = name;
		this.score = score;
		this.len = len;
		this.tot = new int[score[0].length];

	}

	public void print() {
		System.out.println(st + "\n");
		for (String t : tit) {
			System.out.print(t + "\t");
		}
		System.out.println();
		// linePrint() { }
		for (int i = 0; i < score.length; i++) {
			System.out.print(name[i] + "\t");
			for (int j = 0; j < score[i].length; j++) {
				System.out.print(score[i][j] + "\t");
				sum += score[i][j];
				tot[j] += score[i][j]; // 과목별 합계 ->SubSum
			}
			System.out.println(""+sum + "\t" + sum / score[i].length);  // 사람별 총점과 평균
			sum = 0;
		}
		linePrint();
		System.out.print("합계     \t");

		// 과목별 합계
		for (int i = 0; i < tot.length; i++) {
			System.out.print(tot[i] + "\t");
			sum += tot[i]; // 과목별 합계
		}
		System.out.println(sum + "\t" + sum / tot.length);
		System.out.print("평  균 " + "\t");
		for (int i = 0; i < tot.length; i++) {
			System.out.print(tot[i] / name.length + "\t");
		}
		System.out.println(sum / name.length + "\t" + sum / tot.length / name.length);
	}

	void linePrint() {
		for (int i = 0; i < len; i++) {
			
			System.out.print("=");
		}
		System.out.println();

	}
}
