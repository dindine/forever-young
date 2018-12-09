package com.foy.prodcut_command;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.foy.command.Command;
import com.foy.mybatis.DAO;
import com.foy.vo.ProductOptVO;
import com.foy.vo.ProductVO;

public class ProductRegCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("request getContentType : " + request.getContentType());

		MultipartRequest mr = null;
		String path = null;
		try {

			String filepath = request.getSession().getServletContext().getRealPath("/upload");
			mr = new MultipartRequest(request, filepath, 10 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());

			// 전달받은 값을 DB에 입력처리
			ProductVO vo = new ProductVO();
			String category_name = mr.getParameter("category");

			vo.setP_no(mr.getParameter("p_no"));
			vo.setP_name(mr.getParameter("p_name"));
			vo.setP_price(Integer.parseInt(mr.getParameter("p_price")));
			vo.setP_content(mr.getParameter("p_content"));
			vo.setP_salerate(Integer.parseInt(mr.getParameter("p_salerate")));
			vo.setP_category(category_name);

			// 상품고유 번호 지정하기
			// 기존의 번호가 있으면 +1 하여 저장하기 => sk_1 이 존재 하면 sk_2로!
			// 데이터베이스 조회
			String cate_idx = DAO.getCategory_IDX(category_name);
			int cnt = DAO.getP_no(category_name);
			cnt += 1;
			String p_no = cate_idx + 1;
			System.out.println("p_no : " + p_no);

			List<String> p_no_list = DAO.exitsP_no(category_name);
			System.out.println("p_no_list : " + p_no_list);

			// p_no = getProductIdx(p_no_list, p_no, cate_idx, cnt); // 상품 고유번호 지정하기 메서드
			// p_no = getProductIdx(p_no_list, p_no, cate_idx, 1); // 상품 고유번호 지정하기 메서드
			p_no = getProductIdx2(p_no_list, p_no, cate_idx, 1); // 상품 고유번호 지정하기 메서드
			vo.setP_no(p_no);
			System.out.println("최종 확정 p_no : " + p_no);

			// 세일가격 측정
			int p_salerate = Integer.parseInt(mr.getParameter("p_salerate"));
			int p_price = Integer.parseInt(mr.getParameter("p_price"));

			int p_saleprice = getPercent(p_price, p_salerate); // 할인가격 측정 메서드
			vo.setP_saleprice(p_saleprice);

			// 첨부파일 처리
			if (mr.getFile("p_file_name") != null) {
				vo.setP_new_image(mr.getFilesystemName("p_file_name"));
				vo.setP_ori_image(mr.getOriginalFileName("p_file_name"));
			} else {
				vo.setP_new_image(""); // 실제저장시 사용된 파일명
				vo.setP_ori_image(""); // 원본 파일명
			}

			System.out.println("vo : " + vo);
			DAO.productReg(vo);

			// 상품 옵션 추가 - DB저장

			String user_id = mr.getParameter("user_id");
			String user_pw = mr.getParameter("user_pw");
			System.out.println("물건 등록 ===== > user: " + user_id + " pw:" + user_pw + "p_category :" + category_name);

			request.getSession().setAttribute("user_id", user_id);
			request.getSession().setAttribute("user_pw", user_pw);
			request.getSession().setAttribute("p_category", category_name);

			path = "MyCon?type=category&user_id=" + user_id + "&user_pw=" + user_pw + "&p_category=" + category_name;
			try {
				String p_op_no = "";
				for (int i = 0; i < i + 1; i++) {
					String opt = mr.getParameter("opt" + i);
					System.out.println("옵션 : " + opt);
					if (mr.getParameter("opt" + i) != null) {
						p_op_no = "opt" + i;
						ProductOptVO optvo = new ProductOptVO();
						optvo.setP_no(p_no);
						optvo.setP_op_no(p_op_no);
						optvo.setP_op_content(opt);
						optvo.setP_op_cnt("10"); // 재고량 추후 추가!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
						System.out.println("optvo : " + optvo);
						DAO.addOpt(optvo); // DB에 옵션 리스트 저장
					} else {
						p_op_no = "opt" + i;
						ProductOptVO optvo = new ProductOptVO();
						optvo.setP_no(p_no);
						optvo.setP_op_no(p_op_no);
						optvo.setP_op_content("옵션없음");
						optvo.setP_op_cnt("10"); // 재고량 추후 추가!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
						System.out.println("optvo : " + optvo);
						DAO.addOpt(optvo); // DB에 옵션 리스트 저장
						request.setAttribute("msg", "물건 등록이 완료 되었습니다.");
						request.setAttribute("url", path);
						return "return_loginpage.jsp"; // 여기서 alert창 띄우고 바로 로그인 페이지로 자동 이동
						// return path;
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("msg", "물건 등록이 실패 되었습니다.");
				request.setAttribute("url", path);
				return "return_loginpage.jsp"; // 여기서 alert창 띄우고 바로 로그인 페이지로 자동 이동
			}

		} catch (IOException e) {
			e.printStackTrace();

			request.setAttribute("msg", "물건 등록이 실패 되었습니다.");
			request.setAttribute("url", path);
			return "return_loginpage.jsp"; // 여기서 alert창 띄우고 바로 로그인 페이지로 자동 이동
		}
		request.setAttribute("msg", "물건 등록이 완료 되었습니다.");
		request.setAttribute("url", path);
		return "return_loginpage.jsp"; // 여기서 alert창 띄우고 바로 로그인 페이지로 자동 이동
		// return path;
	}

	// 상품 고유 번호 지정
	public static String getProductIdx(List<String> p_no_list, String p_no, String cate_idx, int cnt) {
		while (true) {
			// for (String chk_p_no : p_no_list) {
			for (int i = 0; i < p_no_list.size(); i++) {
				System.out.println("chk_p_no : " + p_no_list.get(i));
				if (p_no_list.get(i) == p_no) {
					cnt += 1;
					// cnt = cnt + 1;
					// p_no = cate_idx + (cnt);
					p_no = cate_idx + (cnt);

					System.out.println("현재 p_no : " + p_no);

					continue;
				}
			}
			return p_no;
		}
	}

	// 상품 고유 번호 지정
	public static String getProductIdx2(List<String> p_no_list, String p_no, String cate_idx, int cnt) {
		p_no = p_no_list.get(p_no_list.size() - 1);
		// for (String chk_p_no : p_no_list) {
		int last = p_no.length();
		int idx = Integer.parseInt(p_no.substring(3, last));
		System.out.println("last : " + last + " idx : " + idx + " p_no : " + p_no);
		p_no = cate_idx + (idx + 1);
		System.out.println("현재 p_no : " + p_no);
		return p_no;

	}

	// 할인가격 계산
	public static int getPercent(int p_price, int p_salerate) {
		int p_saleprice = (int) (p_price * (1 - (p_salerate * 0.01)));
		System.out.println("세일가격 : " + p_saleprice);
		return p_saleprice;
	}

}
