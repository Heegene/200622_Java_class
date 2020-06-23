package ch12;

class A1 extends Thread {
	// A1 이 스레드명이 됨 
	A1 (String str) {
		super(str);
	}
	
	@Override
	public void run() {
		for (int i = 1; i <= 100; i++) {
			System.out.println(getName() + i + " \t"); // thread명 가져오는 getName() 
			if (i%10 ==0) {
				System.out.println();
			}
		}
	}
	
}


public class ThreadTest1 {
	public static void main(String[] args) {
		A1 a1 = new A1("subA"); // Thread 클래스를 상속한 A1의 객체 생성 Parameter가 String으로 되어있으므로 subA 
		A1 a2 = new A1("subB");
		a1.start(); // start()만 해주면 CPU scheduling으로 알아서 돌아감 
		a2.start();
//		a1.run();
//		a2.run();
		
		for (int i = 1; i <= 100; i ++) {
			System.out.println("Main " + i + " \t");
			if (i%10 == 0 ) {
				System.out.println();
				// 출력 결과
				// main이 돌아가는 중간에 subA도 돌고 subB도 돌고 불규칙적으로 섞여서 돌아감 
			}
		}
		
	}
}
