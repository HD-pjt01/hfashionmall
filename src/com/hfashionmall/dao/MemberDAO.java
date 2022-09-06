package com.hfashionmall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.text.SimpleDateFormat;

import util.DBManager;

import com.hfashionmall.dto.MemberVO;


public class MemberDAO {

  private MemberDAO() {
  }

  private static MemberDAO instance = new MemberDAO();

  public static MemberDAO getInstance() {
    return instance;
  }

  public int confirmID(String member_id) {
	int result = -1;
    String sql = "select * from member where member_id=?";
       
    Connection connn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
      connn = DBManager.getConnection();
      pstmt = connn.prepareStatement(sql);
      pstmt.setString(1, member_id);
      rs = pstmt.executeQuery();
      if (rs.next()) { 
        result = 1;
      } else { 
        result = -1;
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      DBManager.close(connn, pstmt, rs);
    }
    return result;
  }

  public MemberVO getMember(String member_id) {       
    MemberVO memberVO= null;
    String sql = "select * from member where member_id=?";
     
    Connection connn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
      connn = DBManager.getConnection();
      pstmt = connn.prepareStatement(sql);
      pstmt.setString(1, member_id);
      rs = pstmt.executeQuery();
      if(rs.next()){
        memberVO = new MemberVO();
        memberVO.setMember_id(rs.getString("member_id"));
        memberVO.setMember_pw(rs.getString("member_pw"));
        memberVO.setMember_name(rs.getString("member_name"));
        memberVO.setMember_addr(rs.getString("member_addr"));
        memberVO.setMember_phone(rs.getString("member_phone"));
        memberVO.setMember_email(rs.getString("member_email"));
        memberVO.setMember_zipcode(rs.getString("member_zipcode"));
        
        memberVO.setMember_register(rs.getTimestamp("member_register"));
        memberVO.setMember_useYN(rs.getString("member_useYN"));
        
        memberVO.setMember_birth(rs.getString("member_birth"));
        memberVO.setMember_update(rs.getTimestamp("member_update"));
        System.out.println(memberVO.getMember_name());
      } 
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      DBManager.close(connn, pstmt, rs);
    }
    return memberVO;
  }

  public int insertMember(MemberVO memberVO) {
    int result = 0;
    String sql = "insert into member(member_id, member_pw, member_name, member_addr,  member_phone,";
    sql += " member_email, member_zipcode, member_register, member_useYN, member_birth, member_update) values(?, ?, ?, ?, ?, ?, ?, sysdate, ?, ?, sysdate)";
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    
    try {
      conn = DBManager.getConnection();
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, memberVO.getMember_id());      
      pstmt.setString(2, memberVO.getMember_pw());
      pstmt.setString(3, memberVO.getMember_name());
      pstmt.setString(4, memberVO.getMember_addr());
      pstmt.setString(5, memberVO.getMember_phone());
      pstmt.setString(6, memberVO.getMember_email());
      pstmt.setString(7, memberVO.getMember_zipcode());
      //pstmt.setString(8, 'sysdate');
      
      pstmt.setString(8, memberVO.getMember_useYN());
      pstmt.setString(9, memberVO.getMember_birth());
      //pstmt.setString(11, 'sysdate');
      result = pstmt.executeUpdate();
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      DBManager.close(conn, pstmt);
    }
    return result;
  }
  
	/* *
	 * 관리자 모드에서 사용되는 메소드 * *
	 */
	public ArrayList<MemberVO> listMember(String member_name) {
		ArrayList<MemberVO> memberList = new ArrayList<MemberVO>();
		String sql = "select * from member where member_name like '%'||?||'%' " +
				"order by member_update desc";

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
				MemberVO memberVO = new MemberVO();
		        memberVO.setMember_id(rs.getString("member_id"));
		        memberVO.setMember_pw(rs.getString("member_pw"));
		        memberVO.setMember_name(rs.getString("member_name"));
		        memberVO.setMember_addr(rs.getString("member_addr"));
		        memberVO.setMember_phone(rs.getString("member_phone"));
		        memberVO.setMember_email(rs.getString("member_email"));
		        memberVO.setMember_zipcode(rs.getString("member_zipcode"));
		        
		        memberVO.setMember_register(rs.getTimestamp("member_register"));
		        memberVO.setMember_useYN(rs.getString("member_useYN"));
		        
		        memberVO.setMember_birth(rs.getString("member_birth"));
		        memberVO.setMember_update(rs.getTimestamp("member_update"));
		        memberList.add(memberVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return memberList;
	}
}
