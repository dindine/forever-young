package com.foy.login_command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;

public class IndexCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		request.setAttribute("user_id", user_id);
		request.setAttribute("user_pw", user_pw);
		//return "index2.jsp";
		return "MyCon?type=productList";
	}

}
