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
<link rel="stylesheet" href="css/mymem.css">
</head>
<header class="parallax"> </header>
<style>
td a {
	text-decoration: none;
	font-weight: bold;
	color: black;
}

td {
	height: 70px;
	width: auto;
}

td a:hover {
	text-decoration: none;
	color: gray;
	font-weight: bold;
}

.c {
	text-decoration: none;
	font-weight: bold;
	color: brown;
}

.c:hover {
	text-decoration: none;
	color: pink;
	font-weight: bold;
}
</style>
<body>
	<div class="na">
		<button class="tablinks" onclick="openCity(event, 'host')"
			id="defaultOpen">계약완료 숙소조회</button>
		<button class="tablinks" onclick="openCity(event, 'guest')">
			숙박완료 수수료조회</button>
	</div>
	<div id="host" class="tabcontent">
		<table id="tbl">
			<tr>
				<th>숙소공유번호</th>
				<th>호스트(아이디(이름))</th>
				<th>숙소주소</th>
				<th>계약시작일</th>
				<th>계약종료일</th>
			</tr>
			<c:forEach items="${adh}" var="adh">
				<tr>
					<td>${adh.SHCODE }</td>
					<td>${adh.HOID}(${adh.HONAME}님)</td>
					<td>${adh.CITYNAME} ${adh.ANAME} ${adh.HADETAIL} (${adh.HAZIPCODE})</td>
					<td><fmt:formatDate value="${adh.SHSTART}"
							pattern="yyyy-MM-dd" /></td>
					<td><fmt:formatDate value="${adh.SHEND}"
							pattern="YYYY-MM-dd" /></td>
			</c:forEach>
		</table>
		<br> <br>
		<div class="naNum" style="text-align: center;">
			<a href="#">이전</a> <a>( 1 )</a> <a>( 2 )</a> <a>( 3 )</a> <a>( 4
				)</a> <a>( 5 )</a> <a>( 6 )</a> <a>( 7 )</a> <a>다음</a>
		</div>
	</div>

	<div id="guest" class="tabcontent">
		<table id="tbl">
			<tr>
				<th>예약번호</th>
				<th>게스트</th>
				<th>호스트</th>
				<th>체크인 날짜</th>
				<th>체크아웃 날짜</th>
				<th>결제금액</th>
				<th>진행상태</th>
				<th>수수료(3%)</th>
			</tr>
			<c:forEach items="${adpri}" var="admend">
				<tr>
					<td>${admend.RCODE }</td>
					<td>${admend.MID}(${admend.MNAME}님)</td>
					<td>${admend.HOID}(${admend.HONAME}님)</td>
					<td><fmt:formatDate value="${admend.RCHECKIN}"
							pattern="yyyy-MM-dd" /></td>
					<td><fmt:formatDate value="${admend.RCHECKOUT}"
							pattern="YYYY-MM-dd" /></td>
					<td><fmt:formatNumber value="${admend.RPRICE}"
							pattern="#,###,###" /></td>
					<td>${admend.PGNAME }</td>
					<td><fmt:formatNumber value="${admend.RPRICE*0.03}"
							pattern="#,###,###" /></td>
			</c:forEach>
		</table>
		<br> <br>
		<div class="naNum" style="text-align: center;">
			<a href="#">이전</a> <a>( 1 )</a> <a>( 2 )</a> <a>( 3 )</a> <a>( 4
				)</a> <a>( 5 )</a> <a>( 6 )</a> <a>( 7 )</a> <a>다음</a>
		</div>
	</div>

	<script>
		function openCity(evt, cityName) {

			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablinks");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(
						" active", "");
			}
			document.getElementById(cityName).style.display = "block";
			evt.currentTarget.className += " active";
		}
		// Get the element with id="defaultOpen" and click on it
		document.getElementById("defaultOpen").click();
	</script>

</body>
</html>