package com.hfashionmall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.hfashionmall.dto.CartVO;
import com.hfashionmall.dto.OrderVO;
import com.hfashionmall.dto.ReviewVO;

import oracle.jdbc.OracleTypes;
import util.DBManager;
import java.util.*;
import java.sql.*;

public class ReviewDAO {
	private ReviewDAO() {
	}

	private static ReviewDAO instance = new ReviewDAO();

	public static ReviewDAO getInstance() {
		return instance;
	}

	// 작성 완료
	public int countTotalReview(String product_code) {
		Connection conn = null;
		// PreparedStatement pstmt = null;
		CallableStatement cstmt = null;
		ResultSet rs = null;

		// String sql = "select count(*) from review_view where product_product_code=?";
		String sql = "{call sp_countTotalReview_select(?, ?)}";

		try {
			conn = DBManager.getConnection();

			cstmt = conn.prepareCall(sql);
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.setString(2, product_code);
			rs = cstmt.executeQuery();
			rs = (ResultSet) cstmt.getObject(1);

			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt);
		}
		return 0;
	}

	// product code로 리뷰 불러오기
	public ArrayList<ReviewVO> findByProd(String product_code) {

		ArrayList<ReviewVO> reviewList = new ArrayList<ReviewVO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from review_view where product_product_code=? order by 3 desc";

		try {
			conn = DBManager.getConnection();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product_code);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ReviewVO reviewVO = new ReviewVO();
				reviewVO.setOd_id(rs.getInt(1));
				reviewVO.setReview_content(rs.getString(2));
				reviewVO.setReview_register(rs.getTimestamp(3));
				reviewVO.setReview_ofile(rs.getString(4));
				reviewVO.setReview_sfile(rs.getString(5));
				reviewVO.setVisitcount(rs.getInt(6));
				reviewVO.setMember_id(rs.getString(7));
				reviewVO.setMname(rs.getString(8));
				reviewVO.setProduct_code(rs.getString(9));
				reviewVO.setPname(rs.getString(10));
				reviewVO.setOd_result(rs.getString(11));
				reviewVO.setReview_result(rs.getString(12));

				reviewList.add(reviewVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("게시판 product_code 조회 중 오류");
		} finally {
			DBManager.close(conn, pstmt);
		}
		return reviewList;
	}

	// member_id로 리뷰 불러오기

	public ArrayList<ReviewVO> findByMember_id(String member_id) {

		ArrayList<ReviewVO> reviewList = new ArrayList<ReviewVO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from review_view where member_member_id =? order by 3 desc";

		try {
			conn = DBManager.getConnection();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ReviewVO reviewVO = new ReviewVO();
				reviewVO.setOd_id(rs.getInt(1));
				reviewVO.setReview_content(rs.getString(2));
				reviewVO.setReview_register(rs.getTimestamp(3));
				reviewVO.setReview_ofile(rs.getString(4));
				reviewVO.setReview_sfile(rs.getString(5));
				reviewVO.setVisitcount(rs.getInt(6));
				reviewVO.setMember_id(rs.getString(7));
				reviewVO.setMname(rs.getString(8));
				reviewVO.setProduct_code(rs.getString(9));
				reviewVO.setPname(rs.getString(10));
				reviewVO.setOd_result(rs.getString(11));
				reviewVO.setReview_result(rs.getString(12));

				reviewList.add(reviewVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("게시판 member_id 조회 중 오류");
		} finally {
			DBManager.close(conn, pstmt);
		}
		return reviewList;
	}

	// test
	public void insertReview(ReviewVO reviewvo) {
		Connection conn = null;
		// PreparedStatement pstmt = null;
		CallableStatement cstmt = null;

		try {
			conn = DBManager.getConnection();

			// String insertReview = "insert into review (order_detail_order_detail_id,
			// review_content)values (?,?)";
			String insertReview = "{call sp_review_insert(?, ?)}";
			cstmt = conn.prepareCall(insertReview);
			cstmt.setInt(1, reviewvo.getOd_id());
			cstmt.setString(2, reviewvo.getReview_content());
			cstmt.executeUpdate();

			/*
			 * // 리뷰 작성한 주문 상품은 review_result = '2' 로 바꾸기 String updateReviewResult =
			 * "update order_detail set review_result='2' where order_detail_id=?"; pstmt =
			 * conn.prepareStatement(updateReviewResult); pstmt.setInt(1,
			 * reviewvo.getOd_id()); pstmt.executeUpdate();
			 */

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("리뷰 입력 중 오류");
		} finally {
			DBManager.close(conn, cstmt);
		}
	}

	public void updateReviewResult(int od_id) {
		// String sql = "update order_detail set review_result='2' where
		// order_detail_id=?";
		String sql = "{call sp_ReviewResult_update(?)}";

		Connection conn = null;
		// PreparedStatement pstmt = null;
		CallableStatement cstmt = null;

		try {
			conn = DBManager.getConnection();
			cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, od_id);
			cstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("업데이트 오류");
		} finally {
			DBManager.close(conn, cstmt);
		}
	}
}