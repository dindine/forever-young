package com.foy.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;
import com.foy.mybatis.DAO;


public class DeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String path = null;
		String chk = request.getParameter("delete_chk");
		String b_idx = request.getParameter("b_idx");
		String p_no = request.getParameter("p_no");
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String cPage = request.getParameter("cPage");
		try {
			
			
			
			System.out.println("chk : " + chk + " b_idx: " + b_idx + " user_id: " + user_id + " user_pw: " + user_pw + " p_no : " + p_no);
			if (chk == null) {
				path = "delete.jsp";
			} else {
				//전달받은 idx값과 일치하는 데이타 DB에 삭제처리
				DAO.b_delete(b_idx);
				
				path = "MyCon?type=productOne&cPage="+cPage+"&b_idx=" + b_idx + "&user_id=" + user_id + "&user_pw=" + user_pw + "&p_no=" + p_no;
			}
			
		} catch(Exception e) {
			e.printStackTrace();

			path = "MyCon?type=productOne&cPage="+cPage+"&b_idx=" + b_idx + "&user_id=" + user_id + "&user_pw=" + user_pw + "&p_no=" + p_no;

			request.setAttribute("msg", "리뷰 삭제가 실패 되었습니다.");
			request.setAttribute("url", path);
			return "return_loginpage.jsp"; //여기서 alert창 띄우고 바로 로그인 페이지로 자동 이동
		}
		request.setAttribute("msg", "리뷰 삭제가 완료 되었습니다.");
		request.setAttribute("url", path);
		return "return_loginpage.jsp"; //여기서 alert창 띄우고 바로 로그인 페이지로 자동 이동
		//return path;
	}

}
