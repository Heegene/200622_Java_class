package robot;

public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("Superrobot 주문");
		Robot sr = new SuperRobot();
		
		sr.shape();
		sr.actionBasic();
		sr.actionFly();
		sr.actionFire();
		sr.knifeAction();
		
		System.out.println("---------------------------");
		System.out.println("standardrobot 주문");
		
		Robot st = new StandardRobot();
		st.shape();
		st.actionBasic();
		st.actionFly();
		st.actionFire();
		st.knifeAction();
		
		System.out.println("-----------------------------");
		System.out.println("cheap robot 주문");
		
		Robot cr = new CheapRobot();
		
		cr.shape();
		cr.actionBasic();
		cr.actionFly();
		cr.actionFire();
		cr.knifeAction();
		
		
		System.out.println("-----------------------");
		
		
	}

}
