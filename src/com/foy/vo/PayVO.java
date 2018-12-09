package com.foy.vo;

public class PayVO {
	private String pay_id, pay_tot_price, pay_date, user_id, pay_p_name, user_payment, user_name, user_addr, user_phone;

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
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

	public String getPay_id() {
		return pay_id;
	}

	public void setPay_id(String pay_id) {
		this.pay_id = pay_id;
	}

	public String getPay_tot_price() {
		return pay_tot_price;
	}

	public void setPay_tot_price(String pay_tot_price) {
		this.pay_tot_price = pay_tot_price;
	}

	public String getPay_date() {
		return pay_date;
	}

	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPay_p_name() {
		return pay_p_name;
	}

	public void setPay_p_name(String pay_p_name) {
		this.pay_p_name = pay_p_name;
	}

	public String getUser_payment() {
		return user_payment;
	}

	public void setUser_payment(String user_payment) {
		this.user_payment = user_payment;
	}

	@Override
	public String toString() {
		return "PayVO [pay_id=" + pay_id + ", pay_tot_price=" + pay_tot_price + ", pay_date=" + pay_date + ", user_id="
				+ user_id + ", pay_p_name=" + pay_p_name + ", user_payment=" + user_payment + ", user_name=" + user_name
				+ ", user_addr=" + user_addr + ", user_phone=" + user_phone + "]";
	}

}