package com.hfashionmall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBManager;

import com.hfashionmall.dto.CartVO;
import com.hfashionmall.dto.OrderVO;

public class OrderDAO {

	private OrderDAO() {
	}

	private static OrderDAO instance = new OrderDAO();

	public static OrderDAO getInstance() {
		return instance;
	}

	// 사용자가 주문
	public int insertOrder(ArrayList<CartVO> cartList, String member_member_id) {
		int maxOrder_id = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs;

		try {
			conn = DBManager.getConnection();

			String insertOrder = "insert into orders(order_id, member_member_id) values(" + "orders_seq.nextval, ?)";
			pstmt = conn.prepareStatement(insertOrder);
			pstmt.setString(1, member_member_id);
			pstmt.executeUpdate();
			pstmt.close();

			// order 에서 가장 최근에 들어간 값을 order_detail에 넣어줌
			String selectMaxOseq = "select max(order_id) from orders";
			pstmt = conn.prepareStatement(selectMaxOseq);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				maxOrder_id = rs.getInt(1);
			}

			for (CartVO cartVO : cartList) {
				insertOrderDetail(cartVO, maxOrder_id);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return maxOrder_id;
	}

	public void insertOrderDetail(CartVO cartVO, int maxOrder_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBManager.getConnection();

			String insertOrderDetail = "insert into order_detail(order_detail_id,  order_order_id, "
					+ "product_product_code,  order_detail_product_count) values(order_detail_seq.nextval, ?, ?, ?)";
			pstmt = conn.prepareStatement(insertOrderDetail);
			pstmt.setInt(1, maxOrder_id);
			pstmt.setString(2, cartVO.getProduct_product_code());
			pstmt.setInt(3, cartVO.getProduct_count());
			pstmt.executeUpdate();
			pstmt.close();

			// 주문 버튼 입력하면 cart_result를 2로 변경
			String updateCartResult = "update cart set cart_result=2 where cart_id=?";
			pstmt = conn.prepareStatement(updateCartResult);
			pstmt.setInt(1, cartVO.getCart_id());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	// 사용자가 주문 내역 검색
	public ArrayList<OrderVO> listOrderById(String id, String result, int order_id) {
		ArrayList<OrderVO> orderList = new ArrayList<OrderVO>();
		String sql = "select * from order_view where member_member_id=? " + "and order_detail_result=? and order_id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, result);
			pstmt.setInt(3, order_id);

			rs = pstmt.executeQuery();

			
			  while (rs.next()) {
			  
			  OrderVO orderVO = new OrderVO(); 
			  
			  orderVO.setOrder_detail_id(rs.getInt(1));
			  orderVO.setOrder_id(rs.getInt(2));
			  orderVO.setMember_member_id(rs.getString(3));
			  orderVO.setOrder_register(rs.getTimestamp(4));
			  orderVO.setProduct_code(rs.getString(5));
			  orderVO.setProduct_count(rs.getInt(6)); 
			  orderVO.setMname(rs.getString(7));
			  orderVO.setZipcode(rs.getString(8)); 
			  orderVO.setAddr(rs.getString(9));
			  orderVO.setPhone(rs.getString(10)); 
			  orderVO.setPname(rs.getString(11));
			  orderVO.setPrice(rs.getInt(12));
			  orderVO.setOrder_detail_result(rs.getString(13)); 
			  orderList.add(orderVO); }
			 

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ordervo받아와서 출력 오류");
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return orderList;
	}

	// 현재 진행 중인 주문 내역만 조회
	// member_id로 진행중인 주문 내역 가져오기
	public ArrayList<Integer> selectSeqOrderIng(String id) {
		ArrayList<Integer> oseqList = new ArrayList<Integer>();
//		최신 주문을 위로 띄움
		String sql = "select distinct order_id from order_view "
				+ "where member_member_id=? and order_detail_result ='1' order by order_id desc";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DBManager.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				oseqList.add(rs.getInt(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return oseqList;
	}

	/*
	 * * 관리자 모드에서 사용되는 메소드 * *
	 */
	public ArrayList<OrderVO> listOrder(String member_name) {
		ArrayList<OrderVO> orderList = new ArrayList<OrderVO>();
		String sql = "select * from order_view where mname like '%'||?||'%' " + "order by result, oseq desc";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			if (member_name == "") {
				pstmt.setString(1, "%");
			} else {
				pstmt.setString(1, member_name);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderVO orderVO = new OrderVO();
				orderVO.setOdseq(rs.getInt("ODSEQ"));
				orderVO.setOseq(rs.getInt("OSEQ"));
				orderVO.setId(rs.getString("ID"));
				orderVO.setPseq(rs.getInt("PSEQ"));
				orderVO.setMname(rs.getString("MNAME"));
				orderVO.setPname(rs.getString("PNAME"));
				orderVO.setQuantity(rs.getInt("QUANTITY"));
				orderVO.setZipNum(rs.getString("ZIP_NUM"));
				orderVO.setAddress(rs.getString("ADDRESS"));
				orderVO.setPhone(rs.getString("PHONE"));
				orderVO.setIndate(rs.getTimestamp("INDATE"));
				orderVO.setPrice2(rs.getInt("PRICE2"));
				orderVO.setResult(rs.getString("RESULT"));
				orderList.add(orderVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return orderList;
	}

	public void updateOrderResult(String oseq) {
		String sql = "update order_detail set result='2' where odseq=?";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, oseq);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
}
