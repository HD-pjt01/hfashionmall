package com.hfashionmall.admin.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashionmall.dao.QnaDAO;
import com.hfashionmall.controller.action.Action;
import com.hfashionmall.dto.QnaVO;
/**
 * 수정자        수정내용
 * --------    -------------------------------
 * 정승하        관리자에서 선택한 QnA의 상세 페이지를 호출
 */
public class AdminQnaDetailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "admin/qna/qnaDetail.jsp";

		String qna_sequence = request.getParameter("qna_sequence").trim();

		QnaDAO qnaDAO = QnaDAO.getInstance();
		QnaVO qnaVO = qnaDAO.getQna(Integer.parseInt(qna_sequence));

		request.setAttribute("qnaVO", qnaVO);

		request.getRequestDispatcher(url).forward(request, response);
	}
}