package com.hfashionmall.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBManager;

import com.hfashionmall.dto.ProductVO;

public class ProductDAO {
  private ProductDAO() {
  }

  private static ProductDAO instance = new ProductDAO();

  public static ProductDAO getInstance() {
    return instance;
  }
  // 신상품
  public ArrayList<ProductVO> listNewProduct() {
    ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
    //String sql = "select *  from new_pro_view";
    String sql = "select *  from product";
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
      conn = DBManager.getConnection();
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        ProductVO product = new ProductVO();
        product.setProduct_code(rs.getString("prodcut_code"));
        product.setProduct_name(rs.getString("product_name"));
        
        product.setProduct_brand(rs.getString("product_brand"));
        product.setProduct_category(rs.getString("product_category"));
        
        product.setProduct_price(rs.getInt("product_price"));
        product.setProduct_color(rs.getString("product_color"));
        product.setProduct_size(rs.getString("product_size"));
        product.setProduct_best(rs.getString("product_best"));
        product.setProduct_register(rs.getTimestamp("product_register"));
        product.setProduct_update(rs.getTimestamp("product_update"));
        product.setProduct_price(rs.getInt("product_quantity"));
        productList.add(product);
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      DBManager.close(conn, pstmt, rs);
    }
    return productList;
  }

  // 베스트 상품
  public ArrayList<ProductVO> listBestProduct() {
    ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
    //String sql = "select *  from best_pro_view";
    String sql = "select *  from product";
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
      conn = DBManager.getConnection();
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        ProductVO product = new ProductVO();
        product.setProduct_code(rs.getString("prodcut_code"));
        product.setProduct_name(rs.getString("product_name"));
        
        product.setProduct_brand(rs.getString("product_brand"));
        product.setProduct_category(rs.getString("product_category"));
        
        
        product.setProduct_price(rs.getInt("product_price"));
        product.setProduct_color(rs.getString("product_color"));
        product.setProduct_size(rs.getString("product_size"));
        product.setProduct_best(rs.getString("product_best"));
        product.setProduct_register(rs.getTimestamp("product_register"));
        product.setProduct_update(rs.getTimestamp("product_update"));
        productList.add(product);
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      DBManager.close(conn, pstmt, rs);
    }
    return productList;
  }   
  
  public ProductVO getProduct(String product_code) {
    ProductVO product = null;
    String sql = "select * from product where product_code=?";
    
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;    
    
    try {
      con = DBManager.getConnection();
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, product_code);
      rs = pstmt.executeQuery();
      if (rs.next()) { 
        product = new ProductVO();
        product.setProduct_code(rs.getString(1));
        product.setProduct_name(rs.getString(2));
        
        product.setProduct_brand(rs.getString(3));
        product.setProduct_category(rs.getString(4));
        
        product.setProduct_price(rs.getInt(5));
        product.setProduct_color(rs.getString(6));
        product.setProduct_size(rs.getString(7));
        product.setProduct_best(rs.getString(8));
        product.setProduct_register(rs.getTimestamp(9));
        product.setProduct_update(rs.getTimestamp(10));
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      DBManager.close(con, pstmt, rs);
    }
    return product;
  }

  public ArrayList<ProductVO> listBrandProduct(String product_brand) {
      ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
      ProductVO product = null;
      String sql = "select * from table(listBrandProduct_pipe_table_func(?))";
      ResultSet rs = null;
      Connection conn = null;
      CallableStatement cstmt = null;

      try {
         conn = DBManager.getConnection();
         cstmt = conn.prepareCall(sql);
         cstmt.setString(1, product_brand);
         rs = cstmt.executeQuery();
         while (rs.next()) {
            product = new ProductVO();
            product.setProduct_code(rs.getString(1));
            product.setProduct_name(rs.getString(2));
            product.setProduct_brand(rs.getString(3));
            product.setProduct_category(rs.getString(4));
            product.setProduct_price(rs.getInt(5));
            product.setProduct_color(rs.getString(6));
            product.setProduct_size(rs.getString(7));
            product.setProduct_best(rs.getString(8));
            product.setProduct_register(rs.getTimestamp(9));
            product.setProduct_update(rs.getTimestamp(10));
            product.setProduct_quantity(rs.getInt(11));
            productList.add(product);
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         DBManager.close(conn, cstmt, rs);
      }
      return productList;
   }
  
  public ArrayList<ProductVO> listCategoryProduct(String product_category) {
      ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
      String sql = "select * from table(listCategoryProduct_pipe_table_func(?))";

      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      CallableStatement cstmt = null;

      System.out.println("sql :  " + sql);
      try {
         conn = DBManager.getConnection();
         cstmt = conn.prepareCall(sql);
         cstmt.setString(1, product_category);
         rs = cstmt.executeQuery();
         // System.out.println("rs.next() : " + rs.next() );
         // System.out.println("rs.getString :" + rs.getString(1));
         while (rs.next()) {
            ProductVO product = new ProductVO();
            product.setProduct_code(rs.getString(1)); // product.setProduct_code(rs.getString("prodcut_code"));
            product.setProduct_name(rs.getString(2));
            product.setProduct_brand(rs.getString(3)); // product.setProduct_brand(rs.getString("product_brand"));
            product.setProduct_category(rs.getString(4));

            product.setProduct_price(rs.getInt(5));
            product.setProduct_color(rs.getString(6));
            product.setProduct_size(rs.getString(7));
            product.setProduct_best(rs.getString(8));
            product.setProduct_register(rs.getTimestamp(9));
            product.setProduct_update(rs.getTimestamp(10));
            productList.add(product);
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         DBManager.close(conn, pstmt, rs);
      }
      return productList;
   }
  
  
  public ArrayList<ProductVO> listSearchProduct(String SearchWord) {
      ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
      String sql = "Select * from product where product_name like '%'||?||'%'";

      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      CallableStatement cstmt = null;

      System.out.println("sql :  " + sql);
      try {
         conn = DBManager.getConnection();
         cstmt = conn.prepareCall(sql);
         cstmt.setString(1, SearchWord);
         rs = cstmt.executeQuery();
         // System.out.println("rs.next() : " + rs.next() );
         // System.out.println("rs.getString :" + rs.getString(1));
         while (rs.next()) {
            ProductVO product = new ProductVO();
            product.setProduct_code(rs.getString(1)); // product.setProduct_code(rs.getString("prodcut_code"));
            product.setProduct_name(rs.getString(2));
            product.setProduct_brand(rs.getString(3)); // product.setProduct_brand(rs.getString("product_brand"));
            product.setProduct_category(rs.getString(4));

            product.setProduct_price(rs.getInt(5));
            product.setProduct_color(rs.getString(6));
            product.setProduct_size(rs.getString(7));
            product.setProduct_best(rs.getString(8));
            product.setProduct_register(rs.getTimestamp(9));
            product.setProduct_update(rs.getTimestamp(10));
            productList.add(product);
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         DBManager.close(conn, pstmt, rs);
      }
      return productList;
   }
  
  
  
  /*                           *
   * 관리자 모드에서 사용되는 메소드   * 
   */            
  public int totalRecord(String product_name) {
    int total_pages = 0;    
    String sql = "select count(*) from product where product_name like '%'||?||'%'";

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet pageset = null;
    
    try {
      con = DBManager.getConnection();
      pstmt = con.prepareStatement(sql);

      if (product_name.equals("")){
        pstmt.setString(1, "%");
      }
      else{
        pstmt.setString(1, product_name);
      }
      pageset = pstmt.executeQuery();

      if (pageset.next()) {
        total_pages = pageset.getInt(1); // 레코드의 개수
        pageset.close();
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      DBManager.close(con, pstmt);
    }  
    return total_pages;
  }

  static int view_rows = 5; // 페이지의 개수
  static int counts = 8; // 한 페이지에 나타낼 상품의 개수

  // 페이지 이동을 위한 메소드
  public String pageNumber(int tpage, String name) {
    String str = "";
   
    int total_pages = totalRecord(name);       
    int page_count = total_pages / counts + 1;

    if (total_pages % counts == 0) {
      page_count--;
    }
    if (tpage < 1) {
      tpage = 1;
    }

    int start_page = tpage - (tpage % view_rows) + 1;  
    int end_page = start_page + (counts-1); 

    if (end_page > page_count) {
      end_page = page_count; 
    }
    if (start_page > view_rows) {
      str += "<a href='hfashionmallServlet?command=admin_product_list&tpage=1&key=" 
         + name + "'>&lt;&lt;</a>&nbsp;&nbsp;";
      str+="<a href='hfashionmallServlet?command=admin_product_list&tpage=" 
         + (start_page - 1);
      str += "&key=<%=product_name%>'>&lt;</a>&nbsp;&nbsp;";
    }
    
    for (int i = start_page; i <= end_page; i++) {
      if (i == tpage) {
        str += "<font color=red>[" + i + "]&nbsp;&nbsp;</font>";
      } else {
        str += "<a href='hfashionmallServlet?command=admin_product_list&tpage=" 
           + i + "&key=" + name + "'>[" + i + "]</a>&nbsp;&nbsp;";
      }
    }

    
    if (page_count > end_page) {
      str += "<a href='hfashionmallServlet?command=admin_product_list&tpage="
          + (end_page + 1) + "&key=" + name + "'> &gt; </a>&nbsp;&nbsp;";
      str += "<a href='hfashionmallServlet?command=admin_product_list&tpage="
          + page_count + "&key=" + name + "'> &gt; &gt; </a>&nbsp;&nbsp;";
    }
    return str;
  }

  public ArrayList<ProductVO> listProduct(int tpage, String product_name) {
    ArrayList<ProductVO> productList = new ArrayList<ProductVO>();

    String str = "select pseq, indate, name, price1, price2, useyn, bestyn " +
        " from product where name like '%'||?||'%' order by pseq desc";
    
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    int absolutepage = 1;

    try {
      con = DBManager.getConnection();
      absolutepage = (tpage - 1) * counts + 1; 
      pstmt = con.prepareStatement(str, ResultSet.TYPE_SCROLL_SENSITIVE,
          ResultSet.CONCUR_UPDATABLE);
     
      if (product_name.equals("")){
        pstmt.setString(1, "%");
      } else{
        pstmt.setString(1, product_name);
      }
      
      rs = pstmt.executeQuery();
      
      if (rs.next()) {
        rs.absolute(absolutepage);
        int count = 0;

        while (count < counts) {
          ProductVO product = new ProductVO();
          //product.setPseq(rs.getInt(1));
          //product.setIndate(rs.getTimestamp(2));
          //product.setName(rs.getString(3));
          //product.setPrice1(rs.getInt(4));
          //product.setPrice2(rs.getInt(5));
          //product.setUseyn(rs.getString(6));
          //product.setBestyn(rs.getString(7));
          productList.add(product);
          if (rs.isLast()){
            break;
          }         
          rs.next();
          count++; 
        }
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      DBManager.close(con, pstmt, rs);
    }
    return productList;
  }
    
  public int insertProduct(ProductVO product) {
    int result = 0;

    String sql = "insert into product (" +
        "pseq, kind, name, price1, price2, price3, content, image) " +
        "values(product_seq.nextval, ?, ?, ?, ?, ?, ?, ?)";

    Connection con = null;
    PreparedStatement pstmt = null;
    
    try {
      con = DBManager.getConnection();
      pstmt = con.prepareStatement(sql);
      //pstmt.setString(1, product.getKind());      
      //pstmt.setString(2, product.getName());
      //pstmt.setInt(3, product.getPrice1());
      //pstmt.setInt(4, product.getPrice2());
      //pstmt.setInt(5, product.getPrice3());
      //pstmt.setString(6, product.getContent());
      //pstmt.setString(7, product.getImage());
      result = pstmt.executeUpdate();
    } catch (Exception e) {
      System.out.println("추가 실패");
      e.printStackTrace();
    } finally {
      DBManager.close(con, pstmt);
    }
    return result;
  }
 
  public int updateProduct(ProductVO product) {
    int result = -1;
    String sql = "update product set kind=?, useyn=?, name=?" +
        ", price1=?, price2=?, price3=?, content=?, image=?, bestyn=? " +
        "where pseq=?";
    
    Connection con = null;
    PreparedStatement pstmt = null;
    
    try {
      con = DBManager.getConnection();
      pstmt = con.prepareStatement(sql);
      //pstmt.setString(1, product.getKind());
      //pstmt.setString(2, product.getUseyn());
      //pstmt.setString(3, product.getName());
      //pstmt.setInt(4, product.getPrice1());
      //pstmt.setInt(5, product.getPrice2());
      //pstmt.setInt(6, product.getPrice3());
      //pstmt.setString(7, product.getContent());
      //pstmt.setString(8, product.getImage());
      //pstmt.setString(9, product.getBestyn());
      //pstmt.setInt(10, product.getPseq());
      result = pstmt.executeUpdate();
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      DBManager.close(con, pstmt);
    }
    return result;
  }
}
