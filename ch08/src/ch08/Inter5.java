package ch08;

interface I {
	void play();
}
class  Test {
	void autoPlay(I i) {
		i.play();
	}
}
class H1 implements I {

	public void play() {
		// TODO Auto-generated method stub
	  	  System.out.println("난 A야");
	}
}

class H2 implements I {
	public void play() {
		// TODO Auto-generated method stub
	  	  System.out.println("난 B야");
	}
}

public class Inter5 {
      public static void main(String[] args) {
		 H1 h1 = new H1();
		 H2 h2 = new H2();
		 Test t = new Test();
		 t.autoPlay(h1);
		 t.autoPlay(h2);
	}
}
