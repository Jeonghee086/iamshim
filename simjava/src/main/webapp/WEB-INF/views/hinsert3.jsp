<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/uphinsert.css">
</head>
<header class="parallax"> </header>

<style>
td {
	width: 0;
}

table input {
	width: 10%;
}

table td {
	width: auto;
}
</style>

<body>
	<div class="na">호스트가 되어볼까요?</div>
	<!--컨텐츠-->
	<main>
		<section id="menu">
			<ul id="mn">
				<li><a>1단계 : 호스트정보 입력</a></li>
				<li><a style="color: rgba(165, 42, 42, 0.705);">2단계 : 숙소정보 입력</a></li>
				<li><a >3단계 : 약관동의
				</a></li>
			</ul>
		</section>

		<section id="menu2" style="height: auto;">
			<div class="content">
				<h3 style="font-size: 20px;">2단계 숙소정보 입력 (2/2)</h3>
				<br>
				<hr>
				<br>
				<form action="update_house" id="update_house" method="POST"
					enctype="multipart/form-data">
					<input type="text" hidden="hidden" id="HCODE" name="HCODE"
						value="${b}">
					<div class="row">
						<div class="se">
							<label for="num1">숙소이름</label>
						</div>
						<div class="sel">
							<input type="text" name="HNAME" placeholder="숙소이름을 입력하세요"
								required="required">
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">숙박가능인원</label>
						</div>
						<div class="sel">
							<input type="number" min="0" name="HPPLNUM"
								placeholder="인원수를 입력하세요" required="required">
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">숙박가격</label>
						</div>
						<div class="sel">
							<input type="text" name="HPRICE" placeholder="숙박가격을 입력하세요"
								required="required">
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">침실개수</label>
						</div>
						<div class="sel">
							<input type="number" min="0" name="HBEDRMNUM"
								placeholder="침실개수를 입력하세요" required="required">
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">침대개수</label>
						</div>
						<div class="sel">
							<input type="number" min="0" name="HBEDNUM"
								placeholder="침대개수를 입력하세요" required="required">
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">욕실개수</label>
						</div>
						<div class="sel">
							<input type="number" min="0" name="HBATHRMNUM"
								placeholder="욕실개수를 입력하세요" required="required">
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">욕실공용여부</label>
						</div>
						<div class="sel">
							<input style="width: 10%;" type="radio" name="HBSCODE" value="1" />예
							<input style="width: 10%;" type="radio" name="HBSCODE" value="2" />아니오
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">편의시설<br>(복수선택)</label>
						</div>

						<div class="sel" id="CVNAME">
							<table>
								<tr>
									<td><input type="checkbox" name="CVNAME" value="에어컨">
										에어컨</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="CVNAME" value="샴푸,수건,비누">
										샴푸,수건,비누</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="CVNAME" value="침대시트,화장지">
										침대시트,화장지</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="CVNAME" value="온수">
										온수</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="CVNAME" value="수영장">
										수영장</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="CVNAME" value="아침식사제공">
										아침식사제공</td>
								</tr>
								<tr>
									<td style="width: 20%;"><input type="checkbox"
										name="CVNAME" value="주방,조리도구,식기류"> 주방,조리도구,식기류</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="CVNAME" value="냉장고">
										냉장고</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="CVNAME" value="옷걸이">
										옷걸이</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="CVNAME" value="드라이기">
										드라이기</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="CVNAME" value="소화기">
										소화기</td>
								</tr>
							</table>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">숙소매뉴얼</label>
						</div>
						<div class="sel">
							<textarea rows="5" name="HMANUAL" style="width: 100%;"></textarea>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">숙소사진</label>
						</div>
						<input style="width: 35%;" type="file" name="uploadFile"
							placeholder="파일 선택" required="required">
					</div>
					<br>
					<div class="row">
						<div class="se" style="position: absolute; left: 70%;">
							<button type="submit" style="margin-left: 8px; color: white;">
								다음단계</button>
						</div>
					</div>
				</form>


			</div>
		</section>
	</main>
</body>

</html>