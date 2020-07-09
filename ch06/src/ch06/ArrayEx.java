package ch06;

class Array {
	void print(int[] arr) {
		for (int  i = 0 ; i < arr.length; i ++ ) {
			arr[i] = 10 + i;
		}
		for (int  i = 0 ; i < arr.length; i ++) {
			System.out.print(arr[i] +"\t");
		}
		System.out.println();
		System.out.println("----------------------------------");
	}
}
public class ArrayEx {
	public static void main(String[] args) {
		Array ar = new Array();   // 배열 객체 선언
		int[] arr = new int[5];   // arr 을 int 배열 선언 
		for( int  i = 0; i < arr.length; i ++ ) {
			System.out.print(arr[i] +"\t");
		}
		System.out.println();
		System.out.println("----------------------------------");;
		
		ar.print(arr);
		for( int  i = 0; i < arr.length; i ++ ) {
			System.out.print(arr[i] +"\t");
		}
		System.out.println();
	}

}
