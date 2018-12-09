package com.foy.login_command;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;
import com.foy.mybatis.DAO;
import com.foy.vo.CustomerVO;



public class LoginCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String path = "";
		PrintWriter out;
		String chk = request.getParameter("logchk");
		response.setContentType("text/html; charset=UTF-8");
		if (chk == null) {
			return "login.jsp";
		} else {

			try {
				out = response.getWriter();
				//전달받은 id값 추출
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				System.out.println("user: " + id + "pw:" + pw);
				
				request.getSession().setAttribute("user_id", id);
				request.getSession().setAttribute("user_pw", pw);
				
				String pwchk = DAO.pwchk(id);
				if (pw.equals(pwchk)) {
					CustomerVO vo = new CustomerVO();
					vo.setUser_id(id);
					vo.setUser_pw(pw);
					vo = DAO.login(vo);
					String user_grade = vo.getUser_grade();
					request.getSession().setAttribute("user_grade", user_grade);
					request.getSession().setAttribute("ForeverYoungVO", vo);

					path =  "Main.jsp?user_id="+id + "&user_pw=" + pw;
				} else {

					request.setAttribute("msg", "비밀번호를 다시 입력해 주세요.");
					request.setAttribute("url", "login.jsp");
					path = "return_loginpage.jsp"; //여기서 alert창 띄우고 바로 로그인 페이지로 자동 이동
					
				}
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		
			return path;
		}
	}
			


}





