package ch09;

class Point3D {
	int x, y, z;

	public Point3D(int x, int y, int z) { // 멤버변수 3개 받아서
		this.x = x; // 대입
		this.y = y;
		this.z = z;

	}

	@Override
	public String toString() {
		return "[x=" + x + ", y = " + y + " ,z= " + z + "]"; // toString을 오버라이딩해서 주소값이 아니라 각 값을 String으로 리턴하도록 함

	}
	
	public boolean equals(Point3D pd) { // 재정의한 equals() 메소드 
		boolean result = false;
		if (x == pd.x && y == pd.y) {
			result = true;
		}
		return result;
	}

}

public class Ex01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Point3D pd1 = new Point3D(1, 2, 3); // 객체안에 class, instance 존재
		// class는 메모리도 갖지 않고 수행도 되지 않는 설계도
		// instance는 클래스를 기반으로 new [ㅌㅌ] 해서 실제로 메모리상에 값을 가진 객체(이게 선언한 변수에 들어감)
		Point3D pd2 = new Point3D(1, 2, 3);
		Point3D pd3 = new Point3D(1, 2, 5);

		if (pd1.equals(pd2)) {
			System.out.println("같다");
		} else {
			System.out.println("다르다"); // equals 함수를 수정했으므로 값이 같으면 같다고 반환하므로 '같다' 출력 
		}
		if (pd1.equals(pd3)) {
			System.out.println("같다"); // 마찬가지로 함수 수정되었으므로 같다고 반환됨 
		} else {
			System.out.println("다르다");
		}
		System.out.println(pd1);

		System.out.println(pd3);
/*
		같다
		같다
		[x=1, y = 2 ,z= 3]
		[x=1, y = 2 ,z= 5]*/


	}

}
