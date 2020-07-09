package ch06;

class Data {
	int kor;
	int eng;
	int math; 
	// Call by Reference
	void  add (Data d1, Data d2) {
		d1.kor  = d2.eng;
		System.out.println("add Method 진행중 국어 점수 : " + d1.kor);
	}
	// Call by Value
	void  addValue (int d1, int d2) {
		int temp;
		temp  = d1;
		d1 = d2;
		d2 = temp;
		System.out.println("addValue 1 점수 : " + d1);
		System.out.println("addValue 2 점수 : " + d2);
	}
}

public class DataEx {
	  public static void main(String[] args) {
		//    확보공간의 주소를 가지고 있다
		     Data d1 = new Data();  
		     Data d2 = new Data();
		     Data d3 = new Data();
		     
		     d1.kor    = 50;   //d1.kor   = 70;
		     d1.math   = 70;   //d1.kor   = 70;
		     d2.eng    = 80;
			 System.out.println("add 전 국어 점수 : " + d1.kor);
		     d3.add(d1,  d2);   // Instance를 넘겨주면  주소값을 넘겨주는 효과 
			 System.out.println("add 후 국어 점수 : " + d1.kor);
			 
			 int d11 =70;  // 변경 Data 확인 필요 하기 때문에 설정
			 int d22 =80;
			 d3.addValue(d11, d22);
			 System.out.println("addValue 후  d11 점수 : " + d11);
			 System.out.println("addValue 후  d22 점수 : " + d22);
			      }
}


