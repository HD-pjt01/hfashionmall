package com.hfashionmall.admin.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashionmall.controller.action.Action;

public class AdminProductWriteFormAction implements Action {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    String url = "admin/product/productWrite.jsp";
    String brandList[] = { "Tommy Hilfiger", "Calvin Klein", "SJYP", "DKNY", "FILA"};
    String categoryList[] = {};
    request.setAttribute("kindList", brandList);
    request.getRequestDispatcher(url).forward(request, response);
  }
}
