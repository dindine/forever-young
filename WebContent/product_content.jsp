<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 제품번호를 사용 DB에서 제품정보 조회후 화면 출력 --%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>${vo.p_name }의상세정보</title>
<link rel="shortcut icon" type="image/x-icon" href="images/title.png">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/theme.css"></link>
<style>
#p_c_body {
	clear: right;
	float: right;
	padding: 50px 0px 50px 0px;
	margin-right: 280px;
	width: 30%;
}

#p_c_main ul li {
	list-style: none;
}

#pro_img {
	margin: 70px 900px 0px 250px;
}

#info {
	padding: auto 90px 0px 0px;
	font-family: 'dotum', '돋움';
	font-size: 15px;
}

#first_info {
	font-family: 'dotum', '돋움';
	font-size: 30px;
	color: #babb3c;
}

#second_info {
	font-family: 'dotum', '돋움';
	font-size: 30px;
}

#name_price_sale {
	color: #999;
	font-family: 'Nanum Gothic';
	font-size: 17px;
	font-weight: 700;
}

#name_price_sale2 {
	float: right;
	font-family: 'Nanum Gothic';
	font-size: 17px;
	font-weight: 700;
	
}

#sale {
	color: #ee782f;
	font-family: 'Nanum Gothic';
	font-size: 17px;
	font-weight: 700;
}

#opt {
	font-family: 'dotum', '돋움';
}



#footer {
	bottom: auto;
	width: 130%;
}

#manager_btn {
font-family: 'dotum', '돋움';
background-color: transparent; 
border:3px solid orange;
padding: 2px;
color:orange;
font-weight: 700;
}
#manager_btn:hover {
	border:3px solid #babb3c;
	background-color: #babb3c;
	color: white;
}

#sel_opt {
width: 37%;
}

</style>


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

	function product_update(frm) {
		frm.action = "MyCon?type=updateProduct_main&p_no=${vo.p_no }";
		frm.submit();
	}

	function delete_product(frm) {
		frm.action = "MyCon?type=deleteProduct&p_no=${vo.p_no }&p_category=${vo.p_category }";
		frm.submit();
	}

	function go_productlist(frm) {
		frm.action = "MyCon?type=productList";
		frm.submit();
	}

	function go_cartlist(frm) {
		var user_id = frm.user_id.value;
		if (typeof user_id == "undefined" || user_id == null || user_id == "") {
			alert("로그인해주세요");
			return;
		}
		frm.action = "MyCon?type=cartlist&p_no=${vo.p_no }&user_id=${user_id }";
		frm.submit();
	}

	function go_addcart(frm) {
		var user_id = frm.user_id.value;
		if (typeof user_id == "undefined" || user_id == null || user_id == "") {
			alert("로그인해주세요");
			return;
		}
		frm.action = "MyCon?type=addcart";
		frm.submit();
	}

	function go_buy(frm) { //물건 바로 구매
		var user_id = frm.user_id.value;
		if (typeof user_id == "undefined" || user_id == null || user_id == "") {
			alert("로그인해주세요");
			return;
		}
		frm.action = "MyCon?type=buyProduct";
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
function alert_login() {
	 alert("로그인후 이용가능합니다!");
	
}
</script>
</head>
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
			
				<ul><li><a href="Main.jsp" style="font-family: 'dotum', '돋움';"><strong>FOREVER YOUNG</strong></a></li>
				</ul>
			</div>
	

			<form method="post">
				<div id="area-search">
					<ul>
						<input id="input-search" name="product_search_txt" type="text"
							placeholder="11자 복근 도전! 슬리밍템 모음 ->">
						<li><input id="button-search" type="image"
							src="main_img/ic_search.png" onclick="go_search(this.form)">
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

	<form method="post">
		<div id="p_c_main">

			<div id="p_c_body">
				<!--  <input type="button" value="상품리스트" onclick="go_productlist(this.form)">-->
				<ul id="info">
					<li id="first_info"><strong>${vo.p_category }</strong>
					<div style="float: right;">
					<c:choose>
							<c:when test="${'manager' eq user_id }">
								<input type="button" value="수정하기"
									onclick="product_update(this.form)" id="manager_btn">
								<input type="button" value="삭제하기"
									onclick="delete_product(this.form)" id="manager_btn">
							</c:when>
						</c:choose>
					</div>	
					</li>
					<li id="second_info"><strong>${vo.p_name }</strong></li>
					<!--  <li>제품&nbsp;&nbsp;&nbsp; Category  ${vo.p_category }</li>
					<li>제품번호 &nbsp;&nbsp;&nbsp;${vo.p_no }</li>
					<ul id="c_padding">
						<li>제품설명</li>
						<li>${vo.p_content }</li>
					</ul>	
					-->
					<br>
					<li id="name_price_sale">상세 정보</li>
					<li id="name_price_sale2" style="float:left; margin-top: 10px; margin-bottom: 5px;">${vo.p_content }</li>
					<br>
					<li id="name_price_sale2">${vo.p_price }원</li>
					<li id="name_price_sale"><br>판매가</li>
					<br>
					<li id="name_price_sale2">${vo.p_saleprice }원</li>
					<li id="sale">세일가 (할인률:${vo.getPercent() }%)</li>
					<br>

					<hr>
					<br>
					<li id="name_price_sale2">3%</li>
					<li id="name_price_sale">forever young 포인트 예상 적립</li>
					<br>
					<hr>
					<br>
					<div id="sel_opt">
					<li id="opt" ><select name="opt" style="width: 100%;
					height: 30px; font-weight: bold;" >
							<c:forEach var="opt" items="${optlist }">
								<option>${opt.p_op_content }</option>
							</c:forEach>
					</select></li>
					</div>
					<br>
					<hr>
					<br>
					<li> 
					<input width="150px" type="image" src="main_img/data14.PNG"
						value="장바구니 담기" onclick="go_addcart(this.form)"> <input
						width="150px" type="image" src="main_img/data15.PNG"
						value="장바구니 보기" onclick="go_cartlist(this.form)"> <input
						width="150px" type="image" src="main_img/data13.PNG" value="구매"
						onclick="go_buy(this.form)"> <input type="hidden"
						name="user_id" value="${user_id }"> <input type="hidden"
						name="user_pw" value="${user_pw }"> <input type="hidden"
						name="p_no" value="${vo.p_no }"> <input type="hidden"
						name="p_saleprice" value="${vo.p_saleprice }"> <input
						type="hidden" name="p_price" value="${vo.p_price }"> <input
						type="hidden" name="p_ori_image" value="${vo.p_ori_image }">
						<input type="hidden" name="p_cnt" value="1"> <input
						type="hidden" name="p_name" value="${vo.p_name }"><input
						type="hidden" name="cPage" value="${cPage }"><input
						type="hidden" name=p_category value="${vo.p_category }"></li>
				</ul>
			</div>


			<ul>
				
				 <li id="pro_img"><img src="images/${vo.p_ori_image }"></img></li>
			
			</ul>


		</div>
	</form>

	<div id="footer">
		<c:import
			url="MyCon?type=bList&cPage=${cPage }&pPage=${pPage }&p_no=${vo.p_no }&user_id=${user_id }&user_pw=${user_pw }">
		</c:import>

	</div>

	
	<!-- 밑에 로고 시작하는 부분 -->
	
	<div style="bottom: auto; width: 100%;" >
		<jsp:include page="footer.jsp"/>
	</div>

</body>
</html>