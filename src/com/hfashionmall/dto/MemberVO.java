package com.hfashionmall.dto;

import java.sql.Timestamp;

public class MemberVO {
	private String member_id; // varchar2(20)
	private String member_pw; // varchar2(20)
	private String member_name; // varchar2(20)
	private String member_addr; // varchar2(100)
	private String member_phone; // varchar2(20)
	private String member_email; // varchar2(20)
	private String member_zipcode; // varchar2(20)
	//우편 번호
	private Timestamp member_register; // date
	private String member_useYN; // char(1)
	//탈퇴 여부
	private String member_birth; // varchar2(20)
	private Timestamp member_update; // date
  
  
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_addr() {
		return member_addr;
	}
	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_zipcode() {
		return member_zipcode;
	}
	public void setMember_zipcode(String member_zipcode) {
		this.member_zipcode = member_zipcode;
	}
	public Timestamp getMember_register() {
		return member_register;
	}
	public void setMember_register(Timestamp member_register) {
		this.member_register = member_register;
	}
	public String getMember_useYN() {
		return member_useYN;
	}
	public void setMember_useYN(String member_useYN) {
		this.member_useYN = member_useYN;
	}
	public String getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}
	public Timestamp getMember_update() {
		return member_update;
	}
	public void setMember_update(Timestamp member_update) {
		this.member_update = member_update;
	}
  
  
  
}
