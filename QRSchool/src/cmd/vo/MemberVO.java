package cmd.vo;

public class MemberVO {

	private String member_no;
	private String member_id;
	private String member_password;
	private String member_name;
	private String phone_code;
	private String login_check;
	private String check_grade;
	private String class_code;
	private String check;
	
	

	public String getCheck_grade() {
		return check_grade;
	}
	public void setCheck_grade(String check_grade) {
		this.check_grade = check_grade;
	}
	public String getClass_code() {
		return class_code;
	}
	public void setClass_code(String class_code) {
		this.class_code = class_code;
	}
	public String getCheck() {
		return check;
	}
	public void setCheck(String check) {
		this.check = check;
	}
	public String getMember_no() {
		return member_no;
	}
	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getPhone_code() {
		return phone_code;
	}
	public void setPhone_code(String phone_code) {
		this.phone_code = phone_code;
	}
	public String getLogin_check() {
		return login_check;
	}
	public void setLogin_check(String login_check) {
		this.login_check = login_check;
	}
	@Override
	public String toString() {
		return "MemberVO [member_no=" + member_no + ", member_id=" + member_id + ", member_password=" + member_password
				+ ", member_name=" + member_name + ", phone_code=" + phone_code + ", login_check=" + login_check + "]";
	}
	
	
	
}
