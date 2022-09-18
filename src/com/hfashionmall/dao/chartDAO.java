package com.hfashionmall.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.hfashionmall.dto.ChartVO;

import util.DBManager;

public class chartDAO {
	
	private chartDAO() {
		
	}
	
	private static chartDAO instance = new chartDAO();
	
	public static chartDAO getInstance() {
		return instance;
	}
	public ArrayList<ChartVO> Product_price_count() {
	      ArrayList<ChartVO> Product_count = new ArrayList<ChartVO>();
	      ChartVO count1 = null;
	      String sql = "select count(*) from product where product_price<100000; ";
	      ResultSet rs = null;
	      Connection conn = null;
	      CallableStatement cstmt = null;

	      try {
	         conn = DBManager.getConnection();
	         cstmt = conn.prepareCall(sql);
	         rs = cstmt.executeQuery();
	         while (rs.next()) {
	            count1 = new ChartVO();
	            count1.setProduct_price_count(rs.getInt(1));
	        
	            Product_count.add(count1);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         DBManager.close(conn, cstmt, rs);
	      }
	      return Product_count;
	   }

}
