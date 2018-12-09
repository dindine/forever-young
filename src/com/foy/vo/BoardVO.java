package com.foy.vo;

public class BoardVO {
	private String b_idx, b_subject, b_writer, b_content, star
	, b_file_name, b_pwd, b_write_date, b_hit, b_ori_name, p_no, user_grade, good, bad;
	
	
	public String tot_cnt() {
		int tot_cnt = Integer.parseInt(good) + Integer.parseInt(bad);
		return String.valueOf(tot_cnt);
	}
	public String getStar() {
		return star;
	}

	public void setStar(String star) {
		this.star = star;
	}

	public BoardVO() {}

	public String getGood() {
		return good;
	}

	public void setGood(String good) {
		this.good = good;
	}

	public String getBad() {
		return bad;
	}

	public void setBad(String bad) {
		this.bad = bad;
	}

	public BoardVO(String b_idx, String b_subject, String b_writer, String b_content, String b_file_name, String b_pwd,
			String b_write_date, String b_hit, String b_ori_name, String p_no) {
		super();
		this.b_idx = b_idx;
		this.b_subject = b_subject;
		this.b_writer = b_writer;
		this.b_content = b_content;
		this.b_file_name = b_file_name;
		this.b_pwd = b_pwd;
		this.b_write_date = b_write_date;
		this.b_hit = b_hit;
		this.b_ori_name = b_ori_name;
		this.p_no = p_no;
	}





	public String getUser_grade() {
		return user_grade;
	}

	public void setUser_grade(String user_grade) {
		this.user_grade = user_grade;
	}

	public String getP_no() {
		return p_no;
	}

	public void setP_no(String p_no) {
		this.p_no = p_no;
	}

	public String getB_ori_name() {
		return b_ori_name;
	}

	public void setB_ori_name(String b_ori_name) {
		this.b_ori_name = b_ori_name;
	}

	public String getB_idx() {
		return b_idx;
	}

	public void setB_idx(String b_idx) {
		this.b_idx = b_idx;
	}

	public String getB_subject() {
		return b_subject;
	}

	public void setB_subject(String b_subject) {
		this.b_subject = b_subject;
	}

	public String getB_writer() {
		return b_writer;
	}

	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_file_name() {
		return b_file_name;
	}

	public void setB_file_name(String b_file_name) {
		this.b_file_name = b_file_name;
	}

	public String getB_pwd() {
		return b_pwd;
	}

	public void setB_pwd(String b_pwd) {
		this.b_pwd = b_pwd;
	}

	public String getB_write_date() {
		return b_write_date;
	}

	public void setB_write_date(String b_write_date) {
		this.b_write_date = b_write_date;
	}

	public String getB_hit() {
		return b_hit;
	}

	public void setB_hit(String b_hit) {
		this.b_hit = b_hit;
	}

	@Override
	public String toString() {
		return "BoardVO [b_idx=" + b_idx + ", b_subject=" + b_subject + ", b_writer=" + b_writer + ", b_content="
				+ b_content + ", star=" + star + ", b_file_name=" + b_file_name + ", b_pwd=" + b_pwd + ", b_write_date="
				+ b_write_date + ", b_hit=" + b_hit + ", b_ori_name=" + b_ori_name + ", p_no=" + p_no + ", user_grade="
				+ user_grade + ", good=" + good + ", bad=" + bad + "]";
	}




	
	
	
	
}
