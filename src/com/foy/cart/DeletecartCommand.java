package com.foy.cart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;
import com.foy.mybatis.DAO;

public class DeletecartCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("command로 넘어옴");
		
		
		String cart_idx = request.getParameter("cart_idx");
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		System.out.println("cart_idx 췍 : "+ cart_idx +"user_id 췍 : "+ user_id+"user_pw 췍 : "+ user_pw);
		
		
		DAO.deletecart(cart_idx);
		request.getSession().setAttribute("user_id", user_id);
		request.getSession().setAttribute("user_pw", user_pw);		
		request.setAttribute("cart_idx", cart_idx);
		
		return "MyCon?type=cartlist&user_id="+user_id;
	}

}
