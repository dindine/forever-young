package com.foy.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.mybatis.DAO;
import com.foy.vo.ProductVO;

public class JSONCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// DB �����͸� ��ȸ�ؼ� JSON ������ ���ڿ��� ����� ����
		//List<ProductVO> list = DAO.getList();
		//JSON ������ ���ڿ� �ۼ�
		/**********************************
		 * JSON ������ ���ڿ� �ۼ� {Ű("key") : ���("value")}
		 
		 {"list" : [
		 		{"idx" : "idx��", 
		 		"name" : "name��",
		 		"age" : "age��",
		 		"addr" : "addr��",
		 		"regdate : "regdate"
		 		} ,{} ,{} ,{} ..... ,{}
		 	]}
		 **************************************/
		String result = "{\"list\" : [";
		
//		for (ProductVO vo :list) {
//			System.out.println("vo : " + vo);
//			
//			result += "{";
//			
//			result += "\"idx\" : \"" + vo.getIdx() +"\",";
//			result += "\"name\" : \"" + vo.getName() +"\",";
//			result += "\"age\" : \"" + vo.getAge() +"\",";
//			result += "\"addr\" : \"" + vo.getAddr() +"\",";
//			result += "\"regdate\" : \"" + vo.getRegdate() +"\"";
//			
//			result += "},";
//		}
		
		result = result.substring(0, result.length() - 1); // ���� �������� ,�� ����� ����

		result += "]}";
		
		System.out.println("result : " + result);
		return result;
	}

}
