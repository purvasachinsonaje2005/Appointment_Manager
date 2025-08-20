package ds.appointment_manager.db;

public class Emp {
	static int eid;
	static String email;

	public static String getEmail() {
		return email;
	}

	public static void setEmail(String email) {
		Emp.email = email;
	}

	public static int getEid() {
		return eid;
	}

	public static void setEid(int eid) {
		Emp.eid = eid;
	}

}
