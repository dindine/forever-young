package com.foy.prodcut_command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;
import com.foy.mybatis.DAO;
import com.foy.vo.ProductOptVO;
import com.foy.vo.ProductVO;

public class ProductUpdateForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String cPage = request.getParameter("cPage");
		System.out.println("물건 수정 ===== > user: " + user_id + " pw:" + user_pw + "cPage : " +cPage);

		request.getSession().setAttribute("user_id", user_id);
		request.getSession().setAttribute("user_pw", user_pw);
		request.getSession().setAttribute("cPage", cPage);
		
		
		String p_no = request.getParameter("p_no");
		System.out.println("p_no : " + p_no);
		ProductVO vo = DAO.productOne(p_no);
		System.out.println("상품 정보 : " +  vo);
		
		List<String> optlist = DAO.optname(p_no);
		System.out.println("옵션 정보 : " +  optlist);
		
		List<ProductOptVO> volist = DAO.optList(p_no);
		System.out.println("옵션 정보 : " +  volist);
		int cnt = optlist.size() - 1;
		int i = 1;
		ProductOptVO optvo = new ProductOptVO();
		
		request.getSession().setAttribute("vo", vo); // request.getSession()으로 하여 세션 스코프에 저장할 수 있다.
		request.getSession().setAttribute("optvo", optvo); // request.getSession()으로 하여 세션 스코프에 저장할 수 있다.
		request.getSession().setAttribute("optlist", optlist); // request.getSession()으로 하여 세션 스코프에 저장할 수 있다.
		request.getSession().setAttribute("volist", volist); // request.getSession()으로 하여 세션 스코프에 저장할 수 있다.
		request.getSession().setAttribute("cnt", cnt); // request.getSession()으로 하여 세션 스코프에 저장할 수 있다.
		request.getSession().setAttribute("i", i); // request.getSession()으로 하여 세션 스코프에 저장할 수 있다.
		
		//카테고리 리스트
		List<String> list = DAO.getCategory();
		request.setAttribute("category_list", list);
		return "updateProduct.jsp";
	}

}
