package com.hfashionmall.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBManager;

import com.hfashionmall.dto.MemberVO;
import com.hfashionmall.dto.QnaVO;

import oracle.jdbc.OracleTypes;

/**
 * 수정자              수정내용
 * -----------       -------------------------------
 * 정승하, 심지연        QnaDAO 작성 및 수정
 */
public class QnaDAO {

	private QnaDAO() {
	}

	private static QnaDAO instance = new QnaDAO();

	public static QnaDAO getInstance() {
		return instance;
	}

	public ArrayList<QnaVO> listQna(String qna_sequence) {
		ArrayList<QnaVO> qnaList = new ArrayList<QnaVO>();
		String sql = "{call sp_listQna_select(?)}";

		Connection conn = null;
		CallableStatement cstmt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			cstmt = conn.prepareCall(sql);
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			rs = cstmt.executeQuery();
			rs = (ResultSet) cstmt.getObject(1);
			while (rs.next()) {
				QnaVO qnaVO = new QnaVO();
				qnaVO.setQna_sequence(rs.getInt("qna_sequence"));
				qnaVO.setQna_subject(rs.getString("qna_subject"));
				qnaVO.setQna_content(rs.getString("qna_content").replace("\r\n", "<br>"));
				qnaVO.setQna_answer(rs.getString("qna_answer").replace("\r\n", "<br>"));
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

	public ArrayList<QnaVO> listMyQna(String member_member_id) {
		ArrayList<QnaVO> qnaList = new ArrayList<QnaVO>();
		String sql = "select * from qna where member_member_id=? order by qna_register desc";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_member_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				QnaVO qnaVO = new QnaVO();
				qnaVO.setQna_sequence(rs.getInt("qna_sequence"));
				qnaVO.setQna_subject(rs.getString("qna_subject"));
				qnaVO.setQna_content(rs.getString("qna_content").replace("\r\n", "<br>"));
				qnaVO.setQna_answer(rs.getString("qna_answer").replace("\r\n", "<br>"));
				qnaVO.setQna_register(rs.getTimestamp("qna_register"));
				qnaVO.setQna_classification(rs.getString("qna_classification"));
				qnaVO.setMember_member_id(rs.getString("member_member_id"));
				qnaList.add(qnaVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return qnaList;
	}

	public QnaVO getQna(int qna_sequence) {
		QnaVO qnaVO = null;
		String sql = "{call sp_getQna_select(?, ?)}";
		Connection conn = null;
		CallableStatement cstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, qna_sequence);
			rs = cstmt.executeQuery();
			if (rs.next()) {
				qnaVO = new QnaVO();
				qnaVO.setQna_sequence(rs.getInt("qna_sequence"));
				qnaVO.setQna_subject(rs.getString("qna_subject"));
				qnaVO.setQna_content(rs.getString("qna_content").replace("\r\n", "<br>"));
				qnaVO.setQna_answer(rs.getString("qna_answer").replace("\r\n", "<br>"));
				qnaVO.setQna_register(rs.getTimestamp("qna_register"));
				qnaVO.setQna_classification(rs.getString("qna_classification"));
				qnaVO.setMember_member_id(rs.getString("member_member_id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt);
		}
		return qnaVO;
	}

	public void insertqna(QnaVO qnaVO, String session_id) {
		String sql = "insert into qna values (qna_seq.nextval, ?, ?, 'no', sysdate, ?, ?)";

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			System.out.println(qnaVO.getQna_subject() + "!!!" + qnaVO.getQna_content() + "!!!"
					+ qnaVO.getQna_classification() + "!!!" + session_id);
			pstmt.setString(1, qnaVO.getQna_subject());
			pstmt.setString(2, qnaVO.getQna_content());
			pstmt.setString(3, qnaVO.getQna_classification());
			pstmt.setString(4, session_id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	/*
	 * * 관리자 메서드 정의
	 */
	public ArrayList<QnaVO> listAllQna() {
		ArrayList<QnaVO> qnaList = new ArrayList<QnaVO>();
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
				qnaVO.setQna_content(rs.getString("qna_content").replace("\r\n", "<br>"));
				qnaVO.setQna_answer(rs.getString("qna_answer").replace("\r\n", "<br>"));
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