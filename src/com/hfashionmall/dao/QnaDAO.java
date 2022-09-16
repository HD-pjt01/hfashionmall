﻿package com.hfashionmall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBManager;

import com.hfashionmall.dto.MemberVO;
import com.hfashionmall.dto.QnaVO;

public class QnaDAO {

  private QnaDAO() {
  }

  private static QnaDAO instance = new QnaDAO();

  public static QnaDAO getInstance() {
    return instance;
  }

  public ArrayList<QnaVO> listQna(String qna_sequence) {
    ArrayList<QnaVO> qnaList = new ArrayList<QnaVO>();
    String sql = "select * from qna order by qna_sequence desc";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
      conn = DBManager.getConnection();
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        QnaVO qnaVO = new QnaVO();
        qnaVO.setQna_sequence(rs.getInt("qna_sequence"));
        qnaVO.setQna_subject(rs.getString("qna_subject"));
        qnaVO.setQna_content(rs.getString("qna_content"));
        qnaVO.setQna_answer(rs.getString("qna_answer"));
        qnaVO.setQna_register(rs.getTimestamp("qna_register"));
        qnaVO.setQna_classification(rs.getString("qna_classification"));
        qnaVO.setMember_member_id(rs.getString("member_member_id"));
        qnaList.add(qnaVO);
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return qnaList;
  }

  public QnaVO getQna(int qna_sequence) {
    QnaVO qnaVO = null;
    String sql = "select * from qna where qna_sequence=?";
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
      conn = DBManager.getConnection();
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, qna_sequence);
      rs = pstmt.executeQuery();
      if (rs.next()) {
        qnaVO = new QnaVO();
        qnaVO.setQna_sequence(rs.getInt("qna_sequence"));
        qnaVO.setQna_subject(rs.getString("qna_subject"));
        qnaVO.setQna_content(rs.getString("qna_content"));
        qnaVO.setQna_answer(rs.getString("qna_answer"));
        qnaVO.setQna_register(rs.getTimestamp("qna_register"));
        qnaVO.setQna_classification(rs.getString("qna_classification"));
        qnaVO.setMember_member_id(rs.getString("member_member_id"));
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      DBManager.close(conn, pstmt);
    }
    return qnaVO;
  }

  public void insertqna(QnaVO qnaVO, String member_id) {
    String sql = "insert into qna values (qna_seq.nextval, ?, ?, 'no', sysdate, 'brand-class-kind', ?)";
    String commit = "commit";
    // qna_answer -> default 'no'
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    PreparedStatement pstmt_2 = null;
    try {
      conn = DBManager.getConnection();
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, qnaVO.getQna_subject());
      pstmt.setString(2, qnaVO.getQna_content());
      pstmt.setString(3, member_id);
      pstmt.executeUpdate();
      pstmt_2 = conn.prepareStatement(commit);
      pstmt_2.executeUpdate();
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      DBManager.close(conn, pstmt);
      DBManager.close(conn, pstmt_2);
    }
  }

  /* *
   * 관리자 모드에서 필요한 메소드
   */
  public ArrayList<QnaVO> listAllQna() {
    ArrayList<QnaVO> qnaList = new ArrayList<QnaVO>();
    // 게시판의 데이터를 가지고 오는 쿼리 rep:1:게시물 2: 답변
    String sql = "select * from qna order by qna_register desc";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
      conn = DBManager.getConnection();
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        QnaVO qnaVO = new QnaVO();
        qnaVO.setQna_sequence(rs.getInt("qna_sequence"));
        qnaVO.setQna_subject(rs.getString("qna_subject"));
        qnaVO.setQna_content(rs.getString("qna_content"));
        qnaVO.setQna_answer(rs.getString("qna_answer"));
        qnaVO.setQna_register(rs.getTimestamp("qna_register"));
        qnaVO.setQna_classification(rs.getString("qna_classification"));
        qnaVO.setMember_member_id(rs.getString("member_member_id"));
        qnaList.add(qnaVO);
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return qnaList;
  }

  public void updateQna(QnaVO qnaVO) {
    String sql = "update qna set qna_answer=? where qna_sequence=?";

    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
      conn = DBManager.getConnection();
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, qnaVO.getQna_answer());
      pstmt.setInt(2, qnaVO.getQna_sequence());      
      pstmt.executeUpdate();
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      DBManager.close(conn, pstmt);
    }
  }
}
