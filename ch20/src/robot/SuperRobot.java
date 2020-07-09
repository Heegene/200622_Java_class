package robot;

import robot.actions.FireOk;
import robot.actions.FlyOk;

public class SuperRobot extends Robot {

	public SuperRobot() {
		// TODO Auto-generated constructor stub
		flyAction = new FlyOk();
		fireAction = new FireOk();
		
	}

	@Override
	public void shape() {
		// TODO Auto-generated method stub
		System.out.println("기본적으로 팔 다리 머리 몸통구성 / 비행 미사일 가능");
	}
}
