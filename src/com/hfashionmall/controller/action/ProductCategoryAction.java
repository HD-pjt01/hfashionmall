package com.hfashionmall.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashionmall.dao.ProductDAO;
import com.hfashionmall.dto.ProductVO;

/**
 * 수정자        수정내용
 * --------    ---------------------------
 * 정승하        선택한 상품 카테고리의 리스트를 호출
 */
public class ProductCategoryAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "product/productCategory.jsp";

		String category = request.getParameter("case").trim();

		System.out.println("category : " + category + "가(이) 선택되었습니다.");

		ProductDAO productDAO = ProductDAO.getInstance();
		ArrayList<ProductVO> productCategoryList = productDAO.listCategoryProduct(category);

		request.setAttribute("productCategoryList", productCategoryList);
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
