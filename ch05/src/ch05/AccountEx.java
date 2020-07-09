package ch05;

 class Account {
	String  account;
	String  name;
	int     balance;
	
	 public Account(String acc, String n, int bal) {
		account = acc;
		name = n;
		balance = bal;
	}
	// 저축
	void   deposit(int amt) {
		   balance += amt;
	}
	// 인출 
	void withdraw(int amt) {
		if (balance < amt) {
			System.out.println(name + " 잔고 부족  ");
		}
		else {
			balance -= amt; 
		}
	}
	void preBalance() {
		System.out.println(name + "  현재 잔액은 " + balance);
		
	}
}

public class AccountEx {
	public static void main(String[] args) {
		Account ac1 = new Account("신한1","이성계",1500);
		Account ac2 = new Account("국민2","강감찬",7000);
		ac1.deposit(3000); 
		ac1.withdraw(5000); 
		ac1.preBalance();
		ac2.deposit(5000); 
		ac2.withdraw(7000); 
		ac2.preBalance();
	}

}
