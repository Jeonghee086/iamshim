<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <style>
nav {
	position: sticky;
	top: 0;
	background-color: rgba(255, 255, 255, 0.596);
}
</style> -->
<c:choose>
	<c:when test="${not empty login && login.AUCODE == '1'}">
		<nav>
			<div class="menu">
				<ul>
					<li><a href="/simapp/">HOME</a></li>
					<li><a href="/simapp/hinsert1">숙소 호스트되기</a></li>
					<li><a href="/simapp/mymodi?HOID=${login.MID}">${login.MNAME}(회원)님</a></li>
					<li><a href="/simapp/mymem?HOID=${login.MID}&MID=${login.MID}">마이페이지</a></li>
					<li><a href="logout">로그아웃</a></li>
				</ul>
			</div>
		</nav>
	</c:when>
	<c:when test="${not empty login && login.AUCODE == '2'}">
		<nav>
			<div class="menu">
				<ul>
					<li><a href="/simapp/">HOME</a></li>
					<li><a>${login.MNAME}(관리자)님</a></li>
					<li><a href="/simapp/myadmin">관리자페이지</a></li>
					<li><a href="logout">로그아웃</a></li>
				</ul>
			</div>
		</nav>
	</c:when>
	<c:otherwise>
		<nav>
			<div class="menu">
				<ul>
					<li><a href="/simapp/">HOME</a></li>
					<li><a href="/simapp/login">로그인</a></li>
					<li><a href="/simapp/mymem2">회원가입</a></li>
				</ul>
			</div>
		</nav>
	</c:otherwise>
</c:choose>
<style>

/* 메뉴 */
nav {
	float: right;
	padding-right: 10px;
}

nav a:hover {
	border-bottom: 2px solid black;
	padding-bottom: 20px;
	color: gray;
}

.menu ul {
	list-style-type: none;
}

.menu li {
	margin: 20px;
	float: left;
}

.menu ul a {
	text-decoration: none;
	color: black;
	font-size: 18px;
	font-weight: bold;
}
</style>