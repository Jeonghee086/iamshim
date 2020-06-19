<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/uphinsert.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
</head>
<header class="parallax"> </header>
<style>
#mn li a:hover {
	color: rgba(165, 42, 42, 0.705);
}
td{ font-size: 20px;
}
td a {
	font-size: 18px;
	text-decoration: none;
	color: black;
	font-weight: bold;
}
td a:hover {
	color: rgba(165, 42, 42, 0.705);
}
</style>
<body>
	<div class="na">호스트정보 및 숙소정보 수정</div>
	<!--컨텐츠-->
	<main>
		<section id="menu">
			<ul id="mn">
				<li><a href="/simapp/mymodi?HOID=${login.MID}">호스트정보 수정</a></li>
				<li><a href="/simapp/mymodih?HOID=${login.MID}">숙소정보 수정</a></li>
			</ul>
		</section>
		<section id="menu2" style="height: auto;">
			<div class="content">
				<br>
				<c:choose>
					<c:when test="${not empty mh}">
						<c:forEach items="${mh}" var="hs">
							<table>
								<tr>
									<td rowspan="7"><img src="img/${hs.HPICNAME}"
										style="width: 300px; height: 200px; 
										border: thin lightgray solid; margin: 5px;">
									</td>
									<td>${hs.CITYNAME} ${hs.ANAME}</td>

								</tr>
								<tr>
									<td>${hs.HADETAIL}(${hs.HAZIPCODE})</td>
								</tr>
								<tr>
									<td>
									<a href="/simapp/mymodihdetail?HCODE=${hs.HCODE}&HOID=${login.MID}">수정하기</a>
									<a href="/simapp/upmymodih?HCODE=${hs.HCODE}&HOID=${login.MID}" onclick="del();">삭제하기</a>
									</td>
								</tr>
							</table>
							<script>
							function del() {
								confirm("숙소정보가 삭제되었습니다");
							}
							</script>
							<br>
							<br>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<br>
						<h2 style="font-size: 23px">숙소를 등록하지 않았습니다!</h2>
						<br>
						<br>
						<br>
					</c:otherwise>
				</c:choose>
			</div>
		</section>
	</main>
</body>
</html>