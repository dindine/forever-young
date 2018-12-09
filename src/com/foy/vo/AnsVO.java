package com.foy.vo;

public class AnsVO {
	private String c_idx;
	private String writer;
	private String content;
	private String pwd;
	private String write_date;
	private String b_idx;
	
	private String p_no;

	public String getC_idx() {
		return c_idx;
	}

	public void setC_idx(String c_idx) {
		this.c_idx = c_idx;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	public String getB_idx() {
		return b_idx;
	}

	public void setB_idx(String b_idx) {
		this.b_idx = b_idx;
	}
	
	

	public String getP_no() {
		return p_no;
	}

	public void setP_no(String p_no) {
		this.p_no = p_no;
	}

	@Override
	public String toString() {
		return "AnsVO [c_idx=" + c_idx + ", writer=" + writer + ", content=" + content + ", pwd=" + pwd
				+ ", write_date=" + write_date + ", b_idx=" + b_idx + ", p_no=" + p_no + "]";
	}



}
