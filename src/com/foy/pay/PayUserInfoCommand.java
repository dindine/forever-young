package com.foy.pay;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;
import com.foy.mybatis.DAO;
import com.foy.vo.CartVO;
import com.foy.vo.CustomerVO;

public class PayUserInfoCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("로그인 아이디를 바탕으로 주문자 정보 받아오기");
		System.out.println("----------PayCommand 넘어옴");
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");

		System.out.println("****user_id : " + user_id);
		System.out.println("****user_pw : " + user_pw);

		
		
		CustomerVO vo = new CustomerVO();
		vo.setUser_id(user_id);
		vo.setUser_pw(user_pw);
		
		request.setAttribute("user_id", user_id);
		request.setAttribute("user_pw", user_pw);
		
		//장바구니의 정보
		int tot_price = DAO.totalprice(user_id);
		
		List<CartVO> list = DAO.cartlist(user_id);
		
		System.out.println("list: " + list);
		request.getSession().setAttribute("c", list);
		request.getSession().setAttribute("tot_price", tot_price);
		
		vo = DAO.login(vo);
		
		System.out.println("주문자 정보 : " + vo);
		String user_coupon_cnt = vo.getUser_coupon_cnt();
		String user_point = vo.getUser_point();
		
		int exits_coupon = Integer.parseInt(user_coupon_cnt);
		int result;
		
		if (exits_coupon > 0 ) {
			result = 1;
			request.setAttribute("result", result);
		} else {
			result = 0;
			request.setAttribute("result", result);
		}
		System.out.println("result : " + result);
		
		request.getSession().setAttribute("pvo", vo);
		
		request.getSession().setAttribute("user_coupon_cnt", user_coupon_cnt);
		request.getSession().setAttribute("user_point", user_point);
		request.setAttribute("real_tot_price", tot_price);
		request.setAttribute("discount", 0 );
		return "pay.jsp";
		
	}

}
