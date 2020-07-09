package ch05;

public class Car3 {
	String name;
	int    inTime;
	int    outTime;
	int    fee;
	final  int AMTPERTIME = 3000;
	Car3(String n,int in,  int out) {
		name    = n;  
		inTime  = in;
		outTime = out;
	}
    void print() {
    	int fee = ( outTime - inTime) * AMTPERTIME;
    	System.out.println("차  이름 :" + name);
    	System.out.println("입고시간 :" + inTime);
    	System.out.println("출고시간 :" + outTime);
    	System.out.println("주차요금 :" + fee);
    	System.out.println("-------------------------");
    }
}
 