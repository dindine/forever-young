<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문서</title>
<link rel="shortcut icon" type="image/x-icon" href="images/title.png">
<link rel="stylesheet" type="text/css" href="css/theme.css"></link>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<style>
.table {
	padding-right: 0px;
	padding-left: 150px;
	text-align: center;
}
.table th {
	width: 15%;
}

.table-hover {
background-color: transparent;
}

.table-striped tbody tr:nth-child(odd) td,
 
.table-striped tbody tr:nth-child(odd) th {
 
background-color: #E6EE9C;
}


#info {

margin-top: 50px;
}
</style>
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
			
<form method="post" >
            <div id="area-search" style="width:319px; height:54px;">
               <ul>
                  <input id="input-search" name="product_search_txt" type="text"
                      placeholder="11자 복근 도전! 슬리밍템 모음 ->" style="margin-bottom: 30px">
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
 

	<form method="post" action="MyCon?type=order_info">
		<div id="info" class="container text-center" >
	<h3> ${user_id } 님의 주문 내역 </h3>
			
				<table class="table table-borderd table-striped  table-hover ng-scope">
				<thead>
				<tr>
					<th>결제 번호</th>
					<th>결제일자</th>
					<th>주문자 이름</th>
					<th>전화번호</th>
					<th>배송지</th>
					<th>상품</th>
					<th>결제수단</th>
				</tr>
				</thead>
				<hr>
				<tbody>
				<c:choose>
					<c:when test="${empty b_list }">
							<td colspan="5">
								주문 내역이 없습니다.
							</td>
					</c:when>
					<c:otherwise>
						<!-- 주문 내역이 있는 경우 -->
						<c:forEach var="vo" items="${b_list }">
							<tr>

								<td>${vo.pay_id }</td>
								<td>${vo.pay_date }</td>
								<td>${vo.user_name }</td>
								<td>${vo.user_phone }</td>
								<td>${vo.user_addr }</td>
								<td>${vo.pay_p_name }</td>
								<td>${vo.user_payment }</td>
							
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</tbody>
				</table>
		</div>
	</form>
	
		<jsp:include page="footer.jsp"/>
	
</body>
</html>