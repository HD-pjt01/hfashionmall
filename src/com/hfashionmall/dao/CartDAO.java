package com.hfashionmall.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBManager;

import com.hfashionmall.dto.CartVO;

import oracle.jdbc.OracleTypes;
//----------------------------------cartdao 박서은, 심지연 작성------------------------------------
//
public class CartDAO {

	private CartDAO() {
	}

	private static CartDAO instance = new CartDAO();

	public static CartDAO getInstance() {
		return instance;
	}

	// cart 테이블에 cart 데이터 저장
	public void insertCart(CartVO cartVO) {

		// cart_seq삽입 필요
		/*
		 * String sql =
		 * "insert into cart(cart_id,member_member_id,product_product_code, product_count)"
		 * + " values(cart_seq.nextval,?, ?, ?)";
		 */

		String sql = "{call sp_cart_insert(?, ?, ?)}";
		CallableStatement cstmt = null;
		Connection conn = null;
		// PreparedStatement pstmt = null;

		try {
			conn = DBManager.getConnection();
			cstmt = conn.prepareCall(sql);
			cstmt.setString(1, cartVO.getMember_member_id());
			cstmt.setString(2, cartVO.getProduct_product_code()); // 상품코드 String으로 받아옴
			cstmt.setInt(3, cartVO.getProduct_count());
			cstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt);
		}
	}

	// 사용자 id로 cartlist출력
	public ArrayList<CartVO> listCart(String userId) {
		ArrayList<CartVO> cartList = new ArrayList<CartVO>();

		// String sql = "select * from cart_view where member_member_id=?";
		String sql = "{call sp_listCart_select(?, ?)}";
		CallableStatement cstmt = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			cstmt = conn.prepareCall(sql);
			cstmt.setString(1, userId); // session에 저장한 userid
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			rs = cstmt.executeQuery();
			rs = (ResultSet) cstmt.getObject(2);

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
	
	
// cart_id로 카트 내역 삭제
	public void deleteCart(int cart_id) {
		// String sql = "delete cart where cart_id=?";
		String sql = "{call sp_cart_delete(?)}";
		CallableStatement cstmt = null;

		Connection conn = null;
		// PreparedStatement pstmt = null;

		try {
			conn = DBManager.getConnection();
			cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, cart_id);
			cstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt);
		}
	}
}
//----------------------------------cartdao 박서은, 심지연 작성------------------------------------