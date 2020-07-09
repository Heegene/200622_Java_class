package ch05;

class Shape3 {
	int  width  = 1 ; 
	int  height = 1; 
	int  depth  = 1;
	Shape3(int w) {
		width = w;
		System.out.printf("넓이[%d] 높이[%d] 깊이[%d]  면적[%d] ", width, height, depth ,  width* height*depth );
		System.out.println();
	}
	Shape3(int w, int h) {
		width  =  w;
		height =  h;
		System.out.printf("넓이[%d] 높이[%d] 깊이[%d]  면적[%d] ", width, height, depth ,  width* height*depth );
		System.out.println();
	}
	Shape3(int w, int h , int d) {
		width  =  w;
		height =  h;
		depth  =  d;
		System.out.printf("넓이[%d] 높이[%d] 깊이[%d]  면적[%d] ", width, height, depth ,  width* height*depth );
		System.out.println();
	}
}
public class Rectangle2 {
	public static void main (String[] args) {
		// 각 각 생성자 Call
		int w = 2, h = 3, d = 4;
 		Shape3 s1 = new Shape3(w);
 		Shape3 s2 = new Shape3(w, h);
 		Shape3 s3 = new Shape3(w, h, d);
		
	}
  
}
