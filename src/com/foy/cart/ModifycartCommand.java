package com.foy.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.foy.command.Command;
import com.foy.mybatis.DAO;
import com.foy.vo.CartVO;

public class ModifycartCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("modify로 넘어옴");
		
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		request.getSession().setAttribute("user_id", user_id);
		request.getSession().setAttribute("user_pw", user_pw);
		
		
		
		
		List<CartVO> c_list = (List) request.getSession().getAttribute("c_list");
		int cnt = c_list.size();
		System.out.println("c_list :" + request.getParameter("c_list"));
		System.out.println("cnt : " +  cnt);
		
		
		//for(int i = 0; i < cnt; i++) {
			

//		String cart_cnt = request.getParameter("cart_cnt");
//		String user_id = request.getParameter("user_id");
//		String p_no = request.getParameter("p_no");
//		String cart_idx = request.getParameter("cart_idx");
		
		
		
//			String cart_cnt = request.getParameter("cart_cnt");
//			String user_id = request.getParameter("user_id");
//			String p_no = request.getParameter("p_no");
//			String cart_idx = request.getParameter("cart_idx");
//			System.out.println("cart_cnt 뿅 : " + cart_cnt + " user_id 뿅 : " + user_id + " p_no : " + p_no + " cart_idx : " + cart_idx);
//			System.out.println("혹시! 여기는 모디파위: " + request.getParameter("cart_idx"));
//			CartVO vo = new CartVO();
//			
//			vo.setUser_id(user_id);
//			vo.setCart_cnt(Integer.parseInt(cart_cnt));
//			vo.setP_no(p_no);
//			vo.setCart_idx(cart_idx);
//			
//			System.out.println("수정할 vo : " + vo);
//			DAO.modifycart(vo);
//			System.out.println("vo 뿅  :" + vo);
//			
//			//request.setAttribute("cart_cnt["+i+"]", cart_cnt);
//			request.setAttribute("user_id", user_id);
//			//request.setAttribute("p_no["+i+"]", p_no);
		
		for(int i = 0; i<cnt; i++) {
			String cart_cnt = request.getParameter("cart_cnt[" + i +"]");
			//String user_id = request.getParameter("user_id");
			String p_no = request.getParameter("p_no[" + i +"]");
			String cart_idx = request.getParameter("cart_idx[" + i +"]");
			System.out.println("혹시! 여기는 모디파위: " + request.getParameter("cart_idx[" + i +"]"));
			CartVO vo = new CartVO();
			
			vo.setUser_id(user_id);
			vo.setCart_cnt(Integer.parseInt(cart_cnt));
			vo.setP_no(p_no);
			vo.setCart_idx(cart_idx);
			
			System.out.println("수정할 vo : " + vo);
			DAO.modifycart(vo);
			System.out.println("vo 뿅  :" + vo);
			
			//request.setAttribute("cart_cnt["+i+"]", cart_cnt);
			request.getSession().setAttribute("user_id", user_id);
			//request.setAttribute("p_no["+i+"]", p_no);
		}
		
		
//		vo.setCart_idx(request.getParameter("cart_idx"));
//		vo.setCart_image(request.getParameter("cart_image"));
//		vo.setCart_price(request.getParameter("cart_price"));
//		vo.setCart_tot_price(request.getParameter("cart_tot_price"));
//		
		
		//}
		
		return "MyCon?type=cartlist";
		
		
		
	}

}
