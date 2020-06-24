package ch11;

import java.util.ArrayList;

public class CarEx {
	
	public static void main(String[] args) {
		
		ArrayList<Car> al = new ArrayList<>();
		
		al.add(new Car());
		al.add(new Bus());
		al.add(new Taxi());
		
		for (Car c: al) {
			c.print();
			if(c instanceof Bus) {
//				((Bus)c).move();
//				// 강제 형변환 한 케이스
//				// 아래 두줄과 같음
				 Bus b = (Bus) c;
				 b.move();
			}
		}
		
		
	}

}
