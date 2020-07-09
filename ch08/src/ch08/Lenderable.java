package ch08;

public interface Lenderable {
	   int BORROW = 1;
	   int NORMAL = 0;
	   void checkOut(String borrower, String date);
	   void checkin();
}
class SeperateVolume implements Lenderable {
	String  title;
	String  date;
	String  borrower;
	int     status;
	
	SeperateVolume(String title) {
		this.title = title;
	}
	public void checkOut(String borrower, String date) {
		// TODO Auto-generated method stub
		if (status != NORMAL) return;
		this.date     =  date;
		this.borrower =  borrower; 
		status        =  BORROW;
		// BORROW = 1;  안됨 
		System.out.println(borrower +"가 " +date+"일에 " +title+"을 대여했다");
	}

	@Override
	public void checkin() {
		// TODO Auto-generated method stub
		if (status != BORROW) return;
		System.out.println(borrower +"가 " +title+"을 반납했다");
		date    = null;    
		title    = null;
		borrower = null; 
		status   = NORMAL;
	}
	
}