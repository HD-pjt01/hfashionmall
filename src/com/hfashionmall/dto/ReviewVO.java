package com.hfashionmall.dto;

import java.sql.Timestamp;

public class ReviewVO {

	private int od_id; //PRIMARY
	private String review_content;
	private Timestamp review_register;

	private String review_ofile;
	private String review_sfile;
	private int visitcount;
	private String member_id;
	private String mname;
	private String product_code;
	private String pname;
	private String od_result;
	private String review_result;
	

	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	
	public Timestamp getReview_register() {
		return review_register;
	}
	public void setReview_register(Timestamp review_register) {
		this.review_register = review_register;
	}
	public String getReview_ofile() {
		return review_ofile;
	}
	public void setReview_ofile(String review_ofile) {
		this.review_ofile = review_ofile;
	}
	public String getReview_sfile() {
		return review_sfile;
	}
	public void setReview_sfile(String review_sfile) {
		this.review_sfile = review_sfile;
	}
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	public int getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(int visitcount) {
		this.visitcount = visitcount;
	}
	public int getOd_id() {
		return od_id;
	}
	public void setOd_id(int od_id) {
		this.od_id = od_id;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getOd_result() {
		return od_result;
	}
	public void setOd_result(String od_result) {
		this.od_result = od_result;
	}
	public String getReview_result() {
		return review_result;
	}
	public void setReview_result(String review_result) {
		this.review_result = review_result;
	}
	


	
}
