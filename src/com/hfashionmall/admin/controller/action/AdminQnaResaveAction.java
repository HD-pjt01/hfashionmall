package com.hfashionmall.admin.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashionmall.dao.QnaDAO;
import com.hfashionmall.controller.action.Action;
import com.hfashionmall.dto.QnaVO;

public class AdminQnaResaveAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "hfashionmallServlet?command=admin_qna_list";

		String qna_sequence = request.getParameter("qna_sequence").trim();
		String qna_answer = request.getParameter("qna_answer").trim();

		QnaVO qnaVO = new QnaVO();
		qnaVO.setQna_sequence(Integer.parseInt(qna_sequence));
		qnaVO.setQna_answer(qna_answer);

		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.updateQna(qnaVO);

		response.sendRedirect(url);
	}
}
