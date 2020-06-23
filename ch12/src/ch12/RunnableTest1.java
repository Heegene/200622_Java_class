package ch12;

// interface로 상속받음 
class B1 implements Runnable {
	@Override
	public void run() {
		for (int i = 0; i < 100; i ++) {
			System.out.println(Thread.currentThread().getName() + " : " + " 대박 \t");
			if (i%5 == 0) {
				System.out.println();
			}
		}
		
	}
}

public class RunnableTest1 {
	
	public static void main(String[] args) {
		B1 b1 = new B1(); // 이때 Runnable은 작업 내용을 가진 객체이고 실제 스레드는 아님
		B1 b2 = new B1(); // Runnable 구현 객체를 생성한 후 이걸 매개값으로 해서 Thread 생성자를 호출해야 작업 스레드가 생성됨
		
		Thread th1 = new Thread(b1, "첫번째"); // Thread 생성자 호출 
		Thread th2 = new Thread(b2, "두번째"); // 이때 익명객체를 매개값으로 사용하는 경우 많음
		
		Thread th3 = new Thread ( new Runnable() { // 익명구현객체 
			@Override
			public void run() {
				// TODO Auto-generated method stub
				for (int i = 0; i < 100; i ++) {
					System.out.println(Thread.currentThread().getName() + " : " + " 대박 \t");
					if (i%5 == 0) {
						System.out.println();
					}
			}
		}
		});
		
		th1.start();
		th2.start();
		th3.start();
		
	}

}
