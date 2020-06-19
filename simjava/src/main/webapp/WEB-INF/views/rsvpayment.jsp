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
<style>
.sel2 {
	float: left;
	width: 17%;
	margin-top: 6px;
}

</style>
<body>
	<div class="na">결제하기</div>

	<!--컨텐츠-->
	<main>
		<section id="menu"></section>

		<section id="menu2" style="height: auto;">
			<div class="content">
				<h3 style="font-size: 20px;">결제 카드정보 입력</h3>
				<br>
				<hr>
				<br>
				<form action="update_rsvend" id="insert_rsv" method="POST">
					<input type="hidden" id="RCODE" name="RCODE" value="${RCODE}">
					<input type="hidden" id="MID" name="MID" value="${login.MID}">
					<input type="hidden" id="HOID" name="HOID" value="${login.MID}">
					<div class="row">
						<div class="se">
							<label for="num1">카드번호</label>
						</div>
						<div class="sel">
							<input type="text" name="RCARDNUM" placeholder="(공백적용하여 16자리)"
								required="required">
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">카드유효기간</label>
						</div>
						<div class="sel2">
						<input type="number" min="1" max="12" name="RCARDENDM" placeholder="월 (2자리)" required="required" >
						<input type="number" min="1" max="31" name="RCARDENDD" placeholder="일 (2자리)" required="required">
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">카드CVV번호</label>
						</div>
						<div class="sel2">
							<input type="text" max="999" name="RCARDCVV"
								placeholder="(3자리)" required="required">
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">결제금액</label>
						</div>
						<div class="sel2">							
						<input min="0"  required="required"
						value="<fmt:formatNumber value="${pri}" pattern="#,###,###"/>" readonly>
						</div>
					</div>
					<br> <br> <br>
					<h3 style="font-size: 20px;">이용규칙 동의서</h3>
					<br>
					<hr>
					<br>
					<div class="row">
						<div class="sel">
							<iframe style="width: 700px; height: 250px;"
								src="/simapp/ifm/ifmagree.html"></iframe>
							<br> <br> <input style="width: 20%;" type="checkbox" name="yn"
								required="required">이용규칙에 동의합니다
						</div>
					</div>
					<br> <br> <br>
					<div class="row">
						<div class="se" style="position: absolute; left: 70%;">
							<button type="submit" id="BtnDateSearch"
								style="color: white; margin-left: 8px">결제하기</button>
						</div>
					</div>
				</form>
			</div>
		</section>
	</main>
</body>
</html>