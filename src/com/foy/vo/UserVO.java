package com.foy.vo;

public class UserVO {
	private String user_id, user_pw, user_name, user_addr, user_phone, user_email, user_grade;
	private int user_point, user_coupon_cnt;
	
	public UserVO() {
		super();

	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_addr() {
		return user_addr;
	}

	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_grade() {
		return user_grade;
	}

	public void setUser_grade(String user_grade) {
		this.user_grade = user_grade;
	}

	public int getUser_point() {
		return user_point;
	}

	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}

	public int getUser_coupon_cnt() {
		return user_coupon_cnt;
	}

	public void setUser_coupon_cnt(int user_coupon_cnt) {
		this.user_coupon_cnt = user_coupon_cnt;
	}

	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name + ", user_addr="
				+ user_addr + ", user_phone=" + user_phone + ", user_email=" + user_email + ", user_grade=" + user_grade
				+ ", user_point=" + user_point + ", user_coupon_cnt=" + user_coupon_cnt + "]";
	}



 
	
}
