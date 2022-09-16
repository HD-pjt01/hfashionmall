package com.hfashionmall.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashionmall.dao.ProductDAO;
import com.hfashionmall.dto.ProductVO;

public class ProductCategoryAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url="product/productCategory.jsp";
		System.out.println("request : " + request);
		String category=request.getParameter("case").trim();
		
		System.out.println("category : " + category);
		
		ProductDAO productDAO=ProductDAO.getInstance();
		ArrayList<ProductVO>productCategoryList= productDAO.listCategoryProduct(category);
		
		request.setAttribute("productCategoryList", productCategoryList);
		RequestDispatcher dispatcher = request
				.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
