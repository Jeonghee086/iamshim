<%@page import="simcom.House"%>
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
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/uphinsert.css">
<link rel="stylesheet" href="css/footer.css">
</head>
<header class="parallax"> </header>
<style>
.d {
	width: 100%
}

td a {
	font-size: 23px;
	text-decoration: none;
	color: black;
	font-weight: bold;
}

td a:hover {
	color: rgba(165, 42, 42, 0.705);
}
</style>
<body>

	<div class="na" style="font-size: 21px">'${CITYNAME}'지역/ '${res}'박/ 최소'${HPPLNUM}'명 검색 결과 보기</div>
	<!--컨텐츠-->
	<main>
		<c:choose>
				<c:when test="${not empty hs}">
				<c:forEach items="${hs}" var="hs">
					<table>
						<tr>
							<td rowspan="7"><img src="img/${hs.HPICNAME}"
								style="width: 330px; height: 230px; border: thin lightgray solid; margin: 5px;">

							</td>
							<td>${hs.TNAME} ${hs.RNAME}</td>
						</tr>
						<tr>
							<td><a
								href="/simapp/hselectdetail?HCODE=${hs.HCODE}&MID=${login.MNAME}&HPPLNUM=${hs.HPPLNUM}">
									${hs.HNAME}</a></td>
						</tr>
						<tr>
							<td>인원${hs.HPPLNUM}명 · 침실${hs.HBEDRMNUM}개 · 침대${hs.HBEDNUM}개 · 욕실${hs.HBATHRMNUM}개</td>
						</tr>
						<tr>
							<td>${hs.CVNAME}</td>
						</tr>
						<tr>
							<td class="d" colspan="2" style="text-align: right;">${hs.CITYNAME}
								${hs.ANAME}</td>
						</tr>
						<tr>
							<td class="d" colspan="2" style="text-align: right; font-weight: bold; font-size: 18px;">
							<fmt:formatNumber value="${hs.HPRICE }" type="currency"/>/1박
							</td>
						</tr>
						<tr>
							<td class="d" colspan="2" style="text-align: right;">
							총 요금 :	<fmt:formatNumber value="${hs.HPRICE*res}" type="currency"/>
							</td>
						</tr>
					</table>
					<br>
					<br>
					</c:forEach>
				</c:when>
				<c:when test="${empty hs}">
					<table>
						<tr><td style="font-size: 25px;">
						검색하신 결과가 없습니다. 
						<br><br><br><br>다시 검색해 주세요.(잠깐! '로그인'이 되어있는지 확인해주세요)
						</td></tr>
					</table>
				</c:when>
			</c:choose>
	</main>
</body>
<!-- footer-->
<footer>
	<div class="footer-wrapper">
		<div class="single-footer">
			<h4>소개</h4>
			<br>
			<p style="font-size: 14px;">우리회사는
				<br> 게스트가 호스트와 협의하여 
				<br> 직접 계약을 체결할 수 있도록
				<br> 숙박 공유 플랫폼을 제공합니다.</p>
			<br> <a href=""><i class="fa fa-facebook"></i></a> <a href=""><i
				class="fa fa-instagram"></i></a> <a href=""><i class="fa fa-twitter"></i></a>
			<a href=""><i class="fa fa-linkedin"></i></a> <a href=""><i
				class="fa fa-youtube"></i></a> <br> <br> <br> <br>

		</div>
		<div class="single-footer">
			<h4>메뉴</h4>
			<br>
			<ul style="font-size: 14px;">
				<li><a href="#">숙소 호스팅하기</a></li>
				<br>
				<li><a href="#">숙소 조회하기</a></li>
				<br>
				<li><a href="#">로그인</a></li>
				<br>
				<li><a href="#">회원가입</a></li>
			</ul>
		</div>
		<div class="single-footer">
			<h4>연락처</h4>
			<br>
			<ul style="font-size: 14px;">
				<li><i class="fa fa-phone"></i> 010-7228-9862</li>
				<br>
				<li><i class="fa fa-envelope-o"></i> jhee086@gmail.com</li>
				<br>
				<br>
				<hr>
				<li style="color: gray;">&copy; ALL RIGHTS RESERVED BY JH</li>
			</ul>
			<br>
		</div>
	</div>
</footer>
</body>

</html>