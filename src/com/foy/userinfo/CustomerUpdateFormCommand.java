package com.foy.userinfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;
import com.foy.mybatis.DAO;
import com.foy.vo.CustomerVO;

public class CustomerUpdateFormCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_name = request.getParameter("user_name");
		String user_addr = request.getParameter("user_addr");
		String user_phone = request.getParameter("user_phone");
		String user_email = request.getParameter("user_email");
		String user_grade = request.getParameter("user_grade");
		String user_point = request.getParameter("user_point");
		String user_coupon_cnt = request.getParameter("user_coupon_cnt");
		String user_tot_pur = request.getParameter("user_tot_pur");
		
		CustomerVO vo = new CustomerVO();
		vo.setUser_id(user_id);
		vo.setUser_pw(user_pw);
		
		CustomerVO vo1 = new CustomerVO();
		vo1 = DAO.login(vo);
		
//		vo1.setUser_id(user_id);
//		vo1.setUser_pw(user_pw);
//		vo1.setUser_name(user_name);
//		vo1.setUser_addr(user_addr);
//		vo1.setUser_phone(user_phone);
//		vo1.setUser_email(user_email);
//		vo1.setUser_grade(user_grade);
//		vo1.setUser_point(user_point);
//		vo1.setUser_coupon_cnt(user_coupon_cnt);
//		vo1.setUser_tot_pur(user_tot_pur);
		
		System.out.println("기존 회원정보 vo : " + vo1);
		
		//vo = DAO.login(vo);
		
//		request.setAttribute("user_id", user_id);
//		request.setAttribute("user_pw", user_pw);
//		request.setAttribute("user_name", user_name);
//		request.setAttribute("user_addr", user_addr);
//		request.setAttribute("user_phone", user_phone);
//		request.setAttribute("user_email", user_email);
//		request.setAttribute("user_grade", user_grade);
//		request.setAttribute("user_point", user_point);
//		request.setAttribute("user_coupon_cnt", user_coupon_cnt);
//		request.setAttribute("user_tot_pur", user_tot_pur);
		
		request.setAttribute("vo", vo1);
			
		return "cus_update.jsp";
	}

}
