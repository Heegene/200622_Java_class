package robot;

import robot.actions.FireNo;
import robot.actions.FlyNo;

public class CheapRobot extends Robot {
	public CheapRobot() {
		// TODO Auto-generated constructor stub
		flyAction = new FlyNo();
		fireAction = new FireNo();
		
	}
	
	@Override
	public void shape() {
		// TODO Auto-generated method stub
		System.out.println("기본적으로 팔 다리 머리 몸통구성, 걷고달릴수있음");
		
	}
	
}
