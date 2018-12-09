package com.foy.Join_command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;

public class Join_formCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
//		String user_id = request.getParameter("user_id");
		String chk_id = request.getParameter("user_id");
		//String user_pw = request.getParameter("user_pw");
		
		request.setAttribute("chk_id", chk_id);
		//request.setAttribute("user_id", user_id);
		//request.setAttribute("user_pw", user_pw);
		return "join.jsp";
	}

}
