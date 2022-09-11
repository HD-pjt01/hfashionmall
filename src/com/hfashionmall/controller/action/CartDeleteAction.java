package com.hfashionmall.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashionmall.dao.CartDAO;

public class CartDeleteAction implements Action {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "hfashionmallServlet?command=cart_list";
    
    String[] cart_idArr = request.getParameterValues("cart_id");
    
    for(String cart_id:cart_idArr){
      System.out.println(cart_id);
      CartDAO cartDAO = CartDAO.getInstance();
      cartDAO.deleteCart(Integer.parseInt(cart_id));
    }
    request.getRequestDispatcher(url).forward(request, response);
  }
}
