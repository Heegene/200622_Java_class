package ch06;

class Account {
	String accountNo;
	String ownerName;
	int balance;

	void deposit() {
		balance += 1000;
		System.out.println(ownerName+ "님의 잔액 이 1000원 증가하여 : " + balance + "원이 되었습니다");

	}

	void withdraw() {
		balance -= 1000;
		System.out.println(ownerName+ "님의 잔액 이 1000원 감소하여 : " + balance + "원이 되었습니다");
}

	int getBal() {
		return balance;
	}
}

public class AccountEx {
	public static void main(String[] args) {
		Account ac1 = new Account();
		ac1.accountNo = "국민-222-333";
		ac1.ownerName = "흑수돌";
		ac1.balance = 5000;

		for (int i = 0; i < 3; i++) {
			ac1.deposit();
		}
		System.out.println("잔액 : " + ac1.getBal());

		for (int i = 0; i < 3; i++) {
			ac1.withdraw();
		}
		System.out.println("성명  " + ac1.ownerName + " 계좌  " + ac1.accountNo + "잔액 : " + ac1.getBal());

		Account ac2 = new Account();
		ac2.accountNo = "신한 222-333";
		ac2.ownerName = "김소현";
		ac2.balance = 10000;

		for (int i = 0; i < 3; i++) {
			ac2.deposit();
		}
		System.out.println("잔액 : " + ac2.getBal());

		for (int i = 0; i < 3; i++) {
			ac2.withdraw();
		}
		System.out.println("성명  " + ac2.ownerName + " 계좌  " + ac2.accountNo + "잔액 : " + ac2.getBal());

	}

}
