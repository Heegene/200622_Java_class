package ch05;

public class Car4 {
	String  name = "아우디";
	int     door;
	int     cc;
	static String  color;
	{     // Instance 초기화 , Instance 호출시 초기화 됨 
		door = 4;
		cc   = 2000;
	}
	static {
		color = "빨강";
	}

}
