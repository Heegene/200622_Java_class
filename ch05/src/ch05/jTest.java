package ch05;

public class jTest {
	class Super1 {
		public int x=1;
	}

	class Super2 extends Super1 {
		public int y=2;
	}

	class Super3 extends Super2 {
		public int z=3;
	}

	class InTest {
		public  void main( String[] a ) { 
			Super1 s1 = new Super1();
			Super2 s2 = new Super2();
			Super3 s3 = new Super3();
			System.out.println("s1의 변수:"+s1.x);
			System.out.println("s2의 변수:"+s2.x+" "+s2.y);
			System.out.println("s3의 변수:"+s3.x+" "+s3.y+" "+s3.z);
		}
	}

}
