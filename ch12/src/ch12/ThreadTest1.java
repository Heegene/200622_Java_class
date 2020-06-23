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
			try {
				Thread.sleep(100);
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
			}
			
		}
	}
	
}


public class ThreadTest1 {
	public static void main(String[] args) {
		A1 a1 = new A1("subA"); // Thread 클래스를 상속한 A1의 객체 생성 Parameter가 String으로 되어있으므로 subA 
		A1 a2 = new A1("subB");
//		a1.start(); // start()만 해주면 CPU scheduling으로 알아서 돌아감 
//		a2.start();
		a1.run(); // start()대신 run()을 하게되면 CPU를 순차적으로 할당받음(a1 다 돌고나서 a2로 순차이동) 
		a2.run(); // 근데 이렇게 순차적으로 할 거면 굳이 스레드로 만들 이유가 없음->start() 사용할 것 
		
		for (int i = 1; i <= 100; i ++) {
			System.out.println("Main " + i + " \t");
			if (i%10 == 0 ) {
				System.out.println();
				// 출력 결과
				// main이 돌아가는 중간에 subA도 돌고 subB도 돌고 불규칙적으로 섞여서 돌아감 
				// i가 10의 배수번째가 되면 줄바꿈 
				
			}
		}
		
	}
}
