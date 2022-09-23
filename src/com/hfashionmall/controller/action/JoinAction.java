package com.hfashionmall.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashionmall.dao.MemberDAO;
import com.hfashionmall.dto.MemberVO;

//--------------------------------------박소은 작성----------------------------------------------
public class JoinAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "member/login.jsp";

		HttpSession session = request.getSession();

		MemberVO memberVO = new MemberVO();

		memberVO.setMember_id(request.getParameter("member_id"));
		memberVO.setMember_pw(request.getParameter("member_pw"));
		memberVO.setMember_name(request.getParameter("member_name"));
		memberVO.setMember_addr(request.getParameter("member_addr"));
		memberVO.setMember_phone(request.getParameter("member_phone"));
		memberVO.setMember_email(request.getParameter("member_email"));
		memberVO.setMember_zipcode(request.getParameter("member_zipcode"));


		memberVO.setMember_useYN(request.getParameter("member_useYN"));

		memberVO.setMember_birth(request.getParameter("member_birth"));

		session.setAttribute("member_id", request.getParameter("member_id"));

		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.insertMember(memberVO);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
//--------------------------------------박소은 작성----------------------------------------------