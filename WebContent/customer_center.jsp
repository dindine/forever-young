<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>		
	
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="images/title.png">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>


<style>

#area-search {
margin-top:5px;
	width:350px;
}

#input-search {
	height: 50px;

}


.container {
	width: 80%;
	margin-top: 60px;
}
/*
#button {
	width: 150px;
	background-color: #ee782f;
	border: none;
	color: #fff;
	padding: 15px 0;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	border-radius: 5px;
	margin: 0px 700px 0px 600px;
	cursor: pointer;
}
*/


.page {
  width: 100vw;
  height: 100vh;
  display: flex;
  justify-content: center;
}


/* toggle class bg-animate-color */

.bg-animate-color {
  animation: random-bg .5s linear infinite;
}


/* add animation to bg color  */

@keyframes random-bg {
  from {
    filter: hue-rotate(0);
  }
  to {
    filter: hue-rotate(360deg);
  }
}

.btn {
  /* change bg color to get different hues    */
  background-color: #ee782f;
  color: white;
  padding: 2em 3em;
  border: none;
  transition: all .3s ease;
  border-radius: 5px;
  letter-spacing: 2px;
  text-transform: uppercase;
  outline: none;
  align-self: center;
  cursor: pointer;
  font-weight: bold;
  margin: 0px 700px 0px 600px;
  
}

.btn:hover {
  animation: random-bg .5s linear infinite, grow 1300ms ease infinite;
}

.start-fun {
  background-color: #fff !important;
  /* change color of button text when fun is started   */
  color: salmon !important;
}

/* pulsating effect on button */
@keyframes grow {
  0% {
    transform: scale(1);
  }
  14% {
    transform: scale(1.3);
  }
  28% {
    transform: scale(1);
  }
  42% {
    transform: scale(1.3);
  }
  70% {
    transform: scale(1);
  }


#button:hover {
	color : #E6EE9C;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/theme.css"></link>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script>
$('.btn').on('click', function(event) {
	  $(this).toggleClass('start-fun');
	  var $page = $('.page');
	  $page.toggleClass('color-bg-start')
	    .toggleClass('bg-animate-color');

	  //change text when when button is clicked

	  $(this).hasClass('start-fun') ?
	    $(this).text('stop the fun') :
	    $(this).text('start the fun');

	});
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
<script> 
function alert_login() {
	 alert("로그인후 이용가능합니다!");
	
}
</script>
<script>
	function go_search(frm) {
		frm.action = "MyCon?type=product_search";
		frm.submit();
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

				<ul>
					<li><a href="Main.jsp"> <strong>FOREVER YOUNG</strong></a></li>
				</ul>
			</div>

			<form method="post" >
				<div id="area-search" style="width:319px; height:54px;">
					<ul>
						<input id="input-search" name="product_search_txt" type="text"
							 placeholder="11자 복근 도전! 슬리밍템 모음 ->" style="margin-bottom: 30px;">
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
	<hr style="margin-top: 98px; margin-bottom: 8px; border-top: 1px solid gray" >
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
	


<div class="container">
<div id="accordion">


<div class="card">
<div class="card-header">
	<a class="card-link" data-toggle="collapse" data-parent="accordion" href="#collapseOne"><strong>TOP5</strong>적립금과 쿠폰은 어디에서 확인하나요?</a>
</div>
<div id="collapseOne" class="collapse show">
<div class="card-body">
적립금과 쿠폰은 로그인 후 마이페이지 內  적립금/쿠폰 현황에서 확인하실 수 있습니다.
</div>
</div>
</div>

<div class="card">
<div class="card-header">
	<a class="card-link" data-toggle="collapse" data-parent="accordion" href="#collapseTwo"><strong>TOP5</strong>상품 후기는 어디에서 작성하나요?</a>
</div>
<div id="collapseTwo" class="collapse">
<div class="card-body">
상품 후기는 상품 상세페이지에서 등록이 가능합니다.<br>
</div>
</div>
</div>

<div class="card">
<div class="card-header">
	<a class="card-link" data-toggle="collapse" data-parent="accordion" href="#collapseThree"><strong>TOP5</strong>배송비는 얼마인가요?</a>
</div>
<div id="collapseThree" class="collapse">
<div class="card-body">
포레버영은 무료 배송을 원칙으로 하고 있습니다.<br>
얼마를 구매하셔도 무료로 배송해드립니다.<br>
<br>
※ 업체배송 상품의 경우 업체의 규정에 따라 비용이 상이할 수 있습니다.<br>
</div>
</div>
</div>

<div class="card">
<div class="card-header">
	<a class="card-link" data-toggle="collapse" data-parent="accordion" href="#collapseFour"><strong>TOP5</strong>반품은 언제까지 가능한가요?</a>
</div>
<div id="collapseFour" class="collapse">
<div class="card-body">
반품은 상품을 수령하신 날짜를 기준으로 15일 이내에 가능합니다.<br>
다만 상품의 불량, 배송 오류 등 당사의 실수로 인한 반품인 경우, 30일 이내 신청이 가능합니다.<br>
</div>
</div>
</div>

<div class="card">
<div class="card-header">
	<a class="card-link" data-toggle="collapse" data-parent="accordion" href="#collapseFive"><strong>TOP5</strong>주문한 상품은 언제 배송되나요?</a>
</div>
<div id="collapseFive" class="collapse">
<div class="card-body">
주문하신 상품은 주문일 기준 3일~5일 이내(주말 및 공휴일 제외)로 배송됩니다.<br>
<br>
※ 도서산간, 제주도 지역의 경우 5~7일 이내 배송됩니다.<br>
※ 브랜드 세일 기간에는 주문량 폭주로 인해 주문일로부터 5~7일 이내 배송됩니다.<br>
※ 예약배송 상품의 경우, 지정된 배송일에 배송됩니다.<br>
 <br>
</div>
</div>
</div>



</div> 

 
</div>
<!-- end of container -->
<br>
<br>
<!-- 
<button type="button" id="button" style="float: right;">메인으로 돌아가기</button>
 -->
<button type="button" class="btn" id="button" style="float: right;"><a style="text-decoration:none; color: white;" href="http://localhost:8080/ForeverYoung/Main.jsp">메인으로 돌아가기</a></button>
	
	<jsp:include page="footer.jsp"/>


</body>
</html>