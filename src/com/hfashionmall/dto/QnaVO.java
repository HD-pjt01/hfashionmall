package com.hfashionmall.dto;

import java.sql.Timestamp;
/**
 * 수정자              수정내용
 * -----------       -------------------------------
 * 정승하              QnaVO 정의
 */
public class QnaVO {
	private int   qna_sequence; 
	private String qna_subject; // 제목 not null
	private String qna_content; // 본문
	private String qna_answer;  // 답변
	private Timestamp qna_register; // 등록일
	private String qna_classification; // 
	private String member_member_id; // QnA하는 멤버 아이디
	
	public int getQna_sequence() {
		return qna_sequence;
	}
	public void setQna_sequence(int qna_sequence) {
		this.qna_sequence = qna_sequence;
	}
	public String getQna_subject() {
		return qna_subject;
	}
	public void setQna_subject(String qna_subject) {
		this.qna_subject = qna_subject;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_answer() {
		return qna_answer;
	}
	public void setQna_answer(String qna_answer) {
		this.qna_answer = qna_answer;
	}
	public Timestamp getQna_register() {
		return qna_register;
	}
	public void setQna_register(Timestamp qna_register) {
		this.qna_register = qna_register;
	}
	public String getQna_classification() {
		return qna_classification;
	}
	public void setQna_classification(String qna_classification) {
		this.qna_classification = qna_classification;
	}
	public String getMember_member_id() {
		return member_member_id;
	}
	public void setMember_member_id(String member_member_id) {
		this.member_member_id = member_member_id;
	}
}
