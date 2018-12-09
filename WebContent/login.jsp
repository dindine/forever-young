<%@page import="com.foy.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>		

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="shortcut icon" type="image/x-icon" href="images/title.png">
<link rel="stylesheet" type="text/css" href="css/theme.css"></link>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<style>
	#container {
	width : 512px; margin: auto;
	}
	#container h2 { text-align: center; }
	#container p{ text-align: center; 
						color: #888;
						}
	
	#container p > a {
		text-decoration: none;
		font-weight: bold;
	}
	#container .center { text-align: center; }
	
	#container table > tfoot td { text-align: center; }
	
	.btnlogin {
	width: 100%;
    height: 50px;
    background-color: #969937;
    padding: 11px 0 9px;
    font-size: 18px;
    line-height: 30px;
    border-radius: 5px;
    box-shadow: none;
  	color : white;
	}
	
	.btnlogin2 {
	width: 82%;
    height: 10px;
    background-color: white;
    padding: 11px 0 9px;
    font-size: 18px;
    line-height: 10px;
    border-radius: 5px;
    box-shadow: none;
  	
	}
	#login ul li {
		list-style: none;
		color: gray;	
	}
	#login {
		margin : 0 auto; 
		padding : 30px 42px 10px 50px;
	
	}
	#loginbutton{
	color : white;
	}

</style>
<script>	

	function login_go(frm){
		/*
		var pw1 = frm.pw.value; //입력한 비밀번호
		var pw2 = "${foreverYoungVO.getUser_pw() }";
		alert("pwd1 : " + pw1 + "pw2"+pw2);
		if (pw1 == pw2) {
			frm.action="MyCon?type=login";
			frm.submit();
		} else {
			//암호 불일치 : 비밀번호 불일치 메시지 표시 후 현재 페이지
			alert("비밀번호가 일치하지 않습니다. 다시 입력하세요.");
			frm.pwd.value = "";
			frm.pwd.focus();
		}
		*/
		frm.action="MyCon?type=login";
		frm.submit();
	}
	
	
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
</body>

	<div id="container">
	<h3 class="data_title">로그인</h3>
		
		<p>포에버영의 다양한 서비스와 혜택을 누리세요.</p><br>
		<hr>
		<form name="frm" method="post">
		<div id = "login">
			<ul>		
					<li>	아이디&nbsp;&nbsp;&nbsp;
						<input type="text" class="btnlogin2" name="id" size="45" style="border: 1px solid gray" value="${Customer.getUser_id() }"></li><br>
					
						<li>비밀번호
						<input type="password" class="btnlogin2" name="pw" size="45" style="border: 1px solid gray" value=""></li><br>
						
						<li id="loginbutton"><input type="button" class="btnlogin" value="로그인"
							onclick="login_go(this.form)"></li>
					
					<input type="hidden" name="id" value="${Customer.getUser_id() }">	
					<input type="hidden" name="logchk" value="chk" >
			</ul>		
		</div>

		 </form>
		 
	</div>
	
	<!-- 밑에 로고 시작하는 부분 -->
	<jsp:include page="footer.jsp"/></body>
</html>