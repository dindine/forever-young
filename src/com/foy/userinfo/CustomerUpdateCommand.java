package com.foy.userinfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;
import com.foy.mybatis.DAO;
import com.foy.vo.CustomerVO;

public class CustomerUpdateCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String chk = request.getParameter("customer_update");
		String user_id = request.getParameter("user_id");
		System.out.println("user_id : " + user_id);
		
		if (chk != null) {
		
			//전달받은 값을 DB에 수정처리
			CustomerVO vo = new CustomerVO();
			vo.setUser_id(request.getParameter("user_id"));
			vo.setUser_pw(request.getParameter("user_pw"));
			vo.setUser_name(request.getParameter("user_name"));
			vo.setUser_addr(request.getParameter("user_addr"));
			vo.setUser_phone(request.getParameter("user_phone"));
			vo.setUser_email(request.getParameter("user_email"));
			vo.setUser_grade(request.getParameter("user_grade"));
			vo.setUser_point(request.getParameter("user_point"));
			vo.setUser_coupon_cnt(request.getParameter("user_coupon_cnt"));
			vo.setUser_tot_pur(request.getParameter("user_tot_pur"));
			
			System.out.println("수정된 vo : " + vo);
			DAO.customer_update(vo);
		
		}
		return "MyCon?type=userinfo";
	}

}
