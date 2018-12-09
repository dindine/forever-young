package com.foy.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.mybatis.DAO;
import com.foy.vo.ProductVO;



public class XMLCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// DB 데이터를 조회해서 XML 형태의 문자열을 만들고 리턴
				//List<ProductVO> list = DAO.getList();
				//XML 형태의 문자열 작성
				/**********************************
				 * XML 형태의 문자열 작성 {키("key") : 밸류("value")}
				 
				 <members>
					<member>
						<idx>1</idx>
						<name>홍길동1</name>
						<age>27</age>
						<addr>서울</addr>
						<regdate>2018/10/31</regdate>
					</member>
				</members>
				 **************************************/
				String result = "";
				result += "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
						
				result += "<members>";
				
//				for (ProductVO vo :list) {
//					System.out.println("vo : " + vo);
//					result += "<member>";
//										
//					result += "<idx>" + vo.getIdx() +"</idx>";
//					result += "<name>" + vo.getName() +"</name>";
//					result += "<age>" + vo.getAge() +"</age>";
//					result += "<addr>" + vo.getAddr() +"</addr>";
//					result += "<regdate>" + vo.getRegdate() +"</regdate>";
//					
//					result += "</member>";
//				}
				result += "</members>";
								
				System.out.println("result : " + result);
				return result;
	}

}
