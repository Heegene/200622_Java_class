package robot;

import robot.actions.FireAction;
import robot.actions.FlyAction;

public abstract class Robot {
	public FlyAction flyAction;
	public FireAction fireAction;
	
	public Robot() {
		
	}
	
	public abstract void shape();
	
	public void actionFly() {
		flyAction.fly();
	}
	
	public void actionFire() {
		fireAction.fire();
	}
	
	public void actionBasic() {
		System.out.println("팔, 다리, 머리, 몸통이 있습니다.");
	}
	
	public void setFlyAction(FlyAction flyAction) {
		this.flyAction = flyAction;
	}
	public void setFireAction(FireAction fireAction) {
		this.fireAction = fireAction;
	}
	
}
