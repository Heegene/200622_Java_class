package ch08;

//import ch08.Manager2;

public class EmployeeEx {
	public static void main(String[] args) {
		Employee[] emp = new Employee[5];
		emp[0] = new SalaryMan("길동", 200000);
		emp[1] = new SalaryMan("수지", 500000);
		emp[2] = new HourlyMan("효린", 10,5000);
		emp[3] = new HourlyMan("아유", 2,5000);
		emp[4] = new SalaryMan("명수", 2000000);
		for ( Employee e  : emp ) {
			e.computeIncentive();
			e.print();
			// 시급인 경우 근무시간과 시급출력 
			if ( e instanceof HourlyMan) {
				((HourlyMan)e).display();
			}

		}
	}

}
