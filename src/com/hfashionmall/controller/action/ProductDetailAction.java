package com.hfashionmall.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashionmall.dao.ProductDAO;
import com.hfashionmall.dto.ProductVO;

public class ProductDetailAction implements Action {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url="product/productDetail.jsp";
    
    String product_code=request.getParameter("product_code").trim();
    
    System.out.println("product_code : " + product_code);
    
    ProductDAO productDAO=ProductDAO.getInstance();
    ProductVO productVO= productDAO.getProduct(product_code);
    
    request.setAttribute("productVO", productVO);
    
    RequestDispatcher dispatcher = request
        .getRequestDispatcher(url);
    dispatcher.forward(request, response);
  }
}
