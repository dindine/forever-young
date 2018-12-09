package com.foy.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;
import com.foy.mybatis.DAO;

public class YesornoCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		int good_cnt = Integer.parseInt(request.getParameter("like_cnt"));
		String good = request.getParameter("like_cnt");
		String bad = request.getParameter("no_cnt");
		int bad_cnt = Integer.parseInt(request.getParameter("no_cnt"));
		String b_idx = request.getParameter("b_idx");
		String cPage = request.getParameter("cPage");
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String p_no = request.getParameter("p_no");
		
		DAO.update_l_b(good,bad, b_idx);
		
		return "MyCon?type=productOne&cPage="+cPage+"&b_idx=" + b_idx + "&user_id=" + user_id + "&user_pw=" + user_pw + "&p_no=" + p_no;
	}

}
