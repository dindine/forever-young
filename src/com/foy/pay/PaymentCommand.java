package com.foy.pay;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;
import com.foy.mybatis.DAO;
import com.foy.vo.CartVO;
import com.foy.vo.CustomerVO;
import com.foy.vo.PayVO;

public class PaymentCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String user_coupon_cnt = request.getParameter("user_coupon_cnt");
		int user_point = Integer.parseInt(request.getParameter("user_point"));
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_name = request.getParameter("user_name2");
		String user_phone = request.getParameter("user_phone2");
		String user_addr = request.getParameter("user_addr2");
		String p_opt_name = request.getParameter("p_opt_name");
		String p_name = request.getParameter("p_name");
		//CartVO cvo  = (CartVO) request.getSession().getAttribute("cvo");
		//List<CartVO> list = (List) request.getSession().getAttribute("c_list");
		
		System.out.println("바로 결제 구매 내역 : " + p_name + p_opt_name);
		int real_tot_price = Integer.parseInt(request.getParameter("real_tot_price"));
		
		
		//최종 금액의 3% 적립
		user_point = (int) (user_point + (real_tot_price * 0.03));
		System.out.println("최종 금액의 3% 적립 : " +user_point);
		
		String p_idx = request.getParameter("p_idx");
		List<CartVO> list = DAO.cartlist(user_id);
		
		System.out.println("최종 결제 list : " + list);
		System.out.println("coupon_cnt : " + user_coupon_cnt + user_id + user_pw);
		
		String pay_p_name = "";
		for (CartVO cartvo : list) {
			
			pay_p_name += cartvo.getP_name() + "-" + cartvo.getP_opt_name() + " ";
		}
		
		System.out.println("pay_p_name : " + pay_p_name);
		if(pay_p_name == "") {
			pay_p_name += p_name + "-" + p_opt_name + " ";	
		}
		CustomerVO login_info = new CustomerVO();
		login_info.setUser_id(user_id);
		login_info.setUser_pw(user_pw);
		login_info = DAO.login(login_info);
		
		int user_tot_pur = Integer.parseInt(login_info.getUser_tot_pur());
		System.out.println("결제 전 유저의 총 구매 금액 : " + user_tot_pur);
		System.out.println("결제 후 유저의 총 구매 금액 : " + (real_tot_price + user_tot_pur));
		System.out.println("결제 전 유저의 총 쿠폰 : " + user_coupon_cnt);
		System.out.println("결제 후 유저의 총 쿠폰 : " + user_coupon_cnt);
		
		System.out.println("최종 pay_p_name : " + pay_p_name);
		CustomerVO vo = new CustomerVO();
		vo.setUser_point(String.valueOf(user_point));
		vo.setUser_coupon_cnt(user_coupon_cnt);
		vo.setUser_id(user_id);
		vo.setUser_tot_pur(String.valueOf(real_tot_price + user_tot_pur));
		DAO.use_coupon_point(vo); //쿠폰, 적립금 사용 후 업데이트
		
		
		DAO.pay_deletecart(user_id);
		
		
		//총구매액에 따라 등급 및 쿠폰 부여
		CustomerVO cvo = new CustomerVO();
		cvo.setUser_id(user_id);
		cvo.setUser_pw(user_pw);
		cvo = DAO.login(cvo);
		
		int tot_pur = Integer.parseInt(cvo.getUser_tot_pur());
		
		System.out.println("총 구매 금액 : " + tot_pur);
		String grade;
		int c_cnt; //추가될 쿠폰
		if (0 < tot_pur && tot_pur < 50000) {
			grade = "WELCOME";
			c_cnt = 0;
		} else if(50000 < tot_pur && tot_pur < 100000) {
			grade = "SILVER";
			c_cnt = 1;
		}  else if(100000 < tot_pur && tot_pur < 500000) {
			grade = "GOLD";
			c_cnt = 2;
		} else if(500000 < tot_pur && tot_pur < 1000000) {
			grade = "VIP";
			c_cnt = 3;
		} else {
			grade = "VVIP";
			c_cnt = 4;
		}
		
		System.out.println("grade : " + grade + " c_cnt :" + c_cnt);
		DAO.updateGrade(user_id, String.valueOf(c_cnt), grade);
		
		
		PayVO pvo = new PayVO();
		pvo.setPay_p_name(pay_p_name);
		pvo.setPay_tot_price(String.valueOf(real_tot_price));
		pvo.setUser_id(user_id);
		pvo.setUser_payment(p_idx);
		
		pvo.setUser_addr(user_addr);
		pvo.setUser_name(user_name);
		pvo.setUser_phone(user_phone);
		DAO.save_bill(pvo);
		
		System.out.println("pvo : " + pvo);
		request.setAttribute("pvo",	pvo);
		request.setAttribute("user_id",	user_id);
		request.setAttribute("user_pw",	user_pw);

		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy.MM.dd HH:mm:ss", Locale.KOREA );
		Date currentTime = new Date ();
		String pay_date = mSimpleDateFormat.format ( currentTime );
		request.setAttribute("pay_date",	pay_date);

//		List<PayVO> b_list = DAO.bill_info(user_id);
//		request.setAttribute("b_list", b_list);
		return "bill.jsp?user_id="+user_id+"&user_pw="+user_pw;
		
		
	}

}
