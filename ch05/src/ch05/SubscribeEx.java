package ch05;

class Subscribe {
	  String  name;
	  String  telnum;
	  Subscribe (String n,  String t) {
		   name   = n;
		   telnum = t;
	  }
	  void ChgTelNum(String t) {
		  telnum = t;
	  }
	  void print() {
		  System.out.printf(" 이름   : %s    전화번호 : %s  \n" , name, telnum);
	  }
}
public class SubscribeEx {
	public static void main (String[] args) { 
		Subscribe s1  = new Subscribe("이성계","010-2223-5567");
		Subscribe s2  = new Subscribe("김유신","010-2267-6789");
		s1.print();
		s2.print();
		s2.ChgTelNum("02-344-7788");
		s2.print();
	}
}
