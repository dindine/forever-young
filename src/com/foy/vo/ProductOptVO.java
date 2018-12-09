package com.foy.vo;

public class ProductOptVO {
	private String p_no, p_op_content, p_op_cnt, p_op_no;
	
	

	public String getP_op_no() {
		return p_op_no;
	}

	public void setP_op_no(String p_op_no) {
		this.p_op_no = p_op_no;
	}

	public String getP_no() {
		return p_no;
	}

	public void setP_no(String p_no) {
		this.p_no = p_no;
	}

	public String getP_op_content() {
		return p_op_content;
	}

	public void setP_op_content(String p_op_content) {
		this.p_op_content = p_op_content;
	}

	public String getP_op_cnt() {
		return p_op_cnt;
	}

	public void setP_op_cnt(String p_op_cnt) {
		this.p_op_cnt = p_op_cnt;
	}

	@Override
	public String toString() {
//		return "ProductOptVO [p_no=" + p_no + ", p_op_content=" + p_op_content + ", p_op_cnt=" + p_op_cnt + "]";
		return "[" + p_op_content + "]      수량 : " + p_op_cnt + "개";
	}
	
	
}
