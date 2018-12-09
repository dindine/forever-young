package com.foy.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.Join_command.IdchkCommand;
import com.foy.Join_command.JoinCommand;
import com.foy.Join_command.Join_formCommand;
import com.foy.answer_command.AnswerDeleteCommend;
import com.foy.answer_command.AnswerDeleteFormCommand;
import com.foy.answer_command.AnswerInsertCommand;
import com.foy.answer_command.AnswerListCommand;
import com.foy.answer_command.AnswerUpdateCommand;
import com.foy.answer_command.AnswerUpdateFormCommand;
import com.foy.board.BoardListCommand;
import com.foy.board.DeleteCommand;
import com.foy.board.ModifyCommand;
import com.foy.board.OneCommand;
import com.foy.board.WriteCommand;
import com.foy.board.YesornoCommand;
import com.foy.cart.AddcartCommand;
import com.foy.cart.CartCommand;
import com.foy.cart.DeletecartCommand;
import com.foy.cart.ModifycartCommand;
import com.foy.command.Command;
import com.foy.command.Customer_centerCommand;
import com.foy.command.MainCommand;
import com.foy.login_command.IndexCommand;
import com.foy.login_command.LoginCommand;
import com.foy.login_command.Login_formCommand;
import com.foy.login_command.LogoutCommand;
import com.foy.pay.BuyCommand;
import com.foy.pay.OrderCommand;
import com.foy.pay.PayCompleteCommand;
import com.foy.pay.PayUserInfoCommand;
import com.foy.pay.PaymentCommand;
import com.foy.prodcut_command.ProductCategoryCommand;
import com.foy.prodcut_command.ProductDeleteCommand;
import com.foy.prodcut_command.ProductListCommand;
import com.foy.prodcut_command.ProductOneCommand;
import com.foy.prodcut_command.ProductRegCommand;
import com.foy.prodcut_command.ProductRegForm;
import com.foy.prodcut_command.ProductSearchCommand;
import com.foy.prodcut_command.ProductUpdateCommand;
import com.foy.prodcut_command.ProductUpdateForm;
import com.foy.userinfo.CustomerDeleteCommand;
import com.foy.userinfo.CustomerDeleteFormCommand;
import com.foy.userinfo.CustomerUpdateCommand;
import com.foy.userinfo.CustomerUpdateFormCommand;
import com.foy.userinfo.UserInfoCommand;



@WebServlet("/MyCon")
public class MyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);

	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		
//		String idx = request.getParameter("idx");
//		System.out.println("idx ::: " + idx);
		
		
		String path = null;
		Command comm = null;
		
		if (type.equals("main")) {
			comm = new MainCommand();
		} else if (type.equals("join")) {
			comm = new JoinCommand();
		} else if (type.equals("idchk")) {
			comm = new IdchkCommand();
		} else if (type.equals("logout")) {
			comm = new LogoutCommand();
		} else if (type.equals("bList")) {
			comm = new BoardListCommand();
		} else if (type.equals("bOne")) {
			comm = new OneCommand();
		} else if (type.equals("b_write")) {
			comm = new WriteCommand();
		}  else if (type.equals("b_modify")) {
			comm = new ModifyCommand();
		} else if (type.equals("b_delete")) {
			comm = new DeleteCommand();
		} else if (type.equals("productReg")) {
			comm = new ProductRegCommand();
		} else if(type.equals("productReg_main")) {
			comm = new ProductRegForm();
		} else if(type.equals("productList")) {
			comm = new ProductListCommand();
		} else if(type.equals("productOne")) {
			comm = new ProductOneCommand();
		} else if(type.equals("updateProduct")) {
			comm = new ProductUpdateCommand();
		} else if(type.equals("updateProduct_main")) {
			comm = new ProductUpdateForm();
		} else if(type.equals("deleteProduct")) {
			comm = new ProductDeleteCommand();
		} else if (type.equals("answer_insert")) {
			comm = new AnswerInsertCommand();
		} else if (type.equals("answer_delete")) {
			comm = new AnswerDeleteCommend();
		} else if (type.equals("answer_delete_form")) {
			comm = new AnswerDeleteFormCommand();
		} else if (type.equals("anwser_list")) {
			comm = new AnswerListCommand();
		} else if (type.equals("answer_update")) {
			comm = new AnswerUpdateCommand();
		} else if (type.equals("answer_update_form")) {
			comm = new AnswerUpdateFormCommand();
		} else if(type.equals("index")) {
			comm = new IndexCommand();
		}	else if (type.equals("login")) {
			comm = new LoginCommand();
		} else if(type.equals("customer_update")) {
			comm = new CustomerUpdateCommand();
		} else if(type.equals("customer_update_form")) {
			comm = new CustomerUpdateFormCommand();
		} else if(type.equals("userinfo")) {
			comm = new UserInfoCommand();
		} else if(type.equals("customer_delete")) {
			comm = new CustomerDeleteCommand();
		} else if(type.equals("customer_delete_form")) {
			comm = new CustomerDeleteFormCommand();
		} else if (type.equals("cartlist")) {
			comm = new CartCommand();
		} else if (type.equals("addcart")) {
			comm = new AddcartCommand();
		} else if (type.equals("deletecart")) {
			comm = new DeletecartCommand();
		} else if (type.equals("modifycart")) {
			comm = new ModifycartCommand();
		} else if (type.equals("pay_go")) {
			comm = new PayUserInfoCommand();
		} else if (type.equals("pay_complete")) {
	    	comm = new PayCompleteCommand();
		} else if (type.equals("payment")) {
		    comm = new PaymentCommand();
		} else if(type.equals("category")) {
			comm = new ProductCategoryCommand();
		} else if(type.equals("product_search")) {
			comm = new ProductSearchCommand();
		} else if (type.equals("order_info")) {
		    comm = new OrderCommand();
		} else if (type.equals("buyProduct")) {
		    comm = new BuyCommand();
		} else if (type.equals("yesorno")) {
		    comm = new YesornoCommand();
		} else if (type.equals("join_form")) {
		    comm = new Join_formCommand();
		} else if (type.equals("login_form")) {
		    comm = new Login_formCommand();
		} else if (type.equals("customer_center")) {
		    comm = new Customer_centerCommand();
		}
		path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}

}
