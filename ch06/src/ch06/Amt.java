package ch06;

public class Amt {
		public static void main(String[] args){
			String[] tit={"이름","1월","2월","3월","4월","합계","평균"};
			String[] name = {"냉장고","테레비","청소기","세탁기"};
			int[][] amt = {{250,170,300,780},{170,120,150,220},
				{450,230,400,250},{400,200,500,250}};
			CalCul cc1 = new CalCul("매출현황", tit, name, amt, 54);
			cc1.print();
		}

}
