package com.foy.vo;

public class ProductVO {
	private String num, p_no, p_name, p_ori_image, p_new_image, p_content, p_category;
	private int p_price, p_saleprice, p_salerate;
	
	public int getPercent() {
		double persent = (p_price - p_saleprice) * 100 / p_price;
		
		return (int)persent;
	}
	
	
	public int getP_salerate() {
		return p_salerate;
	}


	public void setP_salerate(int p_salerate) {
		this.p_salerate = p_salerate;
	}


	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getP_no() {
		return p_no;
	}
	public void setP_no(String p_no) {
		this.p_no = p_no;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_ori_image() {
		return p_ori_image;
	}
	public void setP_ori_image(String p_ori_image) {
		this.p_ori_image = p_ori_image;
	}
	public String getP_new_image() {
		return p_new_image;
	}
	public void setP_new_image(String p_new_image) {
		this.p_new_image = p_new_image;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public String getP_category() {
		return p_category;
	}
	public void setP_category(String p_category) {
		this.p_category = p_category;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getP_saleprice() {
		return p_saleprice;
	}
	public void setP_saleprice(int p_saleprice) {
		this.p_saleprice = p_saleprice;
	}


	@Override
	public String toString() {
		return "ProductVO [num=" + num + ", p_no=" + p_no + ", p_name=" + p_name + ", p_ori_image=" + p_ori_image
				+ ", p_new_image=" + p_new_image + ", p_content=" + p_content + ", p_category=" + p_category
				+ ", p_price=" + p_price + ", p_saleprice=" + p_saleprice + ", p_salerate=" + p_salerate + "]";
	}


}