package ch07;

public class Student extends Person{
	private String   sno;
    public  Student(String name, int age, String sno) {
	        setName(name);
	        setAge(age);
	        this.sno = sno;
    }
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public void printSt() {
		print();
		System.out.println("학년 : " +sno);
	}
}

class Teacher extends Person {
	private String subject;
	
	Teacher ( String name , int age, String subject) {
		setName(name);
		setAge(age);
		this.subject = subject;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
    public void printTH() {
    	print();
    	System.out.println("과목 " + subject);
    }
	
}