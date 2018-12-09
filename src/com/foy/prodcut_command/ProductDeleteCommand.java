package com.foy.prodcut_command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;
import com.foy.mybatis.DAO;

public class ProductDeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String path;
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String cPage = request.getParameter("cPage");
		String p_category = request.getParameter("p_category");
		System.out.println("p_category : " + p_category);
		System.out.println("물건 삭제 ===== > user: " + user_id + " pw:" + user_pw + " cPage : " + cPage);
		
		request.getSession().setAttribute("user_id", user_id);
		request.getSession().setAttribute("user_pw", user_pw);
		request.getSession().setAttribute("cPage", cPage);
		request.getSession().setAttribute("p_category", p_category);
		
		String p_no = request.getParameter("p_no");
		request.getSession().setAttribute("p_no", p_no);
		System.out.println("삭제할때, p_no : " + p_no);
		try {


			DAO.deleteProudct(p_no);
			
			request.setAttribute("msg", "물건 삭제가 완료되었습니다.");
			request.setAttribute("url", "MyCon?type=category&user_id=" + user_id + "&user_pw=" + user_pw + "&p_category=" + p_category);
			path = "return_loginpage.jsp"; //여기서 alert창 띄우고 바로 로그인 페이지로 자동 이동
		} catch (Exception e) {
			e.printStackTrace();

			request.setAttribute("msg", "물건 삭제가 불가능 합니다.");
			request.setAttribute("url", "MyCon?type=category&user_id=" + user_id + "&user_pw=" + user_pw + "&p_category=" + p_category);
			path = "return_loginpage.jsp"; //여기서 alert창 띄우고 바로 로그인 페이지로 자동 이동
		}
		
		return path;
	}

}
