package ch07;

public class Car {
  String  kind;
  Engine  eg;
  Car (String kind , Engine eg) {
	  this.kind = kind;
	  this.eg   = eg;
  }
  
  void   print() {
	  System.out.println("종류 : " + kind);
	  eg.print();
	  System.out.println("================ ");
	   }
  
  public static void main(String[] args ) {
	  Engine eg  = new Engine("알파엔진", 2000);
	  Engine eg2 = new Engine("베타엔진", 3000);
// --------------------------------------------------------------	  
//	  Car   c1 = new Car("소나타",eg);	  c1.print();
//	  Car   c2 = new Car("모  닝",eg);	      c2.print();
//	  Car   c3 = new Car("벤 츠",eg2);	  c3.print();
//    아래로 Change 가능 
// --------------------------------------------------------------	  
	  Car[] c    = new Car[3];
	  c[0]  = new Car("소나타" , eg);	 
	  c[1]  = new Car("모  닝" , eg);	  
	  c[2]  = new Car("벤 츠"  , eg2);	  
	  for( Car c1 : c) { 
		  c1.print();
	  }
	  
  }
}
