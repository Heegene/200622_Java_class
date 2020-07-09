package ch07;

class AA {
	int i;
	private int j; // 객체 변수 j를 private로 선언

	void setij(int x, int y) {
		i = x;
		j = y;
	}
}

class BB extends AA {
	int total;

	void sum() { // 오류 발생 BB
	//	total = i + j;
	//	total = 
	}
}

public class InheritanceTest2 {
	public static void main(String args[]) {
		BB subOb = new BB();
		subOb.sum();
	}
}
