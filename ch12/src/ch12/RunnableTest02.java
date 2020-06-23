package ch12;

class Ra3 implements Runnable { // runnable 인터페이스 구현
	@Override
	public void run() {
		for (int i = 0; i < 20; i ++ ) {
			System.out.println(Thread.currentThread().getName() + " 대박 " + i);
			try {
				Thread.sleep(10);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		
	}
}


class Ra4 implements Runnable {
	@Override
	public void run() {
		// TODO Auto-generated method stub
		for (int i = 0; i < 20; i++ ) {
			System.out.println(Thread.currentThread().getName()+ " 월요일 " + i);
			try {
				Thread.sleep(10);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	}
}


public class RunnableTest02 {
	public static void main(String[] args) {
		Ra3 r1 = new Ra3();
		Ra4 r2 = new Ra4();
		
		Th3 th3 = new Th3("zz"); // Test4파일에 만들어둔 th3,4 클래스를 상속받은것
		Th4 th4 = new Th4("oo");
		
		Thread th1 = new Thread(r1, "ㅋㅋ"); // interface로 구현한 걸 스레드로 변환
		Thread th2 = new Thread(r2, "ㅠㅠ");
		
		th1.start();
		th2.start();
		th3.start(); // 클래스로 상속받은것 돌림
		th4.start();
		
		
	}
}
