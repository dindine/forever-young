package com.foy.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.vo.CustomerVO;

public class MainCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");

		System.out.println("****user_id1 : " + user_id);
		System.out.println("****user_pw1 : " + user_pw);
		
		request.getSession().setAttribute("user_id", user_id);
		request.getSession().setAttribute("user_pw", user_pw);
		return "Main.jsp";
	}

}
