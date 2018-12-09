package com.foy.pay;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;
import com.foy.mybatis.DAO;
import com.foy.vo.CustomerVO;

public class PayCompleteCommand implements Command {

   @Override
   public String exec(HttpServletRequest request, HttpServletResponse response) {
      int coupon_cnt = Integer.parseInt(request.getParameter("coupon_cnt"));
      int user_point = Integer.parseInt(request.getParameter("user_point"));
      int point = 0;
      String coupon = "yes";
      String user_id = request.getParameter("user_id");
      String user_pw = request.getParameter("user_pw");
      String result = request.getParameter("result");
      int tot_price = 0;
      try {
    	  
    	  tot_price = Integer.parseInt(request.getParameter("tot_price"));
      } catch(Exception e) {
    	  request.setAttribute("msg", "장바구니가 비었습니다. ㅠㅠ");
			request.setAttribute("url", "Main.jsp?user_id="+user_id+"&user_pw="+user_pw);
			return "return_loginpage.jsp"; //여기서 alert창 띄우고 바로 로그인 페이지로 자동 이동
      }
      int real_tot_price = 0;
      
      int discount = 0;

      try {
         coupon = request.getParameter("use_coupon");
      
      }catch (Exception e) {
         coupon = "no";
      }
      
      try {
          point = Integer.parseInt(request.getParameter("point"));
       
       }catch (Exception e) {
          point = 0;
       }
      
      if (coupon.equals("no")) {
         real_tot_price = (tot_price - point);
         user_point = user_point - point; // 쓰고 남은 잔액 적립금
         
         discount = tot_price - real_tot_price;
         System.out.println("discount1: " + discount);
         result = "2";
         
      } else { // 쿠폰을 사용한 경우

         real_tot_price = (int) ((tot_price - point) * 0.9);
         coupon_cnt = coupon_cnt - 1;
         user_point = user_point - point; // 쓰고 남은 잔액 적립금
         discount = tot_price - real_tot_price;
         System.out.println("discount2: " + discount);
         result = "2";
      }

      System.out.println("real_tot_price : " + real_tot_price);

      // CustomerVO vo = new CustomerVO();
      // vo.setUser_coupon_cnt(String.valueOf(coupon_cnt));
      // vo.setUser_point(String.valueOf(user_point));
      CustomerVO vo = new CustomerVO();
      vo.setUser_id(user_id);
      vo.setUser_pw(user_pw);

      vo = DAO.login(vo);

      System.out.println("주문자 정보 : " + vo);

      request.setAttribute("pvo", vo);
      request.setAttribute("user_id", user_id);
      request.setAttribute("user_pw", user_pw);
      request.setAttribute("real_tot_price", real_tot_price);
      request.setAttribute("user_coupon_cnt", coupon_cnt);
      request.setAttribute("user_point", user_point);
      request.setAttribute("discount", discount);
      request.setAttribute("result", result);

      System.out.println("point+use_coupon :" + point + coupon + tot_price);
      System.out.println("paycomplete 커맨드 넘어옴");
      System.out.println("할인적용 리절트: " + result);
      return "pay.jsp";
   }

}