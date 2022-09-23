package com.hfashionmall.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashionmall.dao.ProductDAO;
import com.hfashionmall.dto.MemberVO;
import com.hfashionmall.dto.ProductVO;

//--------------------------------------박서은 작성----------------------------------------------
//제품 '바로 구매' 클릭 시 주문서 창 띄우는 action처리 
public class OrderingOneAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// prdoect_code로 product 객체 받아와서 ordering_one.jsp에게 전달
		String url = "mypage/ordering_one.jsp";

		// 로그인한 유저가 있는 지 확인 -> 없다면 로그인 창으로, 있다면 주문서 띄우기 action 수행
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			url = "hfashionmallServlet?command=login_form";
		} else {

			// 현재 주문한 제품과 수량을 받아와 저장 -> 주문 데이터를 주문서 뷰(jsp)에 전달
			String product_code = request.getParameter("product_code").trim();
			int product_count = Integer.parseInt(request.getParameter("quantity"));

			ProductDAO productDAO = ProductDAO.getInstance();
			ProductVO productVO = productDAO.getProduct(product_code);

			request.setAttribute("productVO", productVO);
			request.setAttribute("product_count", product_count);

		}
		request.getRequestDispatcher(url).forward(request, response);
		System.out.println("바로구매 주문서 출력");
	}

}
//--------------------------------------박서은 작성----------------------------------------------