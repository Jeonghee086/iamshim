<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/uphinsert.css">
</head>
<header class="parallax"> </header>
<body>
	<div class="na">호스트에게 예약요청 보내기</div>

	<!--컨텐츠-->
	<main>
		<section id="menu"></section>

		<section id="menu2" style="height: auto;">
			<div class="content">
				<h3 style="font-size: 20px;">게스트정보 입력</h3>
				<br>
				<hr>
				<br>
				<form action="insert_rsv" id="insert_rsv" method="POST">
					<input type="hidden" id="MID" name="MID" value="${login.MID}">
					<input type="hidden" id="HOID" name="HOID" value="${login.MID}">
					<input type="hidden" id="SHCODE" name="SHCODE" value="${SHCODE}">
					<input type="hidden" id="RES" name="RES" value="${res}">
					<div class="row">
						<div class="se">
							<label for="num1">생년월일</label>
						</div>
						<div class="sel">
							<input type="text" name="RMBIRTH" id="RMBIRTH"
								required="required" />
						</div>
					</div>
<!-- ex) 날짜  -->
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- datepicker 한국어로 -->
<script	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<script>
			$(function() {
				$("#RMBIRTH").datepicker({
					maxDate : new Date(),
					changeMonth : true,
					changeYear: true,
					yearRange: "1920:2020"
					});
				});
</script>	
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">연락처</label>
						</div>
						<div class="sel">
							<input type="tel" name="RMPHONE" id="RMPHONE"
								pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}"
								placeholder="예) 000-1234-5678" required="required">
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">성별코드</label>
						</div>
						<div class="sel"><br>
							<input style="width: 10%;" type="radio" name="MGCODE" id="MGCODE" value="1" />남성 
							<input style="width: 10%;" type="radio" name="MGCODE" id="MGCODE" value="2" />여성
						</div>
					</div>
					<br> <br> <br> 
					<h3 style="font-size: 20px;">예약정보 입력</h3>
					<br>
					<hr>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">체크인 날짜</label>
						</div>
						<div class="sel">
							<input type="text" id="RCHECKIN" name="RCHECKIN" value="${RCHECKIN }"
								readonly/>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">체크아웃 날짜</label>
						</div>
						<div class="sel">
							<input type="text" id="RCHECKOUT" name="RCHECKOUT" value="${RCHECKOUT }"
								readonly>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">숙박인원</label>
						</div>
						<div class="sel">
							<input type="number" min="0" name="RPPLNUM"  value="${HPPLNUM }"
								placeholder="인원수를 입력하세요" required="required" readonly>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">결제예상금액</label>
						</div>
						<div class="sel">
						<input min="0"  required="required"
						value="<fmt:formatNumber value="${RPRICE}" type="currency"/>" readonly >
						<input type="hidden" min="0" name="RPRICE"  value="${RPRICE }">
						</div>
					</div>
					<br> <br> <br>
					<div class="row">
						<div class="se" style="position: absolute; left: 70%;">
							<button type="submit" id="BtnDateSearch"
								style="color: white; margin-left: 8px">예약요청</button>
						</div>
					</div>
				</form>
			</div>
		</section>
	</main>
</body>
<!-- ex) 날짜  -->
<link rel="stylesheet"	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- datepicker 한국어로 -->
<script	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>

</html>