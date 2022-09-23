package com.hfashionmall.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashionmall.dao.QnaDAO;
import com.hfashionmall.dto.MemberVO;
import com.hfashionmall.dto.QnaVO;

/**
 * 수정자        수정내용
 * --------    -------------------------------
 * 정승하        QnA 작성 URL을 호출
 */
public class QnaWriteAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "hfashionmallServlet?command=qna";
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			url = "hfashionmallServlet?command=login_form";
		} else {
			QnaVO qnaVO = new QnaVO();
			qnaVO.setQna_subject(request.getParameter("qna_subject"));
			qnaVO.setQna_content(request.getParameter("qna_content"));
			qnaVO.setQna_classification(request.getParameter("qna_classification"));
			qnaVO.setMember_member_id(request.getParameter("member_member_id"));
			QnaDAO qnaDAO = QnaDAO.getInstance();
			qnaDAO.insertqna(qnaVO, loginUser.getMember_id());
		}
		response.sendRedirect(url);
	}
}