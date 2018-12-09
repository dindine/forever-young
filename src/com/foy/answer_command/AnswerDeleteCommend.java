package com.foy.answer_command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;
import com.foy.mybatis.DAO;

public class AnswerDeleteCommend implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String idx = request.getParameter("c_idx");
		String pwd = request.getParameter("pwd");
		String p_no = request.getParameter("p_no");
		String cPage = request.getParameter("cPage");
		String user_id = request.getParameter("writer");
		String user_pw = request.getParameter("pwd");
		
		DAO.delete(idx);

		request.getSession().setAttribute("pwd", pwd);
		return "MyCon?type=productOne&cPage="+ cPage +"&user_id="+user_id+"&user_pw="+user_pw+"&p_no="+p_no;
	}
}
