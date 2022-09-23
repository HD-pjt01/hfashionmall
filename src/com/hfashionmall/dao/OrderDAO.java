package com.hfashionmall.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBManager;

import com.hfashionmall.dto.CartVO;
import com.hfashionmall.dto.OrderVO;

import oracle.jdbc.OracleTypes;

//----------------------------------orderdao 박서은,심지연 작성------------------------------------
public class OrderDAO {

   private OrderDAO() {
   }

   private static OrderDAO instance = new OrderDAO();

   public static OrderDAO getInstance() {
      return instance;
   }

   // 카트 테이블의 내용 주문 테이블에 저장
   // 카트에 담긴 리스트와 주문자 데이터 저장
   public int insertOrder(ArrayList<CartVO> cartList, String member_member_id) {
      int maxOrder_id = 0;

      Connection conn = null;
      // PreparedStatement pstmt = null;
      CallableStatement cstmt = null;
      ResultSet rs;

      try {
         conn = DBManager.getConnection();

         // String insertOrder = "insert into orders(order_id, member_member_id) values("
         // + "orders_seq.nextval, ?)";
         String insertOrder = "{call sp_orders_insert(?)}";
         cstmt = conn.prepareCall(insertOrder);
         cstmt.setString(1, member_member_id);
         cstmt.executeUpdate();
         cstmt.close();

         // order 에서 가장 최근에 들어간 값을 order_detail에 넣어줌
         // String selectMaxOseq = "select max(order_id) from orders";
         String selectMaxOseq = "{? = call sf_max_orders()}";
         cstmt = conn.prepareCall(selectMaxOseq);
         rs = cstmt.executeQuery();
         if (rs.next()) {
            maxOrder_id = rs.getInt(1);
         }        
         System.out.println("주문테이블에 주문id 저장");

         for (CartVO cartVO : cartList) {
            insertOrderDetail(cartVO, maxOrder_id);
         }
         System.out.println("주문상세 테이블에 주문상세 내역 저장");
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         DBManager.close(conn, cstmt);
      }
      return maxOrder_id;
   }

   // 주문 id를 가지고 상세 주문 테이블에 데이터 저장
   public void insertOrderDetail(CartVO cartVO, int maxOrder_id) {
      Connection conn = null;
      // PreparedStatement pstmt = null;
      CallableStatement cstmt = null;

      try {
         conn = DBManager.getConnection();

         /*
          * String insertOrderDetail =
          * "insert into order_detail(order_detail_id,  order_order_id, " +
          * "product_product_code,  order_detail_product_count) values(order_detail_seq.nextval, ?, ?, ?)"
          * ;
          */
         String insertOrderDetail = "{call sp_orders_insert(?)}";
         cstmt = conn.prepareCall(insertOrderDetail);
         cstmt.setInt(1, maxOrder_id);
         cstmt.setString(2, cartVO.getProduct_product_code());
         cstmt.setInt(3, cartVO.getProduct_count());
         cstmt.executeUpdate();
         cstmt.close();

         // 주문 버튼 입력하면 cart_result를 2로 변경
         // String updateCartResult = "update cart set cart_result=2 where cart_id=?";
         String updateCartResult = "{call sp_order_detail_update(?)}";
         cstmt = conn.prepareCall(updateCartResult);
         cstmt.setInt(1, cartVO.getCart_id());
         cstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         DBManager.close(conn, cstmt);
      }
   }

