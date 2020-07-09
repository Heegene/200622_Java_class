package ch08;

public class ShapeEx {
      public static void main(String[] args) {
  		//Shape sh = new Shape() ;  Instance 안됨 (객체 생성이 안됨 )
		Shape[] sh = new Shape[3] ;
		sh[0]   =  new Triangle();
		sh[1]   =  new Rectangle();
		sh[2]   =  new Circle();
		for (Shape s : sh) {
			s.print();
			s.draw();
			if ( s instanceof Rectangle ) {
				((Rectangle)s).display();
			}
		}
		
	}
	
}
