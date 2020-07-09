package ch07;

public class Person2 {
    private String name;
    private int    age;
	
    Person2(String name, int age) {
    	this.name   = name;
    	this.age    = age;
    };
	public void print() {
		System.out.println("---------------");
		System.out.println("이름:" + name);
		System.out.println("나이:" + age);
	}
	
    public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
     
}
