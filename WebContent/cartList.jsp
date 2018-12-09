<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/theme.css"></link>
<script>
	function del_go(frm) {
		alert("상품을 삭제합니다.");
		frm.action = "MyCon?type=deletecart";
		frm.submit();
	}
	function modify_go(frm) {
		alert("수량이 수정되었습니다.");
		frm.action = "MyCon?type=modifycart";
		frm.submit();
	}

	function go_main(frm) {
		frm.action = "MyCon?type=main";
		frm.submit();
	}

	function go_pay(frm) {
		frm.action = "MyCon?type=pay_go&user_id=${user_id }&user_pw=${user_pw }";
		frm.submit();
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
<link rel="shortcut icon" type="image/x-icon" href="images/title.png">

</head>
<style>
body {
	font-family: 'dotum', '고딕';
}

#cart_image {
	width: 300px;
	height: 250px;
}

#cartlist_footer li {
	float: right;
	list-style: none;
	font-size: 25px;
}

.p_saleprice {
	color: #ee782f;
}

#pay {
	width: 250px;
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

#update {
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

#delete {
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

#cart_cnt{
	display:block;
	width:50px;
	height:50px;
	background-color: orange;
	border-radius: 50px;
	border: 1px solid orange;
	float: right;
	color: white;

	
}

#info {
	list-style: none;
	width: 1020px;
	margin: 5px auto 5px auto;
}

#first_info {
	text-align: center;
}

#info_txt {
	font-size: 18px;
}

#info ul {
	list-style-type: none;
	margin: 10px auto;
	padding: 1px auto;
	overflow: hidden;
}

#info ul li {
	margin: 0 auto;
	float: left;
	display: inline;
	font: 15px Dotum;
	padding: 0 10px;
	border-left: none;
}

#txt li {
	padding: 10px 10px 10px;
}

#info_box_c_p {
	color: #ee782f;
}

h1 {
	width:30%;
	margin: 0 auto;
	padding: 0px 0px 0px 200px;
}

#info_box {
	margin: 0 auto;
	border: 2px solid #ee782f;
	width: 350px;
	height: 70px;
	font-family: 'dotum', '돋움';
	font-size: 20px;
}

#info_box_c_p {
	color: #ee782f;
}

.img_word {
   width: 64.5%;
   height: 70px;
   position: absolute;
   top: 200px;
   right: 300px;
   left: 400px;
   bottom: Opx;

}

#empty_cart {
font-size: 30px;
margin-left: 600px;
margin-top:150px;
list-style: none;

}

h1.word {
   text-align: center;
   font-size: 40px;
   margin-top: 10px;
   margin-left: 10px;
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
					<c:when test="${user_id ne null and user_id ne ''}">
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
			
				<ul><li><a href="Main.jsp">
					<strong>FOREVER YOUNG</strong></a></li>
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
	<hr>
	
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
							<li id="cleansing"><a href="customer_center.jsp">Q & A</a></li>
		
		</ul>
	</div>
	<!-- header 끝나는 부분  -->

	<div id="cartlist_body">
		<div class="img_word">
			<h1 class="word">장바구니<div id="cart_cnt"><div><center>${cart_cnt }</center></div></h1>
		</div>

		<form method="post" action="MyCon?type=modifycart">

			<div>
				<div>
					<c:if test="${empty c_list}">
						<ul>
							<div id="empty_cart"><li>장바구니가 비었습니다.</li></div>
						</ul>
					</c:if>
					<div id="info">

						<c:if test="${not empty c_list}">
							
							<!-- 장바구니에 데이타가 있는 경우 -->
							<br><br><br><br><br>
							<li id="first_info">${vo.user_name }님의멤버십등급은<span
								id="info_box_c_p">${vo.user_grade }</span> 입니다.
							</li>
							<br>
							<p id="info_box">
							<br>
								 <b>&nbsp;&nbsp;쿠폰 <span id="info_box_c_p">${vo.user_coupon_cnt }</span>
									개 포인트 <span id="info_box_c_p">${vo.user_point }</span> P
								</b>
							</p>
							<br>
							<c:forEach var="i" begin="0" end="${cart_cnt - 1}">

								<%-- <li><input type="checkbox" name="sel" value="${c_list[i].cart_tot_price }" onclick="itemSum(liis.form)"></li>
			--%>

								<ul>
									<br>
									<hr>
									<br>
									<br>
									<li><img id="cart_image"
										src="images/${c_list[i].cart_image }"></li>
									<br>
									<li><span id="info_txt">제품번호 : ${c_list[i].p_no}</span></li>
									<br>
									<br>
									<li><span id="info_txt">제품이름 : ${c_list[i].p_name }</span></li>
									<br>
									<br>
									<li><span id="info_txt">옵션명 :
											${c_list[i].p_opt_name }</span></li>
									<br>
									<br>
									<li><span id="info_txt">정가 : ${c_list[i].cart_price }원</span>
										<span id="info_txt" class="p_saleprice">(세일가격:
											${c_list[i].p_saleprice } 원)</span><br></li>
									<br>
									<br>
									<li><span id="info_txt">단가 :
											${c_list[i].cart_tot_price }원</span></li>
									<br>
									<li><span id="info_txt"> 수량 : <input type="number"
											name="cart_cnt[${i }]" value="${c_list[i].cart_cnt }"
											size="3">
									</span> <input id="update" type="button" value="수정"
										onclick="modify_go(this.form)"> <input id="delete"
										type="button" value="삭제"
										onclick="javascript:location.href='MyCon?type=deletecart&user_pw=${user_pw }&user_id=${user_id }&p_no=${c_list[i].p_no }&cart_idx=${c_list[i].cart_idx }'">
										<input type="hidden" name="user_pw" value="${user_pw }">
										<input type="hidden" name="cart_idx"
										value="${c_list[i].cart_idx }"> <input type="hidden"
										name="cart_idx[${i }]" value="${c_list[i].cart_idx }">
										<input type="hidden" name="user_id"
										value="${c_list[i].user_id }"> <input type="hidden"
										name="p_no[${i }]" value="${c_list[i].p_no }"> <input
										type="hidden" name="c_list" value="${c_list }"></li>
								</ul>

							</c:forEach>
					</div>

					<br>
					<hr>
				</div>
				<ul id="cartlist_footer">
					<br>
					<li>총 결제예상금액 : ${tot_price }원</li>
					<br>
					<br>
				</ul>
			</div>

			<ul id="cartlist_footer">
				<li><input id="pay" type="button" value="결제"
					onclick="go_pay(this.form)"></li>
				<br>
				<br>
				<br>
				<br>
				<!-- <li><input type="button" value="메인으로 이동" onclick="go_main(this.form)"></li> -->
			</ul>

				</c:if>
		</form>
	</div>

	<!-- 밑에 로고 시작하는 부분 -->
	<jsp:include page="footer.jsp"/>

</body>
</html>