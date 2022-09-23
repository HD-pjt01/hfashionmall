package com.hfashionmall.admin.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashionmall.controller.action.Action;
import com.hfashionmall.dao.QnaDAO;
import com.hfashionmall.dto.QnaVO;
//--------------------------------------정승하 작성----------------------------------------------시작
public class AdminQnaListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "admin/qna/qnaList.jsp";

		QnaDAO qnaDAO = QnaDAO.getInstance();
		ArrayList<QnaVO> qnaList = qnaDAO.listAllQna();

		request.setAttribute("qnaList", qnaList);

		request.getRequestDispatcher(url).forward(request, response);
	}
}
//--------------------------------------정승하 작성----------------------------------------------끝