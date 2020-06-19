<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<title>LOGIN</title>
<link rel="stylesheet" href="css/loginstyle.css">
</head>
<body>
	<div class="signin">
		<form name="form1" method="post" action="loginProces">
			<h3>LOGIN</h3>
			<input required="required" type="text" id="MID" name="MID" placeholder="아이디를 입력하세요"> 
			<input required="required" type="password" placeholder="비밀번호를 입력하세요" id="MPWD" name="MPWD">
			<button type="submit" >로그인</button>
		</form>
	</div>
</body>
</html>