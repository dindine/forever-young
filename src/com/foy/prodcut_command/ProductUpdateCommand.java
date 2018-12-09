package com.foy.prodcut_command;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;
import com.foy.mybatis.DAO;
import com.foy.vo.ProductOptVO;
import com.foy.vo.ProductVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProductUpdateCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String path = null;
		try {

			String filepath = request.getSession().getServletContext().getRealPath("/upload");

			MultipartRequest mr = new MultipartRequest(request, filepath, 10 * 1024 * 1024, "UTF-8",
					new DefaultFileRenamePolicy());

			// 전달받은 값을 DB에 입력처리

			ProductVO vo = new ProductVO();
			String p_no = mr.getParameter("p_no");
			System.out.println("p_no update쪽 : " + p_no);
			vo.setP_no(mr.getParameter("p_no"));
			// vo.setP_category(mr.getParameter("p_category"));
			vo.setP_content(mr.getParameter("p_content"));
			vo.setP_name(mr.getParameter("p_name"));
			vo.setP_price(Integer.parseInt(mr.getParameter("p_price")));
			vo.setP_salerate(Integer.parseInt(mr.getParameter("p_salerate")));

			// 세일가격 측정
			int p_salerate = Integer.parseInt(mr.getParameter("p_salerate"));
			int p_price = Integer.parseInt(mr.getParameter("p_price"));

			int p_saleprice = getPercent(p_price, p_salerate); // 할인가격 측정 메서드
			vo.setP_saleprice(p_saleprice);

			
			String p_ori_file_name = mr.getParameter("p_ori_file_name");
			// 첨부파일 처리
			if (mr.getFile("p_file_name") != null) {
				vo.setP_new_image(mr.getFilesystemName("p_file_name"));
				vo.setP_ori_image(mr.getOriginalFileName("p_file_name"));
			} else {
				vo.setP_new_image(p_ori_file_name); // 실제저장시 사용된 파일명
				vo.setP_ori_image(p_ori_file_name); // 원본 파일명
			}

			System.out.println("수정된 vo : " + vo);
			DAO.updateProduct(vo);

			String user_id = mr.getParameter("user_id");
			String user_pw = mr.getParameter("user_pw");
			String cPage = mr.getParameter("cPage");
			System.out.println("물건 수정 ===== > user: " + user_id + " pw:" + user_pw + " cPage : " + cPage);

			request.getSession().setAttribute("user_id", user_id);
			request.getSession().setAttribute("user_pw", user_pw);
			request.getSession().setAttribute("p_no", p_no);
			request.getSession().setAttribute("cPage", cPage);

			path = "MyCon?type=productOne&p_no=" + p_no + "&user_id=" + user_id + "&user_pw=" + user_pw + "&cPage="
					+ cPage;

			try {
				for (int i = 0; i < i + 1; i++) {
					String opt = mr.getParameter("opt" + i);
					System.out.println("옵션  " + i + " : " + opt);

					List<String> list = DAO.optname(p_no);
					int size = list.size();
					System.out.println("size : " + size);
					for (int j = 0; j < size; j++) {
						String opt_name = mr.getParameter("opt" + j);
						System.out.println("opt_name " + j + " : " + opt_name);
						if (!(opt_name.equals(list.get(j)))) {
							System.out.println("왔니? " + j);
							ProductOptVO optvo = new ProductOptVO();
							optvo.setP_op_content(opt_name);
							optvo.setP_op_no("opt" + j);
							optvo.setP_no(p_no);

							DAO.optupdate(optvo);
						}
					}
					System.out.println("혹시 나?");
					if (mr.getParameter("opt" + ((size) + i)) != null) {
						System.out.println("혹시 나...");

						ProductOptVO optvo = new ProductOptVO();
						optvo.setP_op_no("opt" + ((size) + i));
						optvo.setP_no(p_no);
						optvo.setP_op_content(mr.getParameter("opt" + ((size) + i)));
						optvo.setP_op_cnt("10"); // 재고량 추후 추가!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
						System.out.println("optvo : " + optvo);
						DAO.addOpt(optvo); // DB에 옵션 리스트 저장

					} else {
						request.setAttribute("msg", "물건 수정이 완료 되었습니다.");
						request.setAttribute("url", path);
						return "return_loginpage.jsp"; // 여기서 alert창 띄우고 바로 로그인 페이지로 자동 이동
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("msg", "물건 수정이 실패되었습니다.");
				request.setAttribute("url", path);
				return "return_loginpage.jsp"; // 여기서 alert창 띄우고 바로 로그인 페이지로 자동 이동
			}
		} catch (Exception e) {
			e.printStackTrace();

			request.setAttribute("msg", "물건 수정이 실패되었습니다.");
			request.setAttribute("url", path);
			return "return_loginpage.jsp"; // 여기서 alert창 띄우고 바로 로그인 페이지로 자동 이동
		}
		request.setAttribute("msg", "물건 수정이 완료 되었습니다.");
		request.setAttribute("url", path);
		return "return_loginpage.jsp"; // 여기서 alert창 띄우고 바로 로그인 페이지로 자동 이동
		// return path;
	}

	// 할인가격 계산
	public static int getPercent(int p_price, int p_salerate) {
		int p_saleprice = (int) (p_price * (1 - (p_salerate * 0.01)));
		System.out.println("세일가격 : " + p_saleprice);
		return p_saleprice;
	}
}
