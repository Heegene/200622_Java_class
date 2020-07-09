package robot;

import robot.actions.FireNo;
import robot.actions.FlyNo;
import robot.actions.KnifeNo;

public class CheapRobot extends Robot {
	public CheapRobot() {
		// TODO Auto-generated constructor stub
		flyAction = new FlyNo();
		fireAction = new FireNo();
		knifeAction = new KnifeNo();
		
	}
	
	@Override
	public void shape() {
		// TODO Auto-generated method stub
		System.out.println("기본적으로 팔 다리 머리 몸통구성, 걷고달릴수있음");
		
	}
	
}
