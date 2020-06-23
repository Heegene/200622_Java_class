package ch12;

class Th1 extends Thread {
	@Override
	public void run() {
		for (int i = 1; i <= 20; i ++ ) {
			System.out.println("대박 " + i + " \t");
			if( i %5 == 0) {
			System.out.println();
			}
			
			try {
				sleep(50);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
}

class Th2 extends Thread { // 마찬가지로 상속받음 
	@Override
	public void run() {
		for (int i = 1; i <= 20; i ++ ) {
			System.out.println(getName() + i + " \t "); // 이걸 사용하면 내가 정해준 이름이 아니라
			// 시스템에서 정해준 이름 ex thread-118 이런식으로 이름이 할당됨 
//			System.out.println("화요일" + i + " \t");
			try {
				sleep(50);
			} catch (InterruptedException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}
}


public class ThreadTest3 {
	public static void main(String[] args) {
		Th1 t1 = new Th1(); // 각각의 객체 생성
		Th2 t2 = new Th2();
		
		t1.start(); // 화요일, 대박이 불규칙적으로 콘솔에 찍힘 
		t2.start();
		
	}

}
