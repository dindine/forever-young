package com.foy.pay;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;
import com.foy.mybatis.DAO;
import com.foy.vo.CartVO;
import com.foy.vo.CustomerVO;

public class BuyCommand implements Command {

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
		
		vo = DAO.login(vo);
		System.out.println("주문자 정보 : " + vo);
		String user_coupon_cnt = vo.getUser_coupon_cnt();
		String user_point = vo.getUser_point();

		request.setAttribute("user_id", user_id);
		request.setAttribute("user_pw", user_pw);
		
		//쿠폰과 적립금 존재여부
		int exits_coupon = Integer.parseInt(user_coupon_cnt);
		int result;
		
		if (exits_coupon > 0 ) {
			result = 1;
			request.getSession().setAttribute("result", result);
		} else {
			result = 0;
			request.getSession().setAttribute("result", result);
		}
		System.out.println("result : " + result);
		
		//장바구니에 넣지않고 바로 결제
		List<CartVO> list = new ArrayList<>();
		CartVO cvo = new CartVO();
		
		String tot_price = request.getParameter("p_saleprice");
		String p_name = request.getParameter("p_name");
		String p_opt_name = request.getParameter("opt");
		cvo.setP_no(request.getParameter("p_no"));
		cvo.setP_saleprice(tot_price);
		cvo.setCart_price(request.getParameter("p_price"));
		cvo.setCart_image(request.getParameter("p_ori_image"));
		cvo.setCart_cnt(1);
		cvo.setP_name(request.getParameter("p_name"));
		cvo.setP_opt_name(request.getParameter("opt"));
		
		
		list.add(cvo);
		System.out.println("바로 결제 list: " + list);
		request.getSession().setAttribute("c", list);
		request.getSession().setAttribute("tot_price", request.getParameter("p_saleprice"));

		
		request.getSession().setAttribute("pvo", vo);
		request.getSession().setAttribute("cvo", cvo);
		request.getSession().setAttribute("p_name", p_name);
		request.getSession().setAttribute("p_opt_name", p_opt_name);
		
		request.getSession().setAttribute("user_coupon_cnt", user_coupon_cnt);
		request.getSession().setAttribute("user_point", user_point);
		request.setAttribute("real_tot_price", tot_price);
		request.setAttribute("discount", 0 );
		return "pay.jsp";
		
	}

}
