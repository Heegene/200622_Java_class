package ch06;

class D1 {
	void hi (int cnt) {
		System.out.println("안녕, 나야 !!   cnt-->" + cnt);
		if ( cnt < 1 ) return;
		hi(--cnt);
	}
}
public class HiEx {
    public static void main (String[] args) {
    	D1 d = new D1();
    	d.hi(6);
    }
}
