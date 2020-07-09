package ch08;

class G1 {
      void play() {
    	  System.out.println("난 A야");
      }
}
class G2 {
    void play() {
  	  System.out.println("난 B야");
    }
	
}
public class Inter4 {
     public static void main(String[] args) {
 		G1 g1 = new G1();
		G2 g2 = new G2();
		g1.play();
		g2.play();
	}
}
