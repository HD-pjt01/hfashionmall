package com.hfashionmall.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashionmall.dao.QnaDAO;
import com.hfashionmall.dto.MemberVO;
import com.hfashionmall.dto.QnaVO;
/**
 * 수정자        수정내용
 * --------    ---------------------------
 * 정승하        사용자 한 명이 작성한 QnA 리스트를 호출
 */
public class QnaViewAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "member/qnaView.jsp";
		System.out.println("사용자의 QnA 리스트 출력");
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			url = "hfashionmallServlet?command=login_form";
		} else {
			QnaDAO qnaDAO = QnaDAO.getInstance();
			ArrayList<QnaVO> qnaList = qnaDAO.listMyQna(loginUser.getMember_id());
			request.setAttribute("qnaList", qnaList);
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}