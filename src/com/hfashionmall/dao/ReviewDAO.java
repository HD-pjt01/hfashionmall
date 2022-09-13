package com.hfashionmall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.hfashionmall.dto.CartVO;
import com.hfashionmall.dto.ReviewVO;

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

	public int countTotalReview(ReviewVO reviewVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select count(order_detail_order_detail_id) from review";

		try {
			conn = DBManager.getConnection();

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return -1;
	}

	public static ArrayList<ReviewVO> findByProd(String product_code) {

		ArrayList<ReviewVO> reviewList = new ArrayList<ReviewVO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from review_view where product_product_code=?";

		try {
			conn = DBManager.getConnection();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product_code);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ReviewVO reviewVO = new ReviewVO();
				reviewVO.setOrder_detail_id(rs.getInt(1));
				reviewVO.setReview_content(rs.getString(2));
				reviewVO.setReview_register(rs.getTimestamp(3));
				reviewVO.setReview_subject(rs.getString(4));
				reviewVO.setReview_ofile(rs.getString(5));
				reviewVO.setReview_sfile(rs.getString(6));
				reviewVO.setVisitcount(rs.getInt(7));
				reviewVO.setMember_id(rs.getString(8));
				reviewVO.setMname(rs.getString(9));
				reviewVO.setProduct_code(rs.getString(10));

				reviewList.add(reviewVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("게시판 조회 중 오류");
		} finally {
			DBManager.close(conn, pstmt);
		}
		return reviewList;
	}
	
	public void insertReview(ReviewVO reviewvo) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBManager.getConnection();

			String insertReview = "insert into review(review_content, "
					+ "review_subject, review_ofile, review_sfile, order_detail_order_detail_id) values(?, ?, ?, ?,?)";
			pstmt = conn.prepareStatement(insertReview);
			pstmt.setString(1, reviewvo.getReview_content());
			pstmt.setString(2, reviewvo.getReview_subject());
			pstmt.setString(3, reviewvo.getReview_ofile());
			pstmt.setString(4, reviewvo.getReview_sfile());
			pstmt.setInt(5, reviewvo.getOrder_detail_id());
			
			pstmt.executeUpdate();
	
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("게시판 입력 중 오류");
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	// 사용자 id와 product코드로 리뷰 작성가능 한지 check
	
}
