package com.foy.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;
import com.foy.mybatis.DAO;
import com.foy.vo.CartVO;
import com.foy.vo.ProductOptVO;

public class AddcartCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		
		String p_no = request.getParameter("p_no");
		String p_name = request.getParameter("p_name");
		String p_saleprice = request.getParameter("p_saleprice");
		String p_price = request.getParameter("p_price");
		String p_ori_name = request.getParameter("p_ori_image");
		String p_opt_name = request.getParameter("opt");
		
		if (p_opt_name == null || p_opt_name == "") {
			p_opt_name = "없음";
		}
		
		System.out.println("옵션 넘버 : " + p_opt_name );
		String p_opt_no = DAO.optList_no(p_no, p_opt_name);
		
		
		System.out.println("p_opt_no : " + p_opt_no);		
		int amount = 0;
		try {			
			amount = DAO.productcnt(user_id, p_no, p_opt_no); //동일 제품이 있을경우 카운트 세기
			DAO.updatecart(p_no,user_id, p_opt_no);
			DAO.cntprice(p_no, p_opt_no);
		} catch(Exception e) {
			CartVO vo = new CartVO(); 
			vo.setCart_cnt(1);
			vo.setCart_image(p_ori_name);
			vo.setCart_price(p_price);
			vo.setP_no(p_no);
			vo.setCart_tot_price(p_saleprice);
			vo.setP_name(p_name);
			vo.setP_saleprice(p_saleprice);
			vo.setUser_id(user_id);
			vo.setP_opt_name(p_opt_name);
			vo.setP_opt_no(p_opt_no);
			System.out.println("cart vo: " + vo);
			DAO.addproduct(vo);
		}
		//DB에서 해당 아이디에 담아있는 카트 조회
		List<CartVO> list = DAO.cartlist(user_id); 
		System.out.println("amount : " + amount);
		
		request.getSession().setAttribute("user_id", user_id);
		request.getSession().setAttribute("user_pw", user_pw);
		
		return "MyCon?type=cartlist";

	}

}
