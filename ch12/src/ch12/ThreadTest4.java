package ch12;

class Th3 extends Thread {
	Th3(String str) {
		super(str);
	}
	@Override
	public void run() {
		for (int i = 1; i <= 20; i++) {
			System.out.println(getName() + "대박" + i);
			try {
				sleep(50);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
}

class Th4 extends Thread {
	Th4(String str) {
		super(str);
	}
	@Override
	public void run() {
		for (int i = 1; i <= 20; i++) {
			System.out.println(getName() + "월요일" + i);
			try {
				sleep(10);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}

}

public class ThreadTest4 {
	public static void main(String[] args) {
		Th3 t1 = new Th3("Th3...");
		Th4 t2 = new Th4("Th4...");
		t1.start();
		t2.start();

	}
}
