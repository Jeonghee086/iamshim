<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/uphinsert.css">
</head>
<header class="parallax">
	
</header>
<body>
	<div class="na">호스트가 되어볼까요?</div>
	<!--컨텐츠-->
	<main>
		<section id="menu">
			<ul id="mn">
				<li><a >1단계 : 호스트정보 입력</a></li>
				<li><a >2단계 : 숙소정보 입력</a></li>
				<li><a style="color: rgba(165, 42, 42, 0.705);">3단계 : 약관동의 </a></li>
			</ul>
		</section>

		<section id="menu2" style="height: auto;">
			<div class="content">
				<h3 style="font-size: 20px;">3단계 약관동의</h3>
				<hr>
				<br>

				<form action="insert_house3" method="post">
					<div class="row">
						<div class="sel">
							<iframe style="width: 700px; height: 240px;"
								src="/simapp/ifm/ifm1.html"></iframe>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="sel">
							<iframe style="width: 700px; height: 240px;"
								src="/simapp/ifm/ifm02.html"></iframe>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="sel">
							<iframe style="width: 700px; height: 200px;"
								src="/simapp/ifm/ifm03.html"></iframe>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="sel">
							<iframe style="width: 700px; height: 150px;"
								src="/simapp/ifm/ifm04.html"></iframe>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="sel">
							<iframe style="width: 700px; height: 140px;"
								src="/simapp/ifm/ifm05.html"></iframe>
							<br> <br> <input style="width: 20%;" type="checkbox" name="yn"
								required="required">모두 동의
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se" style="position: absolute; left: 70%;">
							<button type="submit" style="color: white; margin-left: 8px">
								숙소등록</button>
						</div>
					</div>
				</form>
			</div>
		</section>
	</main>
</body>
</html>