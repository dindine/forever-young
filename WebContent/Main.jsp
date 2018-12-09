<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/theme.css"></link>
<link rel="shortcut icon" type="image/x-icon" href="images/title.png">
<script>
	//next버튼 클릭시 : ul태그의 margin-left 위치를 176px 좌측이동
	//   이미지가 10, 1, 2 보여지는 상태에서 클릭시 1,2,3 이미지 보여주기
	// -> 클릭횟수 기준 9인 상태 

	//prev버튼 클릭시 : ul태그의 margin-left 위치를 176px 우측이동
	//   이미지가 1,2,3 보여지는 상태에서 클릭시 10,1,2 이미지 보여주기
	// -> 클릭횟수 기준 0인 상태

	$().ready(function() {
		var clickCnt = 0;
		var marginLeft = "0px";

		$(".slick-next").click(function() {
			clickCnt++;
			if (clickCnt > 3)
				clickCnt = 0;
			marginLeft = -300 * clickCnt + "px";

			$("#product-image-ul").css("margin-left", marginLeft);
		});

		$(".slick-prev").on("click", function() {
			clickCnt--;
			if (clickCnt == -1)
				clickCnt = 3;
			marginLeft = -300 * clickCnt + "px";

			$("#product-image-ul").css("margin-left", marginLeft);
		});

		var clickCnt2 = 0;
		var marginLeft2 = "0px";
		//4개씩 이동하기
		$(".slick-next2").click(function() {
			clickCnt2++;
			if (clickCnt2 > 1)
				clickCnt2 = 0;
			marginLeft2 = -1200 * clickCnt2 + "px";

			$("#product-image-ul2").css("margin-left", marginLeft2);
		});

		$(".slick-prev2").on("click", function() {
			clickCnt2--;
			if (clickCnt2 == -1)
				clickCnt2 = 1;
			marginLeft2 = -1200 * clickCnt2 + "px";

			$("#product-image-ul2").css("margin-left", marginLeft2);
		});

		setInterval(function() {
			$(".slick-next").click();
			$(".slick-prev2").click();
		}, 3000);

	});
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

	<div id="main-slider">
		<a href="MyCon?type=productOne&cPage=1&p_no=SC_10&user_id=${user_id }&user_pw=${user_pw }"
			class="banner_link" tabindex="-1">
			<p class="banner_desc">
				<span class="tit">보타닉 힐보</span><br> <strong>프로바이오덤런칭</strong><br>
				탄탄한피부만들기<br> 안티에이징끝<br> <br> </strong> #온라인추가5%할인#증정행사 </span>
			</p> <img src="main_img/bg_main.jpg">
		</a>
	</div>

	<h3 class="data_title">인기 기획전</h3>
	<div id="product-images2">
		<ul id="product-image-ul2">
			<!--  <li><img id="product-image2" src="main_img/data30.PNG" alt="포레버영"></li>-->
			<!-- <li><img id="product-image2" src="main_img/data31.PNG" alt="포레버영" onclick="javascript:location.href='MyCon?type=productOne&cPage=1&p_no=SC_08&user_id=${user_id }&user_pw=${user_pw }'"></li> -->
			<li><input type="image" id="product-image2" src="images/bifesta.jpg" alt="포레버영" onclick="javascript:location.href='MyCon?type=productOne&cPage=1&p_no=CL_11&user_id=${user_id }&user_pw=${user_pw }'"></li>
			<li><input type="image" id="product-image2" src="images/bifesta2.jpg" alt="포레버영" onclick="javascript:location.href='MyCon?type=productOne&cPage=1&p_no=CL_01&user_id=${user_id }&user_pw=${user_pw }'"></li>
			<li><input type="image" id="product-image2" src="images/bodyfantasies.jpg" alt="포레버영" onclick="javascript:location.href='MyCon?type=productOne&cPage=1&p_no=BC_17&user_id=${user_id }&user_pw=${user_pw }'"></li>
			<li><input type="image" id="product-image2" src="images/goongbe.jpg" alt="포레버영" onclick="javascript:location.href='MyCon?type=productOne&cPage=1&p_no=BC_11&user_id=${user_id }&user_pw=${user_pw }'"></li>
			
			<li><input type="image" id="product-image2" src="images/hu.jpg" alt="포레버영" onclick="javascript:location.href='MyCon?type=productOne&cPage=1&p_no=SC_13&user_id=${user_id }&user_pw=${user_pw }'"></li>
			<li><input type="image" id="product-image2" src="images/physiogel.jpg" alt="포레버영" onclick="javascript:location.href='MyCon?type=productOne&cPage=1&p_no=SC_11&user_id=${user_id }&user_pw=${user_pw }'"></li>
			<li><input type="image" id="product-image2" src="images/clio.jpg" alt="포레버영" onclick="javascript:location.href='MyCon?type=productOne&cPage=1&p_no=MK_11&user_id=${user_id }&user_pw=${user_pw }'"></li>
			<li><input type="image" id="product-image2" src="images/code.jpg" alt="포레버영" onclick="javascript:location.href='MyCon?type=productOne&cPage=1&p_no=MK_16&user_id=${user_id }&user_pw=${user_pw }'"></li>
			
	
		</ul>
		<a class="slick-prev2">&lt;</a> <a class="slick-next2">&gt;</a>
	</div>
	<br><br><br>
	<div id="main-slider">
		<a href="MyCon?type=productOne&cPage=1&p_no=SC_05&user_id=${user_id }&user_pw=${user_pw }"
			class="banner_link" tabindex="-1">
			<p class="banner_desc">
				<span class="tit">블리블리 사고쳤다 <br> <br> <strong>꿀광쿠션<br>
						인진쑥에센스<br>최대20%<br></strong> #꿀광쿠션,원래빛나는것처럼
				</span>
			</p> <img src="main_img/bg_main2.jpg">
		</a>
	</div>

	<h3 class="data_title">
		포레버영 <strong>추천상품</strong>
	</h3>
	<div id="product-images">
		<ul id="product-image-ul">
			<li><input type="image" id="product-image2" src="images/espoir.jpg" alt="포레버영" onclick="javascript:location.href='MyCon?type=productOne&cPage=1&p_no=MK_08&user_id=${user_id }&user_pw=${user_pw }'"></li>
			<li><input type="image" id="product-image2" src="images/espoir2.jpg" alt="포레버영" onclick="javascript:location.href='MyCon?type=productOne&cPage=1&p_no=MK_03&user_id=${user_id }&user_pw=${user_pw }'"></li>
			<li><input type="image" id="product-image2" src="images/yves.jpg" alt="포레버영" onclick="javascript:location.href='MyCon?type=productOne&cPage=1&p_no=HC_04&user_id=${user_id }&user_pw=${user_pw }'"></li>
			<li><input type="image" id="product-image2" src="images/illiyoon.jpg" alt="포레버영" onclick="javascript:location.href='MyCon?type=productOne&cPage=1&p_no=BC_08&user_id=${user_id }&user_pw=${user_pw }'"></li>
			
			<li><input type="image" id="product-image2" src="images/espoir.jpg" alt="포레버영" onclick="javascript:location.href='MyCon?type=productOne&cPage=1&p_no=MK_08&user_id=${user_id }&user_pw=${user_pw }'"></li>
			<li><input type="image" id="product-image2" src="images/espoir2.jpg" alt="포레버영" onclick="javascript:location.href='MyCon?type=productOne&cPage=1&p_no=MK_03&user_id=${user_id }&user_pw=${user_pw }'"></li>
			<li><input type="image" id="product-image2" src="images/yves.jpg" alt="포레버영" onclick="javascript:location.href='MyCon?type=productOne&cPage=1&p_no=HC_04&user_id=${user_id }&user_pw=${user_pw }'"></li>
		
		</ul>
		<a class="slick-prev">&lt;</a> <a class="slick-next">&gt;</a>
	</div>

	<h3 class="data_title">
		포레버영 <strong>채널</strong>
	</h3>
	
	<div id="video">
		<ul id="product-image-ul3">
			<li><input style="width: 140px; height: 100px;" type="image"
				id="product-image2" src="images/canadian.jpg" alt="포레버영"
				onclick="javascript:location.href='MyCon?type=productOne&cPage=1&p_no=BC_10&user_id=${user_id }&user_pw=${user_pw }'">
			</li>
			<li
				onclick="javascript:location.href='MyCon?type=productOne&cPage=1&p_no=BC_10&user_id=${user_id }&user_pw=${user_pw }'"
				style="position: absolute; left: 170px; top: 30px"><b>캐나디안포뮬러</b><br>
				모이스처라이징 크림 453g<br>
			<p style="letter-spacing: -0.02em !important; font-weight: 700; font-size: 15px; text-decoration: line-through; color: gray;">판매가
					14900원</p>
				<p style="color: #ee782f; font-weight: 700;">세일가 10430원</p>
				<br></li>

			<li><input style="width: 140px; height: 100px;" type="image"
				id="product-image2" src="images/tocool2.jpg" alt="포레버영"
				onclick="javascript:location.href='MyCon?type=productOne&cPage=1&p_no=MK_15&user_id=${user_id }&user_pw=${user_pw }'"></li>
			<li
				onclick="javascript:location.href='MyCon?type=productOne&cPage=1&p_no=MK_15&user_id=${user_id }&user_pw=${user_pw }'"
				style="position: absolute; left: 170px; top: 140px;"><b>투쿨포스쿨
					바이로댕 쉐이딩</b><br>(브러쉬 미포함)<br>
			<p style="letter-spacing: -0.02em !important; font-weight: 700; font-size: 15px; text-decoration: line-through; color: gray;">
					판매가 16000원<br>
				</p>
				<p style="color: #ee782f; font-weight: 700;">세일가 14400원</p>
				<br></li>

			<li><input style="width: 140px; height: 100px;" type="image"
				id="product-image2" src="images/ts.jpg" alt="포레버영"
				onclick="javascript:location.href='MyCon?type=productOne&cPage=1&p_no=HC_06&user_id=${user_id }&user_pw=${user_pw }'"></li>
			<li
				onclick="javascript:location.href='MyCon?type=productOne&cPage=1&p_no=HC_06&user_id=${user_id }&user_pw=${user_pw }'"
				style="position: absolute; left: 170px; top: 250px;"><b>프리미엄TS샴푸
					300g</b><br>(탈모증상완화)<br>
			<p style="letter-spacing: -0.02em !important; font-weight: 700; font-size: 15px; text-decoration: line-through; color: gray;">
					판매가 25000원<br>
				</p>
				<p style="color: #ee782f; font-weight: 700;">세일가 22500원</p>
				<br></li>
		<iframe src="https://www.youtube.com/embed/kz0Ik0zc7mI?autoplay=1"
			frameborder="0"> </iframe>
	</div>
		<!-- 하단 영역 -->
		<jsp:include page="footer.jsp"/>

</body>
</html>