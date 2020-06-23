package ch12;

class Account2User extends Thread {
	Account2 act;
	boolean flag;
	
	public Account2User (Account2 act, String name) { 
		super(name); // thread명으로 들어가게됨(상위 클래스 thread) 
		this.act = act; 
	}
	
	@Override
	public void run() { // overriding
		for (int i = 0; i < 5 ; i ++ ) {
			try { 
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			synchronized (act) { // act를 사용할 때 동시에 요청이 들어갈 수 없도록 sync를 검 
				
				if (flag) {
					act.deposit((int)(Math.random()*10000), getName()); // 첫상태가 true로 되어있으므로 예금 먼저 하게 됨
				} else {
					act.withdraw((int)(Math.random()*10000), getName()); // 상태 스왑되었으므로 그이후에 출금 
				}
				flag = !flag; // flag 상태 스왑 (한번 예금 한번 출금 이런식) 
				
			}
			
		}
		
	}
}


public class Account2Ex {
	public static void main(String[] args) {
		Account2 act = new Account2(10000,"국민");
		Account2 act2 = new Account2(15000, "신한");
		Account2User au1 = new Account2User (act, "옥주현"); // parameter로 act라는 인스턴스 집어넣고 Account2User 
		Account2User au2 = new Account2User (act, "조정은"); 
		Account2User au3 = new Account2User (act, "정선아");
		
		Account2User au4 = new Account2User(act2, "김준수"); // 남자들은 신한은행 여자들은 국민은행 쓰면서 같은통장으로 입출금 반복
		Account2User au5 = new Account2User(act2, "류정한");
		Account2User au6 = new Account2User(act2, "다위니");
		
		
		au1.start();
		au2.start();
		au3.start();
		au4.start();
		au5.start();
		au6.start();
		
	}
}


