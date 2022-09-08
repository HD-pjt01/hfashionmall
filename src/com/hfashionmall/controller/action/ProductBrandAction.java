package com.hfashionmall.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashionmall.dao.ProductDAO;
import com.hfashionmall.dto.ProductVO;

public class ProductBrandAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url="product/productBrand.jsp";
		System.out.println("request : " + request);
		String brand=request.getParameter("case").trim();
		
		System.out.println("brand : " + brand);
		
		ProductDAO productDAO=ProductDAO.getInstance();
		ArrayList<ProductVO>productBrandList= productDAO.listBrandProduct(brand);
		
		request.setAttribute("productBrandList", productBrandList);
		RequestDispatcher dispatcher = request
				.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
