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

td {
	font-size: 20px;
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
.sel {
	float: left;
	width: 50%;
	margin-top: 6px;
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
				<form action="mo_h" id="mo_h" method="POST">
				<input type="hidden" id="HOID" name="HOID" value="${login.MID}">
				
				<c:forEach items="${mhdetail}" var="mhdetail">
				<input type="hidden" id="HCODE" name="HCODE" value="${mhdetail.HCODE}">
				<h2 style="font-size: 20px;">[ 숙소 범주, 유형, 예약범위, 위치, 편의시설은 수정이 불가합니다. ]</h2>
				<br><br>
				<div class="row">
						<div class="se">
							<label for="num1"></label>
						</div>
						<div class="sel"><br>
							${mhdetail.CNAME} / ${mhdetail.TNAME} / ${mhdetail.RNAME}
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">숙소위치</label>
						</div>
						<div class="sel"><br>
							${mhdetail.CITYNAME}  ${mhdetail.ANAME}  ${mhdetail.HADETAIL} (${mhdetail.HAZIPCODE})
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">사업자여부</label>
						</div>
						<div class="sel">
						<br>
							<input style="width: 10%;" type="radio" name="HOWNCODE" id="HOWNCODE" value="1" 
							<c:if test="${mhdetail.HOWNCODE eq '1'}">checked</c:if> />예
							<input style="width: 10%;" type="radio" name="HOWNCODE" id="HOWNCODE" value="2"
							<c:if test="${mhdetail.HOWNCODE eq '2'}">checked</c:if>  />아니오
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">숙소이름</label>
						</div>
						<div class="sel">
							<input type="text" name="HNAME" placeholder="숙소이름을 입력하세요"
								required="required" value="${mhdetail.HNAME}">
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">숙박가능인원</label>
						</div>
						<div class="sel">
							<input type="number" min="0" name="HPPLNUM"
								placeholder="인원수를 입력하세요" required="required"
								value="${mhdetail.HPPLNUM}">
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">숙박가격</label>
						</div>
						<div class="sel">
							<input type="text" name="HPRICE" placeholder="숙박가격을 입력하세요"
								required="required" value="${mhdetail.HPRICE}">
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">침실개수</label>
						</div>
						<div class="sel">
							<input type="number" min="0" name="HBEDRMNUM" value="${mhdetail.HBEDRMNUM}"
								placeholder="침실개수를 입력하세요" required="required">
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">침대개수</label>
						</div>
						<div class="sel">
							<input type="number" min="0" name="HBEDNUM"value="${mhdetail.HBEDNUM}"
								placeholder="침대개수를 입력하세요" required="required">
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">욕실개수</label>
						</div>
						<div class="sel">
							<input type="number" min="0" name="HBATHRMNUM"value="${mhdetail.HBATHRMNUM}"
								placeholder="욕실개수를 입력하세요" required="required">
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">욕실공용여부</label>
						</div>
						<div class="sel">
							<input style="width: 10%;" type="radio" name="HBSCODE" value="1" 
							<c:if test="${mhdetail.HBSCODE eq '1'}">checked</c:if>/>예
							<input style="width: 10%;" type="radio" name="HBSCODE" value="2" 
							<c:if test="${mhdetail.HBSCODE eq '2'}">checked</c:if>/>아니오
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">편의시설 목록</label>
						</div>

						<div class="sel" id="CVNAME">
						${mhdetail.CVNAME}
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">숙소매뉴얼</label>
						</div>
						<div class="sel">
							<textarea rows="5" name="HMANUAL" style="width: 100%;">${mhdetail.HMANUAL}</textarea>
						</div>
					</div>
					<div class="row">
						<div class="se" style="position: absolute; left: 70%;">
							<button type="submit" style="color: white; margin-left: 8px"
								onclick="ch();">숙소수정</button>
						</div>
					</div>
					<script>
						function ch() {
							confirm("숙소정보가 수정되었습니다.");
						}
					</script>
					<br>
					<br>
				</c:forEach>
				</form>
			</div>
		</section>
	</main>
</body>
</html>