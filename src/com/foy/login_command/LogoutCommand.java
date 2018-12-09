package com.foy.login_command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;

public class LogoutCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().invalidate(); //모든  세션을 초기화하겠다.
//		String user_id = request.getParameter("user_id");
//		String user_pw = request.getParameter("user_pw");
//		
//		request.setAttribute("", user_id);
//		request.setAttribute("", user_pw);
		return "mainIndex.jsp";
	}

}
