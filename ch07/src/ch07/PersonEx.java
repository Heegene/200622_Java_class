package ch07;

class Manager extends Person {
	private String part;
	Manager ( String name , int age, String part) {
		setName(name);
		setAge(age);
		this.part = part;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
    public void printMg() {
    	print();
    	System.out.println("담당 " + part);
    }
}
    
public class PersonEx {
    public static void main(String[] args) {
		Student st1 = new Student("옥주현", 23, "1234");
		Teacher th1 = new Teacher("배용준", 38, "Java");
		Manager mg1 = new Manager("정우성", 29, "청소");
		st1.printSt();
		th1.printTH();
		mg1.printMg();
		
	}
}
