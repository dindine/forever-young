package com.foy.userinfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;

public class CustomerDeleteFormCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		request.getSession().setAttribute("user_pw", user_id);
		request.getSession().setAttribute("user_pw", user_pw);

		return "cus_delete.jsp";
	}

}
