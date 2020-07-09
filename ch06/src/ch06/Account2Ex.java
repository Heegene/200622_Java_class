package ch06;

class Account2 {
	String accountNo;
	String ownerName;
	int balance;
	
	public Account2(String amtno, String own, int bal) {
		accountNo  = amtno;
		ownerName  = own;
		balance    = bal;
	}
	void deposit(int amt) {
		balance += amt;
	}
	void withdraw(int amt) {
		if (balance < amt ) {
			System.out.println(ownerName + "인출 안됨 --> 현재잔액 부족:  잔액->" + balance +"  요청금액->"+amt);
		}  
		else balance -= amt;
	}
	int getBal() {
		return balance;
	}
}

public class Account2Ex {
	public static void main(String[] args) {
		Account2 ac1 = new Account2("국민 1111","김춘추",10000);
		Account2 ac2 = new Account2("신한 2222","정선아",20000);
		Account2 ac3 = new Account2("농협 3333","안예은",30000);
		
		ac1.deposit(5000); 
		ac1.getBal();
		ac1.withdraw(3000); 
		ac1.getBal();
		System.out.println("은행계좌:" + ac1.accountNo + " 성함:" + ac1.ownerName + " 잔액:" + ac1.balance );
		
		ac2.deposit(15000); 
		ac2.getBal();
		ac2.withdraw(43000); 
		ac2.getBal();
		System.out.println("은행계좌:" + ac2.accountNo + " 성함:" + ac2.ownerName + " 잔액:" + ac2.balance );
		
		ac3.deposit(12000); 
		ac3.getBal();
		ac3.withdraw(41000); 
		ac3.getBal();
		System.out.println("은행계좌:" + ac3.accountNo + " 성함:" + ac3.ownerName + " 잔액:" + ac3.balance );
	}
}
