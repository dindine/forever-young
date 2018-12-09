<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/theme.css"></link>
<link rel="shortcut icon" type="image/x-icon" href="images/title.png">
<script>
	function customer_update(){
		location.href="MyCon?type=customer_update_form&user_id=${user_id }&user_pw=${user_pw }";
	}
	function customer_delete(){
		location.href="MyCon?type=customer_delete_form&user_id=${user_id }&user_pw=${user_pw }";
	}
	function go_main(frm) {
		frm.action="MyCon?type=main";
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
</head>
<style>
#info{
	text-align: center;
	width:300px;
	margin: 0 auto;
}
#info_box {
	margin: 0 auto;
	border: 2px solid #ee782f;
	width:300px;
	height: 70px;
	font-family: 'dotum', '돋움';
	font-size: 20px;
}
#grade{
	color: #ee782f;
	list-style: none;
}
#first_info{
 font-size: 20px;
text-align: center;
	list-style: none;
}
#update{
	width:120px;
    background-color: #ee782f;
    border: none;
    color:#fff;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px 30px 4px 4px;
    cursor: pointer;
}
#delete{
	width:120px;
    background-color: #ee782f;
    border: none;
    color:#fff;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
}
#info_box_c_p{
	 color:#ee782f;
}
</style>
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

						<%--비로그인 상태 --%>
			<%-- 		<c:otherwise>
						<li id="logo_menu" onclick="alert_login()"><a>주문배송</a></li>
						<li id="logo_menu" onclick="alert_login()"><a>장바구니</a></li>
						<li id="logo_menu"><a href="login.jsp">로그인</a></li>
						<li id="logo_menu"><a href="join.jsp">회원가입</a></li>
						</c:otherwise>--%>
			
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
	
	<li id="first_info">${vo.user_name }님의 멤버십 등급은 <span id="info_box_c_p">${vo.user_grade }</span> 입니다.</li><br>
	
<div id="info">
<ul>
	<form method="post">
	<p id="info_box"><br><b>쿠폰 <span id="info_box_c_p">${vo.user_coupon_cnt }</span> 개   포인트 <span id="info_box_c_p">${vo.user_point }</span> P<br></b><br></p>
	<br>
	<p style="float:left">아이디 : ${vo.user_id }</p><br><br>
	<p style="float:left">이름 : ${vo.user_name }</p><br><br>
	<p style="float:left">전화번호 : ${vo.user_phone }</p><br><br>
	<p style="float:left">이메일 : ${vo.user_email }</p><br><br>
	<p style="float:left">주소 : ${vo.user_addr }</p><br><br>
	<p style="float:left">총 구매 금액 : ${vo.user_tot_pur }</p><br>
	<br>
	<input id="update" type="button" value="수정" onclick="customer_update()">
	<input id="delete"type="button" value="탈퇴" onclick="customer_delete()">
	<br><br>
	<input type="hidden" name="user_id" value="${vo.user_id }">
	<input type="hidden" name="user_pw" value="${vo.user_pw }">
	<!--  <input type="button" value="메인으로 이동" onclick="go_main(this.form)">-->
	</form>
	</ul>
	</div>
	
	<!-- 밑에 로고 시작하는 부분 -->
	<jsp:include page="footer.jsp"/>
</body>
</html>