<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>전체목록</title>
<link rel="shortcut icon" type="image/x-icon" href="images/title.png">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/theme.css"></link>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
<style>


h1 {
	
}

#productlist {
	width: 80%;
	margin-left: 150px;
	margin-top: 30px;
}

#infolist {
	list-style: none;
}

#list_content {
	display: flex;
}

#list_content1 {
	border-color: white;
	float: center;
	width: 25%;
}

#list_content1 li {
	margin: 0 auto;
}

#list_content2 ul li {
	list-style: none;
}

#p_price {
	letter-spacing: -0.02em !important;
	font-weight: 700;
	font-size: 14px;
	text-decoration: line-through;
	color: gray;
}

#p_saleprice {
	color: #ee782f;
	font-weight: 700;
}

#p_content, #p_category {
	overflow: hidden;
	color: #000;
}

#info ul li {
	text-align: center;
	margin: 0 auto;
}

#p_name {
	margin: 0 auto;
}

/******* 페이지 표시 부분 스타일(시작) *****/
.paging {
	list-style: none;
	margin-left: 700px;
}

.paging li {
	float: left;
	margin-right: 8px;
}

.paging li a {
	text-decoration: none;
	display: block;
	padding: 3px 7px;
	font-weight: bold;
	color: #bbb;
}

.paging li a:hover {
	border-radius: 50%;
	background-color: #babb3c;
	color: white;
}

.paging .disable {
	padding: 3px 7px;
	color: silver;
}

.paging .now {
	padding: 3px 7px;
	color: black;
	font-weight: bold;
}

#manager_btn {
	font-family: 'dotum', '돋움';
	background-color: transparent;
	border: 3px solid orange;
	border-radius: 10px;
	padding: 10px;
	color: orange;
	font-weight: 700;
	float: right;
	position: fixed;
    right: 2%;
    bottom: 450px;
    z-index: 999;
	margin-top: 10px;
	font-size: 20px;
	
}

#manager_btn:hover {
	border: 3px solid #babb3c;
	background-color: #babb3c;
	color: white;
}

#manager {
	float: right;
	width: 10%;
	height: 10%;
	display: block;
}

.head {
	text-align: left;
	font-size: 50px;
}

#cate_name {
	margin-left: 80px;
	margin-bottom: 30px;
}

a#MOVE_TOP_BTN {
    position: fixed;
    right: 2%;
    bottom: 50px;
    display: none;
    z-index: 999;
    border: 1px solid #999;
    padding: 10px;
    color: #999;
    font-family: 'dotum', '돋움';
}


#top_button a:hover{
	background-color: gray;
	color:white;
}
</style>

<script>
    $(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 500) {
                $('#MOVE_TOP_BTN').fadeIn();
                $('#manager_btn').stop();
                $('#manager_btn').animate( { 'top' : scrollTop });

               
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


	function user_info(frm) {
		frm.action = "MyCon?type=userinfo";
		frm.submit();
	}
	
</script>


<script>
	function add_product(frm) {
		frm.action = "MyCon?type=productReg_main&user_id=${user_id }&user_pw=${user_pw }&p_category=${p_category }";
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

				<ul>
					<li><a href="Main.jsp"> <strong>FOREVER YOUNG</strong></a></li>
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



	<div id="productlist">
		<form method="post">

			<div class="head"><div id="cate_name">${p_category }</div>
				<c:if test="${user_id eq 'manager' }">
					<div id="manager">
						<input type="button" value="상품 추가"
							onclick="add_product(this.form)" id="manager_btn">
					</div>
				</c:if>
			</div>
			<p>
				<a href="MyCon?type=productReg_main"></a>
			</p>


			<div id="list_content" class="row">
				<c:if test="${not empty prdouctlist }">
					<c:forEach var="vo" items="${prdouctlist }">
						<div id="list_content1" class="col-lg-3 col-md-4 col-sm-6 mb-4">
							<!--
							<li class="center">${vo.num }</li>
							<li>${vo.p_no }</li> -->

							<a href="MyCon?type=productOne&cPage=1&p_no=${vo.p_no }&user_id=${user_id }&user_pw=${user_pw }">
							<img src="images/${vo.p_ori_image }" class="card-img-top">
							</a>




							<br> <input type="hidden" name="idx" value="${vo.p_no }">
							<input type="hidden" name="p_no" value="${vo.p_no }"> <input
								type="hidden" name="type" value="productOne"> <input
								type="hidden" name="user_id" value="${user_id }"> <input
								type="hidden" name="user_pw" value="${user_pw }"> <input
								type="hidden" name="p_category" value="${p_category }">

							<div id="info">

								<ul id="infolist">
									<li><a style="text-decoration:none;"
										href="MyCon?type=productOne&cPage=1&p_no=${vo.p_no }&user_id=${user_id }&user_pw=${user_pw }">
											<span id="p_name">${vo.p_name }</span>
									</a></li>
									<li id="p_content">${vo.p_content }&nbsp;</li>

									<li id="p_price">${vo.p_price }원&nbsp;</li>

									<li id="p_saleprice">${vo.p_saleprice }원&nbsp;</li>

								</ul>

							</div>

						</div>
						<br>
						</table>
					</c:forEach>
				</c:if>

				<c:if test="${empty list }">

					<td colspan="4">입력된 자료가 없습니다</td>
					</tr>
				</c:if>
			</div>
		</form>
	</div>

	<div module="product_normalpaging" class="pagination_wrap">
		<nav aria-label="Page navigation example">
			<ol class="paging">
				<%--[이전으로]에 대한 사용여부 처리 --%>
				<c:choose>
					<%--사용불가(disable) : 첫번째 블록인 경우 --%>

					<c:when test="${pvo.beginPage < pvo.pagePerBlock }">
						<%-- begin page가 1이 아닌경우 --%>
						<li class="disable">&lt;</li>
					</c:when>

					<%--사용가능(enable) : 첫번째 블록이 아닌 경우 => 2페이지 이상 --%>
					<c:otherwise>
						<li class="enable"><a
							href="MyCon?type=category&p_category=${p_category }&pPage=${pvo.beginPage - 1}&user_id=${user_id }&user_pw=${user_pw }">&lt;</a></li>

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
							<li><a
								href="MyCon?type=category&p_category=${p_category }&pPage=${k }&user_id=${user_id }&user_pw=${user_pw }">${k }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<%--[다음으로]에 대한 사용여부 처리 --%>
				<c:choose>
					<%--사용불가(disable) : 마지막 블록인 경우 -> endPage가 전체페이지수 보다 크거나 같으면 --%>
					<c:when test="${pvo.endPage >= pvo.totalPage }">
						<li class="disable">&gt;</li>
					</c:when>
					<%--사용가능(enable) : 마지막 블록이 아닌 경우 --%>
					<c:otherwise>
						<li class="enable"><a
							href="MyCon?type=category&p_category=${p_category }&pPage=${pvo.endPage + 1 }&user_id=${user_id }&user_pw=${user_pw }">&gt;</a></li>
					</c:otherwise>
				</c:choose>
			</ol>
		</nav>
	</div>


	<br>
	<jsp:include page="footer.jsp" />



</body>
</html>










