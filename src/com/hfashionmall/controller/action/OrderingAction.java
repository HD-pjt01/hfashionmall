package com.hfashionmall.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashionmall.dao.CartDAO;
import com.hfashionmall.dto.CartVO;
import com.hfashionmall.dto.MemberVO;

public class OrderingAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "mypage/ordering.jsp";
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			url = "hfashionmallServlet?command=login_form";
		} else {
			
			
			// product code 받아옴
			/*
			 * String pname = request.getParameter("pname").trim(); String product_code =
			 * request.getParameter("product_code").trim(); int product_count =
			 * Integer.parseInt(request.getParameter("product_count")); int cart_id =
			 * Integer.parseInt(request.getParameter("cart_id")); int price =
			 * Integer.parseInt(request.getParameter("price")); int totalPrice =
			 * Integer.parseInt(request.getParameter("totalPrice"));
			 */
			CartDAO cartDAO = CartDAO.getInstance();
			ArrayList<CartVO> cartList = cartDAO.listCart(loginUser.getMember_id());

			int totalPrice = 10;

			for (CartVO cartVO : cartList) {
				totalPrice += cartVO.getProduct_price() * cartVO.getProduct_count();
			}

			/*
			 * for (CartVO cartVO : cartList) { totalPrice += cartVO.getProduct_price(); }
			 */

			request.setAttribute("cartList", cartList);
			request.setAttribute("totalPrice", totalPrice);
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
