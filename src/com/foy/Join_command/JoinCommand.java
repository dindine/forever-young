package com.foy.Join_command;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;
import com.foy.mybatis.DAO;
import com.foy.vo.UserVO;

public class JoinCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		//String path = null;
		//전달받은 값을 DB에 입력처리
		String fulladdr = "";
		fulladdr +=	request.getParameter("addr1");
		fulladdr +=	" ";
		fulladdr +=	request.getParameter("addr2");
		fulladdr +=	" ";
		fulladdr +=	request.getParameter("addr3");
		
		System.out.println("fulladdr : " + fulladdr);
		UserVO vo = new UserVO();
		vo.setUser_id(request.getParameter("id"));
		vo.setUser_name(request.getParameter("name"));
		vo.setUser_email(request.getParameter("email"));
		vo.setUser_addr(fulladdr);
		vo.setUser_phone(request.getParameter("phone"));
		vo.setUser_pw(request.getParameter("pw"));
		DAO.insert(vo);

		request.setAttribute("msg", "회원 가입이 완료되었습니다.");
		request.setAttribute("url", "Main.jsp");
		//여기서 alert창 띄우고 바로 로그인 페이지로 자동 이동
		
		return "return_loginpage.jsp"; 
	}

}
