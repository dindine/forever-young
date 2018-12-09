package com.foy.prodcut_command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;
import com.foy.mybatis.DAO;
import com.foy.vo.ProductVO;

public class ProductRegForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		List<String> list = DAO.getCategory();
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String p_category = request.getParameter("p_category");
		System.out.println("물건 등록 ===== > user: " + user_id + " pw:" + user_pw + "p_category :" + p_category);

		request.getSession().setAttribute("user_id", user_id);
		request.getSession().setAttribute("user_pw", user_pw);
		request.getSession().setAttribute("p_category", p_category);
		request.setAttribute("category_list", list);
		return "ProductReg.jsp";
	}

}
