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

public class QnaListAction implements Action {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "qna/qnaList.jsp";
    
    HttpSession session = request.getSession();
    MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");    
    
    if (loginUser == null) {
      url = "hfashionmallServlet?command=login_form";
    } else {
      QnaDAO qnaDAO = QnaDAO.getInstance();      
      ArrayList<QnaVO> qnaList = qnaDAO.listQna(loginUser.getMember_id());
      request.setAttribute("qnaList", qnaList);
    }
    request.getRequestDispatcher(url).forward(request, response);
  }
}