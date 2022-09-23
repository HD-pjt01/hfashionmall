package com.hfashionmall.admin.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashionmall.controller.action.Action;
import com.hfashionmall.dao.MemberDAO;
import com.hfashionmall.dto.MemberVO;

//--------------------------------------정승하 작성----------------------------------------------시작
public class AdminMemberListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "admin/member/memberList.jsp";
		String key = "";
		if (request.getParameter("key") != null) {
			key = request.getParameter("key");
		}

		MemberDAO memberDAO = MemberDAO.getInstance();
		ArrayList<MemberVO> memberList = memberDAO.listMember(key);

		request.setAttribute("memberList", memberList);

		request.getRequestDispatcher(url).forward(request, response);
	}
}
//--------------------------------------정승하 작성----------------------------------------------끝