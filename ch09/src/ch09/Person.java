package ch09;

public class Person {
	
	int id;
	String name;
	public Person (int id, String name) {
		this.id = id;
		this.name = name;
	}
	
	
//	public boolean equals(Person pd) {
//		boolean result = false;
//		if (name.equals(pd.name)) {
//			result = true;
//		} else {
//			result = false;
//		}
//		return result;
//		
//	}
	
	@Override
	public boolean equals(Object obj) {
		boolean b = false;
		Person p = null;
		if (obj instanceof Person) {
			p = (Person) obj;
		}
		if(obj != null && id==p.id) {
			b = true;
		}
		return b;
	}
	

}
