package com.hfashionmall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import util.DBManager;
/**
 * 수정자              수정내용
 * -----------       -------------------------------
 * 정승하              AdminDAO 작성 및 수정
 */
public class AdminDAO {
	private AdminDAO() {
	}

	private static AdminDAO instance = new AdminDAO();

	public static AdminDAO getInstance() {
		return instance;
	}	
	public int adminCheck(String userid, String userpw) {
		String sql = "select admin_pw from admin where admin_id=?";
		int result = -1;

		Connection conn = null;

		PreparedStatement pstmt = null;

		ResultSet rs = null;			
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if (rs.next()) { 
				result = 0; 
				String dbPwd = rs.getString(1); 
				if (dbPwd.equals(userpw)) {
					result = 1;
				}
			}
			DBManager.close(conn, pstmt, rs);
		} catch (Exception e) {
		}
		return result;
	}
}

