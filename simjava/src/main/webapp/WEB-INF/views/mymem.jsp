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
			id="defaultOpen">예약요청 조회(호스트)</button>
		<button class="tablinks" onclick="openCity(event, 'guest')">
			결제여부 조회(게스트)</button>
	</div>
	<div id="host" class="tabcontent">
		<table id="tbl">
			<tr>
				<th>예약번호</th>
				<th>숙소위치</th>
				<th>게스트</th>
				<th>체크인 날짜</th>
				<th>체크아웃 날짜</th>
				<th>숙박일수</th>
				<th>결제금액</th>
				<th>진행상태</th>
				<th>요청결과선택</th>
			</tr>
			<c:forEach items="${hst}" var="hst">
				<tr>
					<td>${hst.RCODE }</td>
					<td>${hst.CITYNAME} ${hst.ANAME} ${hst.HADETAIL}<br>${hst.HNAME}</td>
					<td>${hst.MID}(${hst.MNAME}님)</td>
					<td><fmt:formatDate value="${hst.RCHECKIN}"
							pattern="yyyy-MM-dd" /></td>
					<td><fmt:formatDate value="${hst.RCHECKOUT}"
							pattern="YYYY-MM-dd" /></td>
					<td>${hst.RES }</td>
					<td><fmt:formatNumber value="${hst.RPRICE}"
							pattern="#,###,###" /></td>
					<td>${hst.PGNAME }</td>
					<td><c:choose>
							<c:when test="${hst.PGNAME == '결제완료'}">
								<a class="c" href="/simapp/rsvrecipt?RCODE=${hst.RCODE}">결제내역</a>
							</c:when>
							<c:when test="${hst.PGNAME == '결제취소'}">
								<a	href="/simapp/mymemdel?RCODE=${hst.RCODE}&HOID=${login.MID}&MID=${login.MID}"
									onclick="del();">결제취소(기록삭제)</a>
							</c:when>
							<c:otherwise>
								<a class="c" href="/simapp/mymemup?RCODE=${hst.RCODE}&PGCODE=2&HOID=${login.MID}&MID=${login.MID}">요청수락</a>
								<a class="c" href="/simapp/mymemup?RCODE=${hst.RCODE}&PGCODE=3&HOID=${login.MID}&MID=${login.MID}">요청거절</a>
							</c:otherwise>
						</c:choose>
						
						</td>
				</tr>
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
				<th>숙소위치</th>
				<th>호스트</th>
				<th>체크인 날짜</th>
				<th>체크아웃 날짜</th>
				<th>숙박일수</th>
				<th>결제금액</th>
				<th>진행상태</th>
				<th>결제가능여부</th>
			</tr>
			<c:forEach items="${gst}" var="gst">
				<tr>
					<td>${gst.RCODE }</td>
					<td>${gst.CITYNAME} ${gst.ANAME} ${gst.HADETAIL}<br>${gst.HNAME}</td>
					<td>${gst.HOID}(${gst.HONAME}님)</td>
					<td><fmt:formatDate value="${gst.RCHECKIN }"
							pattern="yyyy-MM-dd" /></td>
					<td><fmt:formatDate value="${gst.RCHECKOUT }"
							pattern="yyyy-MM-dd" /></td>
					<td>${gst.RES }</td>
					<td><fmt:formatNumber value="${gst.RPRICE}"
							pattern="#,###,###" /></td>
					<td>${gst.PGNAME}</td>
					<td><c:choose>
							<c:when test="${gst.PGNAME == '예약수락'}">
								<a class="c" href="/simapp/rsvpayment?RCODE=${gst.RCODE}" onclick="pay();">결제가능</a>
							</c:when>
							<c:when test="${gst.PGNAME == '예약거절'}">
								<a href="/simapp/mymemdel?RCODE=${gst.RCODE}&HOID=${login.MID}&MID=${login.MID}"
								onclick="del();">예약거절(기록삭제)</a>
							</c:when>
							<c:when test="${gst.PGNAME == '결제완료'}">
								<a class="c" href="/simapp/rsvrecipt?RCODE=${gst.RCODE}">결제내역</a>
								<br>
								<a 	href="/simapp/mymemup?RCODE=${gst.RCODE}&PGCODE=5&HOID=${login.MID}&MID=${login.MID}"
								onclick="alldel();">결제취소 및 환불</a>
							</c:when>
							<c:when test="${gst.PGNAME == '결제취소'}">
								<a href="/simapp/mymemdel?RCODE=${gst.RCODE}&HOID=${login.MID}&MID=${login.MID}"
								onclick="del();">결제취소(기록삭제)</a>
							</c:when>
							<c:otherwise>
							요청대기중
							<a href="/simapp/mymemdel?RCODE=${gst.RCODE}&HOID=${login.MID}&MID=${login.MID}"
							onclick="del();">요청삭제</a>
							</c:otherwise>
						</c:choose></td>
				</tr>
			</c:forEach>
		</table>

		<script>
			function pay() {
				confirm("결제페이지로 넘어갑니다.");
			}
			function del() {
				confirm("기록이 삭제되었습니다.");
			}
			function alldel() {
				confirm("결제가 취소되었습니다. 일주일내로 등록한 카드로 환불됩니다.");
			}
		</script>
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
