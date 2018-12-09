package com.foy.pay;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;
import com.foy.mybatis.DAO;
import com.foy.vo.PayVO;

public class OrderCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String path = "";
	System.out.println("OrderCommand로 넘어옴");
	System.out.println("로그인 아이디를 바탕으로 주문자 정보 받아오기");
	
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	System.out.println("****user_id : " + user_id);
	System.out.println("****user_pw : " + user_pw);
	
	
	
	
	List<PayVO> b_list = DAO.bill_info(user_id);
	System.out.println("b_list : " + b_list);
	request.getSession().setAttribute("b_list", b_list);
	request.getSession().setAttribute("user_id",	user_id);
	request.getSession().setAttribute("user_pw",	user_pw);
	
	return "jumunseo.jsp";
	
	}
}
