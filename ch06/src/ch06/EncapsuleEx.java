package ch06;

class H1 {
	private  String name;
	private  int    age;

//	H1(String name, int age) {
//		this.name = name;
//		this.age  = age;
//	}
	public String getName() {
		return name;
	}
	public int getAge() {
		return age;
	} 

	public void setName(String name) {
		this.name = name;
	}
	public void setAge(int age) {
		if (age < 0 )  System.out.println("나이입력오류  ㅎㅎㅎ");
		else this.age = age;
	}
}
	
public class EncapsuleEx {
      public static void main(String[] args) {
  		H1 h1 = new H1();
	//	H1 h1 = new H1("김준수", -10);
	//	h1.name = "김준수";
		h1.setName( "김준수") ;
		h1.setAge ( -10) ;
		System.out.println("이름 : " + h1.getName());
		System.out.println("나이 : " + h1.getAge());
	}
}
