package com.hfashionmall.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
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

	public int confirmMemberID(String member_id) {
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

	// ID와 PW 일치하는지 확인하는 메서드
	public int confirmID(MemberVO memberVO) {
		int result = -1;
		Connection conn = null;
		ResultSet rs = null;
		CallableStatement cstmt = null;

		String id = memberVO.getMember_id();
		String pwd = memberVO.getMember_pw();
		String sql = "{? = call sf_member_confirm(?, ?)}";

		try {
			conn = DBManager.getConnection();
			cstmt = conn.prepareCall(sql);
			cstmt.registerOutParameter(1, Types.VARCHAR); // 아이디와 비밀번호 일치 여부 반환
			cstmt.setString(2, id); // 클라이언트로부터 입력 받은 아이디
			cstmt.setString(3, pwd); // 클라이언트로부터 입력 받은 비밀번호
			try {
				cstmt.executeQuery(); // 쿼리 실행
				String flag = cstmt.getString(1); // 쿼리 실행 결과 GET

				// 로그인을 성공할 경우
				if (flag.equals("1"))
					result = 1;

				// 로그인을 실패할 경우
				else
					result = -1;

			} catch (SQLException e) {
				System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (cstmt != null)
				try {
					cstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}
		return result; // 로그인 성공 여부를 반환
	}

	public MemberVO getMember(String member_id) {
		MemberVO memberVO = null;
		String sql = "select * from table(getMember_pipe_table_func(?))";
		ResultSet rs = null;
		Connection conn = null;
		CallableStatement cstmt;

		try {
			conn = DBManager.getConnection();
			cstmt = conn.prepareCall(sql);
			cstmt.setString(1, member_id);
			rs = cstmt.executeQuery();
			if (rs.next()) {
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
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return memberVO;
	}

	public int insertMember(MemberVO memberVO) {
		Connection conn = null;
		CallableStatement cstmt = null;
		ResultSet rs = null;

		int res = -1; // INSERT 성공 여부를 저장할 변수
		String id = memberVO.getMember_id();
		String pw = memberVO.getMember_pw();
		String name = memberVO.getMember_name();

		String phone = memberVO.getMember_phone();
		String email = memberVO.getMember_email();
		String birth = memberVO.getMember_birth();
		// String update = memberVO.getMember_update();
		String sql = "{call sp_member_insert(?, ?, ?, ?, ?, ?)}";

		try {
			conn = DBManager.getConnection();
			cstmt = conn.prepareCall(sql);

			// 클라이언트로부터 입력 받은 데이터들
			cstmt.setString(1, id);
			cstmt.setString(2, pw);
			cstmt.setString(3, name);
			cstmt.setString(4, phone);
			cstmt.setString(5, email);
			cstmt.setString(6, birth);

			// 4자리 이상의 비밀번호만 INSERT 가능
			if (pw.length() >= 4) {
				try {
					cstmt.executeQuery();
					res = 1;

				} catch (SQLException e) {
					System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (cstmt != null)
				try {
					cstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}
		return res; // INSERT 성공 여부를 반환
	}

	/*
	 * * 관리자 모드에서 사용되는 메소드 * *
	 */
	public ArrayList<MemberVO> listMember(String member_name) {
		ArrayList<MemberVO> memberList = new ArrayList<MemberVO>();
		String sql = "select * from member where member_name like '%'||?||'%' " + "order by member_update desc";

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
