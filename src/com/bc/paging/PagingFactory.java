package com.bc.paging;

import com.foy.mybatis.Paging;

public class PagingFactory {

	public static Paging create(int totalCount, int pressedPage) {
		Paging paging = new Paging();

		// 1. 전체 게시물의 수를 구한다.
		paging.setTotalRecord(totalCount);
		paging.setTotalPage(); // 전체 페이지 갯수 구하기

		// 2. 현재 페이지 구하기(default : 1)
		paging.setNowPage(pressedPage);

		// 3. 현재페이지의 시작번호(begin)와 끝번호(end) 구하기
		paging.setEnd(paging.getNowPage() * paging.getNumPerPage());
		paging.setBegin(paging.getEnd() - paging.getNumPerPage() + 1);

		// 4. 블록의 시작페이지, 끝페이지 번호 구하기(현재페이지 번호 이용)
		int nowPage = paging.getNowPage();
		paging.setBeginPage((nowPage - 1) / paging.getPagePerBlock() * paging.getPagePerBlock() + 1);
		paging.setEndPage(paging.getBeginPage() + paging.getPagePerBlock() - 1);

		// 4-1 끝페이지(endPage)가 총페이지(totalPage)보다 크면
		// endPage = totalPage 설정
		if (paging.getEndPage() > paging.getTotalPage()) {
			paging.setEndPage(paging.getTotalPage());
		}
		
		return paging;
	}
}
