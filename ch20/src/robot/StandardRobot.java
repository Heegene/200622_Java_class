package robot;

import robot.actions.FireOk;
import robot.actions.FlyNo;
import robot.actions.FlyOk;
import robot.actions.KnifeWithWood;

public class StandardRobot extends Robot {

	public StandardRobot() {
		flyAction = new FlyOk();
		fireAction = new FireOk();
		knifeAction = new KnifeWithWood();
		// TODO Auto-generated constructor stub
	}
	
	
	@Override
	public void shape() {
		// TODO Auto-generated method stub
		System.out.println("기본적으로 팔, 다리, 머리, 몸통구성 / 걷고 달리고 미사일 있음");
	}
	
}
