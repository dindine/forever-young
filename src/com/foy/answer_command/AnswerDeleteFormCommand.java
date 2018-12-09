package com.foy.answer_command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;

public class AnswerDeleteFormCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String pwd = request.getParameter("pwd");
		String c_idx = request.getParameter("c_idx");
		
		request.getSession().setAttribute("pwd", pwd);
		request.getSession().setAttribute("c_idx", c_idx);

		return "ans_delete.jsp";
	}

}
