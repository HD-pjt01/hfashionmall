package com.hfashionmall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBManager;

import com.hfashionmall.dto.CartVO;

public class CartDAO {

	private CartDAO() {
	}

	private static CartDAO instance = new CartDAO();

	public static CartDAO getInstance() {
		return instance;
	}

	// table에 cart sequence 받아오기 필요
	public void insertCart(CartVO cartVO) {
		// cart_seq삽입 필요
		String sql = "insert into cart(cart_id,member_member_id,product_product_code, product_count)"
				+ " values(cart_seq.nextval,?, ?, ?)";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			System.out.println(cartVO.getMember_member_id() + " " + cartVO.getProduct_product_code() + " "
					+ cartVO.getProduct_count());
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cartVO.getMember_member_id());
			pstmt.setString(2, cartVO.getProduct_product_code()); // 상품코드 String으로 받아옴
			pstmt.setInt(3, cartVO.getProduct_count());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	public ArrayList<CartVO> listCart(String userId) {
		ArrayList<CartVO> cartList = new ArrayList<CartVO>();

		// 뷰 변경 완료
		// 추후에 정렬 필요
		String sql = "select * from cart_view where member_member_id=?";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId); // session에 저장한 userid
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CartVO cartVO = new CartVO();

				cartVO.setCart_id(rs.getInt(1));
				cartVO.setMember_member_id(rs.getString(2));
				cartVO.setProduct_product_code(rs.getString(3));
				cartVO.setMname(rs.getString(4));
				cartVO.setPname(rs.getString(5));
				cartVO.setProduct_count(rs.getInt(6));
				cartVO.setCart_register(rs.getTimestamp(7));
				cartVO.setProduct_price(rs.getInt(8));
				cartList.add(cartVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return cartList;
	}

	public void deleteCart(int cart_id) {
		String sql = "delete cart where cart_id=?";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cart_id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
}