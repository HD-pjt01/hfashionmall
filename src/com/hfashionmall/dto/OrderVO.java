package com.hfashionmall.dto;

import java.sql.Timestamp;

public class OrderVO {
	private int order_detail_id;
	private int order_id;

	private String member_member_id;
	private Timestamp order_register;
	private String product_code;
	private int product_count;
	private String mname; // 유저 이름
	private String zipcode;
	private String addr;
	private String phone;

	private String pname;

	private int price;
	private String order_detail_result;
	
	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public int getOrder_detail_id() {
		return order_detail_id;
	}

	public void setOrder_detail_id(int order_detail_id) {
		this.order_detail_id = order_detail_id;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getProduct_count() {
		return product_count;
	}

	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getOrder_detail_result() {
		return order_detail_result;
	}

	public void setOrder_detail_result(String order_detail_result) {
		this.order_detail_result = order_detail_result;
	}

	public Timestamp getOrder_register() {
		return order_register;
	}

	public void setOrder_register(Timestamp order_register) {
		this.order_register = order_register;
	}

	public String getMember_member_id() {
		return member_member_id;
	}

	public void setMember_member_id(String member_member_id) {
		this.member_member_id = member_member_id;
	}

	@Override
	public String toString() {
		return "OrderVO [order_id=" + order_id + ", order_register=" + order_register + ", member_member_id="
				+ member_member_id + "]";
	}

	public String getProduct_code() {
		return product_code;
	}

	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}

}
