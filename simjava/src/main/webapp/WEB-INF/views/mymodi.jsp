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
					<c:when test="${not empty mho}">
						<form action="mo_ho" id="mo_ho" method="POST">
							<c:forEach items="${mho}" var="mho">
								<input type="text" hidden="hidden" id="HOID" name="HOID"
									value="${login.MID}">
								<div class="row">
									<div class="se">
										<label for="num1">생년월일</label>
									</div>
									<script
										src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
									<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
									<script>
										$(function() {
											$("#HOBIRTH")
													.datepicker(
															{
																changeMonth : true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
																changeYear : true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
																maxDate : new Date, // 현재날짜로부터 100년이전까지 년을 표시한다.
																nextText : '다음 달', // next 아이콘의 툴팁.
																prevText : '이전 달', // prev 아이콘의 툴팁.
																yearRange : "1920:2020", //연도 범위
																showMonthAfterYear : true, // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
																dayNamesMin : [
																		'월','화','수','목','금','토','일' ], // 요일의 한글 형식.
																monthNamesShort : [
																		'1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월' ], // 월의 한글 형식.
																dateFormat : "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
															});
										});
									</script>
									<div class="sel">
										<input type="text" name="HOBIRTH" id="HOBIRTH"
											required="required"
											value="<fmt:formatDate value="${mho.HOBIRTH}"
							pattern="yyyy-MM-dd" />" />
									</div>
								</div>
								<br>
								<div class="row">
									<div class="se">
										<label for="num1">연락처</label>
									</div>
									<div class="sel">
										<input type="tel" name="HOPHONE" id="HOPHONE"
											pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}" value="${mho.HOPHONE}"
											placeholder="예) 000-1234-5678" required="required">
									</div>
								</div>
								<br>
								<div class="row">
									<div class="se">
										<label for="num1">성별코드</label>
									</div>
									<div class="sel">
										<input style="width: 10%;" type="radio" name="HOGCODE" id="HOGCODE" value="1"
											<c:if test="${mho.HOGCODE eq '1'}">checked</c:if> />남성 
										<input style="width: 10%;" type="radio" name="HOGCODE" id="HOGCODE"	value="2" 
										 	<c:if test="${mho.HOGCODE eq '2'}">checked</c:if> />여성
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
												<option value="${b.BCODE}"
													<c:if test="${mho.BCODE eq b.BCODE}">selected</c:if>>
													${b.BNAME}</option>
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
											required="required" value="${mho.HOACNUM}">
									</div>
								</div>
								<br>

								<br>
								<br>
								<div class="row">
									<div class="se" style="position: absolute; left: 70%;">
										<button type="submit" style="color: white; margin-left: 8px"
										onclick="ch();">호스트수정</button>
									</div>
								</div>
			<script>
			function ch() {
				confirm("호스트정보가 수정되었습니다.");
			}
			</script>
							</c:forEach>
						</form>
						</c:when>
					<c:otherwise>
					<br>
					<h2 style="font-size:23px">호스트 정보를 등록하지 않았습니다!</h2>
					<br><br><br>
					</c:otherwise>
				</c:choose>


			</div>
		</section>
	</main>
</body>
</html>