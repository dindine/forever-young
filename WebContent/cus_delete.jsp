<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="images/title.png">
<meta charset="UTF-8">
<title>탈퇴</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/theme.css"></link>
<script>
	function cutomer_delete(frm) {
		var user_id = "${user_id }";
		var user_pw1 = frm.user_pw.value; //입력한 비밀번호
		var user_pw2 = "${user_pw }";

		if (user_pw1 == user_pw2) {
			var isDelete = confirm(user_id+ " 님! 정말 탈퇴 하시겠습니까?");
			if (isDelete) {
				frm.action = "MyCon?type=customer_delete";//수정처리작업 페이지로 이동
				frm.submit();
			} else {
				history.back();
			}
			alert("탈퇴가 정상적으로 이루어졌습니다.");
		} else if (user_pw1 != user_pw2) {
			//비밀번호 불일치
			alert("비밀번호가 일치하지 않습니다.");
			frm.user_pw.value = "";
			frm.user_pw.focus();
			return;
		}
	}
</script>
<script>
	function go_search(frm) {
		frm.action = "MyCon?type=product_search";
		frm.submit();
	}
</script>

<script>
	$(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 500) {
				$('#MOVE_TOP_BTN').fadeIn();
			} else {
				$('#MOVE_TOP_BTN').fadeOut();
			}
		});

		$("#MOVE_TOP_BTN").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});
	});
</script>
</head>
<style>
#del_form ul li{
	margin: 0 auto; text-align : center;
	width: 700px;
	text-align: center;
	list-style: none;
}
#delete {
margin: 0 auto;
text-align : center;
	width: 150px;
	background-color: #ee782f;
	border: none;
	color: #fff;
	padding: 15px 0;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px;
	cursor: pointer;
}
#del_form li{
	text-align: left;

}
</style>

<script> 
function alert_login() {
	 alert("로그인후 이용가능합니다!");
	
}
</script>

<body>
	<div id="top_button">
		<a id="MOVE_TOP_BTN"><strong>TOP</strong></a>
	</div>
	<div id="header-button">
		<ul>
			<br>
							<c:choose>
					<%--로그인 했을 경우 --%>
					<c:when test="${user_id ne null }">
						<li id="logo_menu"><a
							href="MyCon?type=order_info&user_id=${user_id }&user_pw=${user_pw }">주문배송</a></li>
						<li id="logo_menu"><a
							href="MyCon?type=cartlist&user_id=${user_id }&user_pw=${user_pw }">장바구니</a></li>
						<li id="logo_menu"><a
							href="MyCon?type=userinfo&user_id=${user_id }&user_pw=${user_pw }">마이페이지</a></li>
						<li id="logo_menu"><a href="MyCon?type=logout">로그아웃</a></li>
						<li id="logo_menu"><a href="#"> ${user_grade }&nbsp;${user_id }</a></li>
					</c:when>

					<c:otherwise>
						<%--비로그인 상태 --%>
						<li id="logo_menu" onclick="alert_login()"><a>주문배송</a></li>
						<li id="logo_menu" onclick="alert_login()"><a>장바구니</a></li>
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
						<input id="input-search" name="product_search_txt" type="text"
							placeholder="11자 복근 도전! 슬리밍템 모음 ->">
						<li><input id="button-search" type="image"
							src="main_img/ic_search.png" onclick="go_search(this.form)">
						</li>
					</ul>
				</div>
			</form>

		</div>
	</div>
	<hr>
	<div id="menu">
		<ul>
			<li class="active"><a
				href="MyCon?type=category&p_category=skincare&user_id=${user_id }&user_pw=${user_pw }">스킨</a></li>
			<li id="news"><a
				href="MyCon?type=category&p_category=bodycare&user_id=${user_id }&user_pw=${user_pw }">바디</a></li>
			<li id="contact"><a
				href="MyCon?type=category&p_category=haircare&user_id=${user_id }&user_pw=${user_pw }">헤어</a></li>
			<li id="about"><a
				href="MyCon?type=category&p_category=makeup&user_id=${user_id }&user_pw=${user_pw }">메이크업</a></li>
			<li id="cleansing"><a
				href="MyCon?type=category&p_category=cleansing&user_id=${user_id }&user_pw=${user_pw }">클렌징</a></li>
							<li id="cleansing"><a href="customer_center.jsp">Q & A</a></li>
		
		</ul>
	</div>
	
	<div id="del_form">
	<ul>
	<form method="post">
		<input type="hidden" name="user_id" value="${user_id }">
		<h2 style="text-align: center;">회원가입 탈퇴</h2><br>
		<li>비밀 번호 <input type="password" name="user_pw"><br><br>
		 &nbsp;&nbsp;&nbsp;&nbsp;탈퇴 사유 <select>
				<option>개인 정보 보호 문제</option>
				<option>다른 계정을 만들었습니다</option>
				<option>사이트를 자주 이용하지 않음</option>
				<option>기타 이유</option>
			</select>
		</li><br>
		<li><input id="delete" type="button" value="탈퇴" onclick="cutomer_delete(this.form)">
		<input id="delete" type="reset" value="초기화"> </li>
		<input type="hidden" name="customer_delete" value="chk">
	</form>
	</ul>
	</div>

	<jsp:include page="footer.jsp"/>

</body>
</html>