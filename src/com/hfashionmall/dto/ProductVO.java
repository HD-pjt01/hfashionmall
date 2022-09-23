package com.hfashionmall.dto;

import java.sql.Timestamp;
/**
 * 수정자              수정내용
 * -----------       -------------------------------
 * 정승하              ProductVO 정의
 */
public class ProductVO {
   
   private String product_code;
   private String product_name;
   private String product_brand;
   private String product_category;
   private int product_price;
   private String product_color;
   private String product_size;
   private String product_best;
   private Timestamp product_register;
   private Timestamp product_update;
   private int product_quantity;
   
   public String getProduct_brand() {
      return product_brand;
   }
   public void setProduct_brand(String product_brand) {
      this.product_brand = product_brand;
   }
   public String getProduct_category() {
      return product_category;
   }
   public void setProduct_category(String product_category) {
      this.product_category = product_category;
   }
   
   public String getProduct_code() {
      return product_code;
   }
   public void setProduct_code(String product_code) {
      this.product_code = product_code;
   }
   public String getProduct_name() {
      return product_name;
   }
   public void setProduct_name(String product_name) {
      this.product_name = product_name;
   }
   public int getProduct_price() {
      return product_price;
   }
   public void setProduct_price(int product_price) {
      this.product_price = product_price;
   }
   public String getProduct_color() {
      return product_color;
   }
   public void setProduct_color(String product_color) {
      this.product_color = product_color;
   }
   public String getProduct_size() {
      return product_size;
   }
   public void setProduct_size(String product_size) {
      this.product_size = product_size;
   }
   public String getProduct_best() {
      return product_best;
   }
   public void setProduct_best(String product_best) {
      this.product_best = product_best;
   }
   public Timestamp getProduct_register() {
      return product_register;
   }
   public void setProduct_register(Timestamp product_register) {
      this.product_register = product_register;
   }
   public Timestamp getProduct_update() {
      return product_update;
   }
   public void setProduct_update(Timestamp product_update) {
      this.product_update = product_update;
   }
   public int getProduct_quantity() {
      return product_quantity;
   }
   public void setProduct_quantity(int product_quantity) {
      this.product_quantity = product_quantity;
   }
   @Override
   public String toString() {
      return "ProductVO [product_code=" + product_code + ", product_name=" + product_name + ", product_brand="
            + product_brand + ", product_category=" + product_category + ", product_price=" + product_price
            + ", product_color=" + product_color + ", product_size=" + product_size + ", product_best="
            + product_best + ", product_register=" + product_register + ", product_update=" + product_update
            + ", product_quantity=" + product_quantity + "]";
   }
}