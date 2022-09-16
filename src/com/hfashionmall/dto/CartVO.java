package com.hfashionmall.dto;

import java.sql.Timestamp;

public class CartVO {

	private int cart_id;
	private String member_member_id;
	private String product_product_code;
	private String mname;
	private String pname;
	private int product_count;
	private int product_price;
	private Timestamp cart_register;
	
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public String getMember_member_id() {
		return member_member_id;
	}
	public void setMember_member_id(String member_member_id) {
		this.member_member_id = member_member_id;
	}
	public String getProduct_product_code() {
		return product_product_code;
	}
	public void setProduct_product_code(String product_product_code) {
		this.product_product_code = product_product_code;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
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
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public Timestamp getCart_register() {
		return cart_register;
	}
	public void setCart_register(Timestamp cart_register) {
		this.cart_register = cart_register;
	}
	@Override
	public String toString() {
		return "CartVO [cart_id=" + cart_id + ", member_member_id=" + member_member_id + ", product_product_code="
				+ product_product_code + ", mname=" + mname + ", pname=" + pname + ", product_count=" + product_count
				+ ", product_price=" + product_price + ", cart_register=" + cart_register + "]";
	}
	
	


	

}
