package ch12;

class G1 extends Thread {
	@Override
	public void run() {
		// TODO Auto-generated method stub
		for (int i = 0; i < 20; i++) {
			System.out.print("-");
		}
		System.out.println();
	}
}

class G2 implements Runnable {
	@Override
	public void run() {
		for (int i = 0; i < 20; i ++) {
			System.out.print("+");
		}
		System.out.println();
	}
}

class G3 implements Runnable {
	@Override
	public void run() {
		for(int i = 0; i < 20; i ++ ) {
			System.out.print("*");
		}
		System.out.println();
	}
}


public class Ex01 {
	public static void main(String[] args) {
		G1 th1 = new G1();
		G2 g2 = new G2();
		G3 g3 = new G3();
		
		Thread th2 = new Thread(g2); // 인터페이스로 구현한 건 스레드 생성자 다시 사용해야함 
		Thread th3 = new Thread(g3);
		
		th1.start(); 
		th2.start();
		th3.start();
		
	}

}
