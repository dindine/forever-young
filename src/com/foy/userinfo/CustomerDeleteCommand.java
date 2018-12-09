package com.foy.userinfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;
import com.foy.mybatis.DAO;

public class CustomerDeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//String chk = request.getParameter("customer_delete");
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");

		DAO.customer_delete(user_id);
		
		request.getSession().invalidate(); //모든  세션을 초기화하겠다.

		return  "Main.jsp";
	}
}