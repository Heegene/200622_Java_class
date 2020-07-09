package ch07;

public class Outer {
	int    width  = 10;
	int    height = 10;
	
	Outer(int width,   int height) {
		this.width  = width;
		this.height = height;
		
	}
	public Inner getInner() {
		   return new Inner();
	}
	class Inner {
		int depth = 10;
        public int volume() {
        	return width * height * depth;
        }
	}

}
