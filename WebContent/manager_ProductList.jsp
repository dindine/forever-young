<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체목록</title>
<style>
#container {
	width: 512px;
	margin: auto;
}

#container h2 {
	text-align: center;
}

#container p {
	text-align: center;
}

#container table {
	width: 500px;
	padding: 0 5px;
	border: 1px solid black;
	border-collapse: collapse;
}

#container th, td {
	border: 1px solid black;
}

#container table th {
	background-color: #9cf;
}

#container table td {
	text-align: left;
}

#container p>a {
	text-decoration: none;
	font-weight: bold;
}

#container .center {
	text-align: center;
}

.padding {
	list-style: none;
}

.padding li {
	float: left;
	margin-right: 8px;
}

.padding li a {
	text-decoration: none;
	display: block;
	padding: 3px 7px;
	border: 1px solid #00B3DC;
	font-weight: bold;
	color: black;
}

.padding li a:hover {
	background-color: #00B3DC;
	color: white;
}

.padding .disable {
	padding: 3px 7px;
	border: 1px solid silver;
	color: silver;
}

.padding .now {
	padding: 3px 7px;
	border: 1px solid #ff4aa5;
	background-color: #ff4aa5;
	color: white;
	font-weight: bold;
}
</style>

<script>
	function user_info(frm) {
		frm.action = "MyCon?type=userinfo";
		frm.submit();
	}
</script>
</head>
<body>
<form method="post">
	<div id="container">
		<h2>상품 리스트</h2>
		<hr>
		<!--  <p>[<a href="MyCon?type=write">방명록 쓰기</a>]</p> -->
		<p>
			[<a href="MyCon?type=productReg_main">물건 등록</a>]
		</p>
		<!-- write 와 write_ok를 하나로 묶음 -->
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제품번호</th>
					<th>제품이름</th>
					<th>가격</th>
					<th>할인가격</th>
					<th>이미지</th>
					<th>내용</th>
					<th>카테고리</th>
					<th></th>
				</tr>
			</thead>
			<tbody>

				<c:if test="${not empty attr_list }">
					<c:forEach var="vo" items="${list }">
						<tr>
							<td class="center">${vo.num }</td>
							<td>${vo.p_no }</td>
							<td><input type="hidden" name="idx" value="${vo.p_no }">
								<input type="hidden" name="type" value="productOne">
								<input type="hidden" name="user_id" value="${user_id }">
								<input type="hidden" name="user_pw" value="${user_pw }">
								 <a href="MyCon?type=productOne&p_no=${vo.p_no }&user_id=${user_id }&user_pw=${user_pw }">${vo.p_name }</a></td>
							<td>${vo.p_price }</td>
							<td>${vo.p_saleprice }</td>
							<td><img src="images/${vo.p_ori_image }" width="100px"
								height="95px"></td>
							<td>${vo.p_content }</td>
							<td>${vo.p_category }</td>

							<td colspan="2"><input type="button" value="수정하기"
								onclick="javascript:location.href='MyCon?type=updateProduct_main&p_no=${vo.p_no }'">
								<input type="button" value="삭제하기"
								onclick="javascript:location.href='MyCon?type=deleteProduct&p_no=${vo.p_no }'">
							</td>
						</tr>

					</c:forEach>
				</c:if>

				<c:if test="${empty attr_list }">
					<tr>
						<td colspan="4">입력된 자료가 없습니다</td>
					</tr>
				</c:if>
			</tbody>
		</table>

		<ol class="padding">
			<%--[이전으로]에 대한 사용여부 처리 --%>
			<c:choose>
				<%--사용불가(disable) : 첫번째 블록인 경우 --%>

				<c:when test="${pvo.beginPage < pvo.pagePerBlock }">
					<%-- begin page가 1이 아닌경우 --%>
					<li class="disable">이전으로</li>
				</c:when>

				<%--사용가능(enable) : 첫번째 블록이 아닌 경우 => 2페이지 이상 --%>
				<c:otherwise>
					<li class="enable"><a
						href="MyCon?type=productList&pPage=${pvo.beginPage - 1}">이전으로</a></li>

				</c:otherwise>
			</c:choose>

			<%-- 블록내에 표시할 페이지 반복처리 --%>
			<%-- 현재블록 시작페이지~끝페이지 표시 --%>

			<c:forEach var="k" begin="${pvo.beginPage }" end="${pvo.endPage }">
				<c:choose>
					<c:when test="${k == pvo.nowPage }">
						<li class="now">${k }</li>
					</c:when>
					<c:otherwise>
						<li><a href="MyCon?type=productList&pPage=${k }">${k }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<%--[다음으로]에 대한 사용여부 처리 --%>
			<c:choose>
				<%--사용불가(disable) : 마지막 블록인 경우 -> endPage가 전체페이지수 보다 크거나 같으면 --%>
				<c:when test="${pvo.endPage >= pvo.totalPage }">
					<li class="disable">다음으로</li>
				</c:when>
				<%--사용가능(enable) : 마지막 블록이 아닌 경우 --%>
				<c:otherwise>
					<li class="enable"><a
						href="MyCon?type=productList&pPage=${pvo.endPage + 1 }">다음으로</a></li>
				</c:otherwise>
			</c:choose>
		</ol>
		<input type="hidden" name="user_id" value="${user_id }">
		<input type="hidden" name="user_pw" value="${user_pw }">
	</div>
</form>
</body>
</html>










