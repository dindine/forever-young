package com.foy.userinfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;
import com.foy.mybatis.DAO;
import com.foy.vo.CustomerVO;

public class UserInfoCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		request.getSession().setAttribute("user_id", user_id);
		request.getSession().setAttribute("user_pw", user_pw);
		CustomerVO vo = new CustomerVO();
		vo.setUser_id(user_id);
		vo.setUser_pw(user_pw);
		
		CustomerVO vo1 = new CustomerVO();		
		
		vo1 = DAO.login(vo);
		System.out.println("회원정보 : " +  vo1);
		
		request.getSession().setAttribute("vo", vo1);
		
		
		return "userinfo.jsp";
	}

}
