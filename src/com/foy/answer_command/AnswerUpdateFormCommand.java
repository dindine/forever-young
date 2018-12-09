package com.foy.answer_command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;

public class AnswerUpdateFormCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		//로그인 정보 저장
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		System.out.println("user: " + user_id + " pw:" + user_pw);

		request.getSession().setAttribute("user_id", user_id);
		request.getSession().setAttribute("user_pw", user_pw);
		
		
		String writer = request.getParameter("writer");
		String write_date = request.getParameter("write_date");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");
		String c_idx = request.getParameter("c_idx");
		 
		request.setAttribute("writer", writer);
		request.setAttribute("write_date", write_date);
		request.setAttribute("content", content);
		request.getSession().setAttribute("pwd", pwd);
		request.getSession().setAttribute("c_idx", c_idx);

		return "ans_update.jsp";
	}

}
