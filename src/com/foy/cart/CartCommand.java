package com.foy.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;
import com.foy.mybatis.DAO;
import com.foy.vo.CartVO;
import com.foy.vo.CustomerVO;
import com.foy.vo.ProductVO;

public class CartCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//전달받는 ID 값으로
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		request.getSession().setAttribute("user_id", user_id);
		request.getSession().setAttribute("user_pw", user_pw);
		
		CustomerVO vo = new CustomerVO();
		vo.setUser_id(user_id);
		vo.setUser_pw(user_pw);
		
		vo = DAO.login(vo);
		request.getSession().setAttribute("vo", vo);
		
		System.out.println("user_id : " + user_id);
		String p_no = request.getParameter("p_no");
		
		//int amount = DAO.productcnt(user_id, p_no);
		//DB에서 해당 아이디에 담아있는 카트 조회
		int tot_price = DAO.totalprice(user_id);
		
		//int cnt_price = DAO.cntprice(p_no);
		List<CartVO> list = DAO.cartlist(user_id); 
		int cart_cnt = list.size();
		
		for(int i = 0; i<cart_cnt; i++) {
			
			System.out.println("혹시! : " + request.getParameter("cart_idx[" + i +"]"));
		}
		
		
		System.out.println("cart command list : " + list);
		
		//응답페이지에서 사용할 수 있도록 속성에 저장
		request.getSession().setAttribute("c_list", list);
		request.setAttribute("tot_price", tot_price);
		request.setAttribute("cart_cnt", cart_cnt);
		
		
		return "cartList.jsp";
	}

}
