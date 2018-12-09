package com.foy.vo;

public class CartVO {
	private String user_id, p_no, cart_price, cart_image, cart_idx, cart_tot_price, p_name, p_saleprice, p_opt_no, p_opt_name ;
	private int cart_cnt;
	
	
	public String getP_opt_no() {
		return p_opt_no;
	}

	public void setP_opt_no(String p_opt_no) {
		this.p_opt_no = p_opt_no;
	}

	public String getP_opt_name() {
		return p_opt_name;
	}

	public void setP_opt_name(String p_opt_name) {
		this.p_opt_name = p_opt_name;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_saleprice() {
		return p_saleprice;
	}

	public void setP_saleprice(String p_saleprice) {
		this.p_saleprice = p_saleprice;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getP_no() {
		return p_no;
	}

	public void setP_no(String p_no) {
		this.p_no = p_no;
	}

	public String getCart_price() {
		return cart_price;
	}

	public void setCart_price(String cart_price) {
		this.cart_price = cart_price;
	}

	public String getCart_image() {
		return cart_image;
	}

	public void setCart_image(String cart_image) {
		this.cart_image = cart_image;
	}

	public String getCart_idx() {
		return cart_idx;
	}

	public void setCart_idx(String cart_idx) {
		this.cart_idx = cart_idx;
	}

	public int getCart_cnt() {
		return cart_cnt;
	}

	public void setCart_cnt(int cart_cnt) {
		this.cart_cnt = cart_cnt;

	}
	
	
	public String getCart_tot_price() {
		return cart_tot_price;
	}

	public void setCart_tot_price(String cart_tot_price) {
		this.cart_tot_price = cart_tot_price;
	}

	@Override
	public String toString() {
		return "CartVO [user_id=" + user_id + ", p_no=" + p_no + ", cart_price=" + cart_price + ", cart_image="
				+ cart_image + ", cart_idx=" + cart_idx + ", cart_tot_price=" + cart_tot_price + ", p_name=" + p_name
				+ ", p_saleprice=" + p_saleprice + ", p_opt_no=" + p_opt_no + ", p_opt_name=" + p_opt_name
				+ ", cart_cnt=" + cart_cnt + "]";
	}
	
	
	
	
	
	
}
