<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta  charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/theme.css"></link>
<script>
	function go_search(frm) {
		frm.action = "MyCon?type=product_search";
		frm.submit();
	}
</script>
<style>
#area-search {
	margin-top:5px;
		width:310px;
	}

	#input-search {
		margin-top:7px;
		height: 30px;
	}
</style>
</head>
<body>
	<div id="header-button">
		<ul>
			<br>
			<li id="logo_menu"><a href="MyCon?type=customer_center&user_id=${user_id }&user_pw=${user_pw }">고객센터</a></li>
			<li id="logo_menu"><a href="MyCon?type=order_info&user_id=${user_id }&user_pw=${user_pw }">주문배송</a></li>
			<li id="logo_menu"><a href="MyCon?type=cartlist&user_id=${user_id }&user_pw=${user_pw }">장바구니</a></li>
			
			<c:choose><%--로그인 했을 경우 --%>
			<c:when test="${user_id ne null }">
			<li id="logo_menu"><a href="MyCon?type=userinfo&user_id=${user_id }&user_pw=${user_pw }">마이페이지</a></li>
			<li id="logo_menu"><a href="MyCon?type=logout">로그아웃</a></li>
			<li id="logo_menu"><a href="#"> ${user_grade }&nbsp;${user_id }</a></li>

			</c:when>
			
			
			
			<c:otherwise><%--비로그인 상태 --%>
			<li id="logo_menu"><a href="login.jsp">로그인</a></li>
			<li id="logo_menu"><a href="join.jsp">회원가입</a></li>
			</c:otherwise>
			</c:choose>
		</ul>

		<div id="header-search">

			<div id="header_main_logo">

				<ul>
					<li><a href="Main.jsp"> <strong>FOREVER YOUNG</strong></a></li>
				</ul>
			</div>

			<form method="post">
				<div id="area-search">
					<ul>
						<input id="input-search" name="product_search_txt" type="text" placeholder="11자 복근 도전! 슬리밍템 모음 ->">
						<li>
						<input id="button-search" type="image" src="main_img/ic_search.png"
								onclick="go_search(this.form)">
						<input type="hidden" name="user_id" value="${user_id }">
						<input type="hidden" name="user_pw" value="${user_pw }">
						</li>
					</ul>
				</div>
			</form>
		</div>
	</div>
	<br>
	<hr style="margin-top: 110px; border-top: 1px solid black">
	<div id="menu">
		<ul>
			<li class="active"><a
				href="MyCon?type=category&p_category=skincare&user_id=${user_id }&user_pw=${user_pw }">스킨</a></li>
			<li id="news"><a href="MyCon?type=category&p_category=bodycare&user_id=${user_id }&user_pw=${user_pw }">바디</a></li>
			<li id="contact"><a
				href="MyCon?type=category&p_category=haircare&user_id=${user_id }&user_pw=${user_pw }">헤어</a></li>
			<li id="about"><a href="MyCon?type=category&p_category=makeup&user_id=${user_id }&user_pw=${user_pw }">메이크업</a></li>
			<li id="cleansing"><a
				href="MyCon?type=category&p_category=cleansing&user_id=${user_id }&user_pw=${user_pw }">클렌징</a></li>
		</ul>
	</div>
</body>
</html>