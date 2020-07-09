package ch08;

public class SalaryMan extends Employee {
	 private int annualSalary;
     public  int getAnnualSalary() {
		return annualSalary;
	}
	public void setAnnualSalary(int annualSalary) {
		this.annualSalary = annualSalary;
	}
	SalaryMan(String name , int annualSalary) {
    	 super(name);
    	 this.annualSalary = annualSalary;
	} 
	public int computePay() {
		return annualSalary/12;
	}
	//public int computeIncentive() {} // -> final 재정의 금지
}

class HourlyMan extends Employee {
	private int hour,  perHour;
	HourlyMan(String name, int hour , int perHour) {
		super(name);
		this.hour = hour;
		this.perHour = perHour;
	}
	
	public int computePay() {
		    System.out.println( "시간 : " +hour+" , 시급 : " +perHour);
		 return hour * perHour;
	}
	public void display() {
		System.out.println("시간 : " +hour+" ,단가 : " + perHour);
	}
}
