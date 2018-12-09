package com.foy.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Customer_centerCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		request.setAttribute("user_id", user_id);
		request.setAttribute("user_pw", user_pw);
		return "customer_center.jsp";
	}

}
