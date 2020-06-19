<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/uphinsert.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />

</head>

<header class="parallax"> </header>

<body>
	<div class="na">호스트가 되어볼까요?</div>
	<!--컨텐츠-->
	<main>
		<section id="menu">
			<ul id="mn">
				<li><a style="color: rgba(165, 42, 42, 0.705);">1단계 : 호스트정보 입력</a></li>
				<li><a>2단계 : 숙소정보 입력</a></li>
				<li><a>3단계 : 약관동의 </a></li>
			</ul>
		</section>

		<section id="menu2" style="height: auto;">
			<div class="content">
				<h3 style="font-size: 20px;">1단계 호스트정보 입력</h3>
				<br>
				<hr>
				<br>
				<form action="update_ho" id="update_ho" method="POST">
					<input type="text" hidden="hidden" id="HOID" name="HOID" value="${login.MID}">
					<div class="row">
						<div class="se">
							<label for="num1">생년월일</label>
						</div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
$(function () {
    $("#HOBIRTH").datepicker({
        changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
        changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
        maxDate: new Date, // 현재날짜로부터 100년이전까지 년을 표시한다.
        nextText: '다음 달', // next 아이콘의 툴팁.
        prevText: '이전 달', // prev 아이콘의 툴팁.
        yearRange: "1920:2020", //연도 범위
        showMonthAfterYear: true, // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], // 월의 한글 형식.
        dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
    });
});
</script>
					<div class="sel">
							<input type="text" name="HOBIRTH" id="HOBIRTH"
								required="required" />
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">연락처</label>
						</div>
						<div class="sel">
							<input type="tel" name="HOPHONE" id="HOPHONE"
								pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}"
								placeholder="예) 000-1234-5678" required="required">
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">성별코드</label>
						</div>
						
						<div class="sel">
						<br>
							<input style="width: 10%;" type="radio" name="HOGCODE" id="HOGCODE" value="1" />남성 
							<input style="width: 10%;" type="radio" name="HOGCODE" id="HOGCODE" value="2" />여성
						</div>
					</div>
					<br>


					<div class="row">
						<div class="se">
							<label for="num1">주거래 은행선택</label>
						</div>
						<div class="sel">
							<select name="BCODE" id="BCODE">
								<option>선택</option>
								<c:forEach items="${b}" var="b">
									<option value="${b.BCODE}">${b.BNAME}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">계좌번호</label>
						</div>
						<div class="sel">
							<input name="HOACNUM" placeholder="-를 제외하고 입력할 것"
								required="required">
						</div>
					</div>
					<br>

					<br> <br>
					<div class="row">
						<div class="se" style="position: absolute; left: 70%;">
							<button type="submit" style="color: white; margin-left: 8px">다음단계</button>
						</div>
					</div>
				</form>

			</div>
		</section>
	</main>
</body>
</html>