package com.hfashionmall.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashionmall.dao.QnaDAO;
import com.hfashionmall.dto.MemberVO;
import com.hfashionmall.dto.QnaVO;

public class QnaWriteAction implements Action {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "hfashionmallServlet?command=qna_list";
    
    HttpSession session = request.getSession();
    MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");    
    
    if (loginUser == null) {
      url = "hfashionmallServlet?command=login_form";
    }else{      
      QnaVO qnaVO = new QnaVO();
      MemberVO memberVO = new MemberVO();
      qnaVO.setQna_subject(request.getParameter("qna_subject"));
      qnaVO.setQna_content(request.getParameter("qna_content"));      
      QnaDAO qnaDAO = QnaDAO.getInstance();
      qnaDAO.insertqna(qnaVO, memberVO.getMember_id());      
    }    
    response.sendRedirect(url);
  }
}
