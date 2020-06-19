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
</head>
<style>
.di {
	padding: 100px;
    width: 90%;
    margin: auto;
}
</style>
<header class="parallax"> </header>
<body>

	<div class="na">결제내역</div>
	<div class="di">
	<div>
		<c:forEach items="${reci}" var="r">
			<h5 style="font-size: 28px;">*** '${r.HONAME}' 호스트님의 집에 '${r.MNAME}'
				게스트님이 초대되었습니다!! ***</h5>
			<br>
			<br>
			<br>
			<br>
			<h5 style="font-size: 24px;">예약정보</h5>
			<br>
			<hr>
			<br>
			<h5 style="font-size: 19px;">예약번호: ${r.RCODE}</h5>
			<br>
			<h5 style="font-size: 19px;">결제일자: <fmt:formatDate value="${r.RPAYDATE}"	 pattern="YYYY-MM-dd" /></h5>
			<br>
			<h5 style="font-size: 19px;">체크인날짜: <fmt:formatDate value="${r.RCHECKIN}"	 pattern="YYYY-MM-dd" /></h5>
			<br>
			<h5 style="font-size: 19px;">체크아웃날짜: <fmt:formatDate value="${r.RCHECKOUT}" pattern="YYYY-MM-dd" /></h5>
			<br>
			<h5 style="font-size: 19px;">숙박인원: ${r.RPPLNUM}</h5>
			<br>
			<h5 style="font-size: 19px;">숙박일수: ${r.RES}</h5>
			<br>
			<br>
			<br>
			<h5 style="font-size: 24px;">숙소정보</h5>
			<br>
			<hr>
			<br>
			<h5 style="font-size: 19px;">숙소범주: ${r.CNAME}</h5>
			<br>
			<h5 style="font-size: 19px;">숙소유형: ${r.TNAME}</h5>
			<br>
			<h5 style="font-size: 19px;">예약범위: ${r.RNAME}</h5>
			<br>
			<h5 style="font-size: 19px;">숙소위치: ${r.CITYNAME}${r.ANAME} ${r.HADETAIL}(${r.HAZIPCODE}) </h5>
			<br>
			<h5 style="font-size: 19px;">숙소메뉴얼: ${r.HMANUAL}</h5>
			<br>
			<br>
			<br>
			<h5 style="font-size: 22px;">게스트정보</h5>
			<br>
			<hr>
			<br>
			<h5 style="font-size: 18px;">게스트이름(아이디): ${r.MNAME}(${r.MID})</h5>
			<br>
			<h5 style="font-size: 18px;">게스트이메일: ${r.MEMAIL}</h5>
			<br>
			<h5 style="font-size: 18px;">게스트연락처: ${r.RMPHONE}</h5>
			<br>
			<br>
			<br>
			<h5 style="font-size: 22px;">호스트정보</h5>
			<br>
			<hr>
			<br>
			<h5 style="font-size: 18px;">호스트이름(아이디): ${r.HONAME}(${r.HOID})</h5>
			<br>
			<h5 style="font-size: 18px;">호스트이메일: ${r.HOEMAIL}</h5>
			<br>
			<h5 style="font-size: 18px;">호스트연락처: ${r.HOPHONE}</h5>
		</c:forEach>
		<div class="row">
						<div class="se" style="position: absolute; left: 80%;">
							<button type="submit" style="color: white; margin-left: 8px">영수증 출력</button>
						</div>
					</div>
	</div>
	</div>
</body>
</html>
