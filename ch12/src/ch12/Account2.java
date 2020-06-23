package ch12;

public class Account2 { // thread 상속받아 만든 클래스
	String AccName; // 계좌명 필드  
	int total; // 잔액 필드
	
	Account2 (int total, String AccName) { // 생성자 선언
		this.total = total;
		this.AccName = AccName;
		
	}
	// 예금 
	void deposit(int amt, String name) {
		total += amt;
		System.out.println(name + "예금 : " + amt);
	}
	
	// Sync 사용시 동시 접근을 막음 (출금) 
	synchronized void withdraw (int amt, String name) {
		if(amt <= total ) {
			total -= amt;
			System.out.println(name + "출금 : "+ amt);
			getTotal();
		} else {
			System.out.println(name+ " 의 출금 요청 " + amt + " 잔액부족 저금좀 해 --> 현재 잔액 : " + total);
		}
		
	}
	
	void getTotal() {
		System.out.println(AccName + "잔액 : " + total);
	}
}


