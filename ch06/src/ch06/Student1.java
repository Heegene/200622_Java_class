package ch06;

public class Student1 {
	String name;
	int kor;
	int eng;
	int math;
	
	public Student1() {}
	public Student1 (String n,int k,int e,int m) {
		name = n;
		kor  = k;
		eng  = e;
		math = m;
	}
	int getTotal() {
		return kor+eng+math;
	}
	float getAverage() {
		return ((float)kor+eng+math)/3.0f;
	}
	void print() {
		System.out.println(name+", " +getTotal() + " , " + getAverage());;
	}
	
	public static void main(String[] args) {
		Student1 st1 = new Student1 ();
		st1.name ="소현";
		st1.kor  = 80;
		st1.eng  = 80;
		st1.math  = 80;
		Student1 st2 = new Student1("임경업",78,89,98);
		Student1 st3 = new Student1("전지현",50,60,70);
		System.out.println(st1.name + ", " +st1.getTotal() + " , " + st1.getAverage());
	    st2.print();			
	    st3.print();			
		
	}
}
