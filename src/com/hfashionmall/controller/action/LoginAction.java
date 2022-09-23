package com.hfashionmall.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashionmall.dao.MemberDAO;
import com.hfashionmall.dto.MemberVO;
//--------------------------------------박소은 작성----------------------------------------------
public class LoginAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "member/login_fail.jsp";
		HttpSession session = request.getSession();

		String member_id = request.getParameter("member_id");
		String member_pw = request.getParameter("member_pw");

		MemberDAO memberDAO = MemberDAO.getInstance();

		MemberVO memberVO = memberDAO.getMember(member_id);

		if (memberVO != null) {
			if (memberVO.getMember_pw().equals(member_pw)) {
				session.removeAttribute("member_id");
				session.setAttribute("loginUser", memberVO);
				url = "hfashionmallServlet?command=index";
			}
		}

		request.getRequestDispatcher(url).forward(request, response);
	}
}
//--------------------------------------박소은 작성----------------------------------------------