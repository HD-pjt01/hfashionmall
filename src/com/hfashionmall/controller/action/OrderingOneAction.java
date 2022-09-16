package com.hfashionmall.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashionmall.dao.ProductDAO;
import com.hfashionmall.dto.MemberVO;
import com.hfashionmall.dto.ProductVO;

public class OrderingOneAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ordering_one.jsp 에 prdoect_code로 product 객체 받아와서 ordering_one.jsp에게 전달
		String url = "mypage/ordering_one.jsp";

		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			url = "hfashionmallServlet?command=login_form";
		} else {
			String product_code = request.getParameter("product_code").trim();
			int product_count = Integer.parseInt(request.getParameter("product_count"));

			ProductDAO productDAO = ProductDAO.getInstance();
			ProductVO productVO = productDAO.getProduct(product_code);

			request.setAttribute("productVO", productVO);
			request.setAttribute("product_count", product_count);

		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
