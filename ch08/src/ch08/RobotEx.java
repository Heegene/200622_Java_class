package ch08;
// java.lang 은 default로 import

public class RobotEx {
	static void action(Robot r) {
		if( r instanceof DanseRobot) {
			((DanseRobot)r).dance();
		} else if( r instanceof DrawRobot) {
			((DrawRobot)r).draw();
		} else {
			//((SingRobot)r).sing();
			SingRobot sr = (SingRobot) r;
			sr.sing();
		}
	}
     public static void main(String[] args) {
    	 Robot[] rb  = new Robot[3] ;
    	 rb[0] = new DanseRobot();
    	 rb[1] = new DrawRobot();
    	 rb[2] = new SingRobot();
    	 
    	 for ( Robot r : rb) {
    		 action(r);
    	 }
		
	}
}
