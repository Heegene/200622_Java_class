package ch07;

public class Student2 extends Person2 {
	private String sno;
	Student2(String name, int age , String  sno) {
	// TODO Auto-generated constructor stub
		super(name,age);
		this.sno  = sno;
    }
	public void print() {
		super.print();
		System.out.println("학번 :" +sno);
	}
	
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}

}

class Teacher2 extends Person2 {
    private String subject;
	Teacher2(String name, int age, String subject) {
		super(name, age);
		this.subject = subject;
	}
	public void print() {
		// TODO Auto-generated method stub
		super.print();
		System.out.println("과목 : " + subject);
	}
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}


}

class Manager2 extends Person2 {

	private String part;
	Manager2(String name, int age , String part) {
		super(name, age);
		this.part = part;
		// TODO Auto-generated constructor stub
	}
	public void print() {
		super.print();
		System.out.println("담당 : " + part);
	}
	
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	

}