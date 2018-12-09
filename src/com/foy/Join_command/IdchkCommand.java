package com.foy.Join_command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;
import com.foy.mybatis.DAO;

public class IdchkCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String existId = DAO.pwchk(id);
		if(existId == null) {
			String url = "MyCon?type=join_form&user_id=" + id;
			request.setAttribute("msg", "사용 할 수 있는 아이디 입니다.");
			request.setAttribute("url", url);
			request.setAttribute("id", id);
		} else if(existId != null){
			request.setAttribute("msg", "이미 존재 하는 아이디 입니다.");
			request.setAttribute("url", "join.jsp");
		}
		
		return "return_loginpage.jsp"; //여기서 alert창 띄우고 바로 로그인 페이지로 자동 이동
	}

}