   // 상품상세에서 바로 주문 창으로 넘어가기
   // 제품 코드와 사용자 아이디로 바로 주문테이블에 데이터 저장
   public int insertDirectOrder(String member_member_id, String product_code, int product_count) {
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
         insertDirectOrderDetail(product_code, product_count, maxOrder_id);

      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         DBManager.close(conn, pstmt);
      }
      return maxOrder_id;
   }

   // '바로 구매' 부분에서 바로 구매 제품 주문 상세 테이블에 저장
   public void insertDirectOrderDetail(String product_code, int product_count, int maxOrder_id) {
      Connection conn = null;
      PreparedStatement pstmt = null;

      try {
         conn = DBManager.getConnection();

         String insertOrderDetail = "insert into order_detail(order_detail_id,  order_order_id, product_product_code,  order_detail_product_count) values(order_detail_seq.nextval, ?, ?, ?)";
         pstmt = conn.prepareStatement(insertOrderDetail);
         pstmt.setInt(1, maxOrder_id);
         pstmt.setString(2, product_code);
         pstmt.setInt(3, product_count);
         pstmt.executeUpdate();

      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         DBManager.close(conn, pstmt);
      }
   }

   
   // 사용자 별로 주문 상태(배송 완료 / 주문 완료)를 받아와 해당 상태의 주문 내역 조회
   public ArrayList<OrderVO> listOrderById(String id, String result, int order_id) {
      ArrayList<OrderVO> orderList = new ArrayList<OrderVO>();
      // String sql = "select * from order_view where member_member_id=? " + "and
      // order_detail_result=? and order_id=?";
      String sql = "{call sp_listOrderById_select(?, ?, ?, ?)}";
      Connection conn = null;
      // PreparedStatement pstmt = null;
      CallableStatement cstmt = null;
      ResultSet rs = null;

      try {
         conn = DBManager.getConnection();
         cstmt = conn.prepareCall(sql);
         cstmt.registerOutParameter(1, OracleTypes.CURSOR);
         cstmt.setString(2, id);
         cstmt.setString(3, result);
         cstmt.setInt(4, order_id);

         rs = cstmt.executeQuery();
         rs = (ResultSet) cstmt.getObject(1);

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
            orderList.add(orderVO);
         }

      } catch (Exception e) {
         e.printStackTrace();
         System.out.println("ordervo받아와서 출력 오류");
      } finally {
         DBManager.close(conn, cstmt, rs);
      }
      return orderList;
   }

   // 현재 주문 완료 주문 내역만 조회
   // member_id로 진행중인 주문 내역 가져오기
   public ArrayList<Integer> selectSeqOrderIng(String id) {
      ArrayList<Integer> oseqList = new ArrayList<Integer>();
      // 최신 주문을 위로 띄움
      /*
       * String sql = "select distinct order_id from order_view " +
       * "where member_member_id=? and order_detail_result ='1' order by order_id desc"
       * ;
       */
      String sql = "{call sp_SeqOrderIng_select(?, ?)}";
      Connection con = null;
      // PreparedStatement pstmt = null;
      CallableStatement cstmt = null;
      ResultSet rs = null;

      try {
         con = DBManager.getConnection();
         cstmt = con.prepareCall(sql);
         cstmt.registerOutParameter(1, OracleTypes.CURSOR);
         cstmt.setString(2, id);
         rs = cstmt.executeQuery();
         rs = (ResultSet) cstmt.getObject(1);
         while (rs.next()) {
            oseqList.add(rs.getInt(1));
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         DBManager.close(con, cstmt, rs);
      }
      return oseqList;
   }

   // 현재 배송완료 주문 내역만 조회
   // member_id로 진행중인 주문 내역 가져오기
   public ArrayList<Integer> selectSeqOrdered(String id) {
      ArrayList<Integer> oseqList = new ArrayList<Integer>();
      // 최신 주문을 위로 띄움
      /*
       * String sql = "select distinct order_id from order_view " +
       * "where member_member_id=? and order_detail_result ='2' order by order_id desc"
       * ;
       */
      String sql = "{call sp_SeqOrdered_select(?, ?)}";
      Connection con = null;
      // PreparedStatement pstmt = null;
      CallableStatement cstmt = null;
      ResultSet rs = null;

      try {
         con = DBManager.getConnection();
         cstmt = con.prepareCall(sql);
         cstmt.registerOutParameter(1, OracleTypes.CURSOR);
         cstmt.setString(2, id);
         rs = cstmt.executeQuery();
         rs = (ResultSet) cstmt.getObject(1);
         
         while (rs.next()) {
            oseqList.add(rs.getInt(1));
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         DBManager.close(con, cstmt, rs);
      }
      return oseqList;
   }

   // 리뷰 가능 주문 불러오기
   // order_detail_result = 2, review_result = 1 
   // 배송이 완료 되었고, 리뷰가 작성되지 않은 주문에 한해 리뷰 작성 가능
   public ArrayList<OrderVO> listOrderRivewable(String id, String o_result, String r_result) {
      ArrayList<OrderVO> orderList = new ArrayList<OrderVO>();
      String sql = "select * from order_view where member_member_id=? "
            + "and order_detail_result=? and review_result=?";
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         conn = DBManager.getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, id);
         pstmt.setString(2, o_result);
         pstmt.setString(3, r_result);

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
            orderList.add(orderVO);
         }

      } catch (Exception e) {
         e.printStackTrace();
         System.out.println(" 리뷰 가능한 order 받아와서 출력 오류");
      } finally {
         DBManager.close(conn, pstmt, rs);
      }
      return orderList;
   }

   // member_id로 모든 주문 내역 가져오기
   public ArrayList<OrderVO> listOrderAllById(String id) {
      ArrayList<OrderVO> orderList = new ArrayList<OrderVO>();
      String sql = "select * from order_view where member_member_id=? order by 4 desc";
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         conn = DBManager.getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, id);

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
            orderList.add(orderVO);
         }

      } catch (Exception e) {
         e.printStackTrace();
         System.out.println("사용자 id로 모든 주문 내역 출력 오류");
      } finally {
         DBManager.close(conn, pstmt, rs);
      }
      return orderList;
   }

   // 사용자 아이디랑 order_id로 주문 내역 가져오기
   public ArrayList<OrderVO> listOrderByOrderId(String id, int order_id) {
      ArrayList<OrderVO> orderList = new ArrayList<OrderVO>();
      String sql = "select * from order_view where member_member_id=? and order_id=?";
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         conn = DBManager.getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, id);

         pstmt.setInt(2, order_id);

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
            orderList.add(orderVO);
         }

      } catch (Exception e) {
         e.printStackTrace();
         System.out.println("member_id랑 order_id 받아와서 오더 리스트 출력 오류");
      } finally {
         DBManager.close(conn, pstmt, rs);
      }
      return orderList;
   }
   
 //----------------------------------orderdao 박서은,심지연 작성------------------------------------

   /*
    * * 관리자 모드에서 사용되는 메소드 * *
    */
   public ArrayList<OrderVO> listOrder(String member_name) {
      ArrayList<OrderVO> orderList = new ArrayList<OrderVO>();
      String sql = "select * from order_view where mname like '%'||?||'%' ";

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