<%@page import="simcom.House"%>
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



<script  src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>



</head>
<header class="parallax"> </header>

<body>
	<div class="na">호스트가 되어볼까요?</div>
	<!--컨텐츠-->
	<main>
		<section id="menu">
			<ul id="mn">
				<li><a>1단계 : 호스트정보 입력</a></li>
				<li><a style="color: rgba(165, 42, 42, 0.705);">2단계 : 숙소정보 입력</a></li>
				<li><a>3단계 : 약관동의 </a></li>
			</ul>
		</section>

		<section id="menu2" style="height: auto;">
			<div class="content">
				<h3 style="font-size: 20px;">2단계 숙소정보 입력 (1/2)</h3>
				<br>
				<hr>
				<br>
				<form action="insert_house" id="insert_house" method="POST">
				<input type="text"  hidden="hidden" id="HOID" name="HOID" value="${login.MID}">
					<div class="row">
						<div class="se">
							<label for="num1">숙소범주</label>
						</div>
						<div class="sel">
							<select name="CCODE" id="CCODE" required="required"
								onChange="populate(this.id, 'TCODE')">
								<option>선택</option>
								<c:forEach items="${c}" var="c">
									<option value="${c.CCODE}">${c.CNAME}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<br>
					<script type="text/javascript">
						function populate(c, t) {
							var c = document.getElementById(c);
							var t = document.getElementById(t);
							t.innerHTML = "";
							if (c.value == 1) {
								var optionArray = [ "|", "1|일반아파트", "2|공동주택", "3|레지던스" ];
							} else if (c.value == 2) {
								var optionArray = [ "|", "1|타운하우스", "2|저택", "3|돔하우스" ];
							} else if (c.value == 3) {
								var optionArray = [ "|", "1|펜션", "2|캠핑카", "3|텐트" ];
							} else if (c.value == 4) {
								var optionArray = [ "|", "1|호스텔", "2|호텔",	"3|리조트" ];
							}
							for ( var option in optionArray) {
								var pair = optionArray[option].split("|");
								var newOption = document.createElement("option");
								newOption.value = pair[0];
								newOption.innerHTML = pair[1];
								t.options.add(newOption);
							}
						}
					</script>
					<div class="row">
						<div class="se">
							<label for="num1">숙소유형</label>
						</div>
						<div class="sel">
							<select name="TCODE" id="TCODE">
								<option>선택</option>
							</select>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">예약범위</label>
						</div>
						<div class="sel">
							<select name="RCODE" id="RCODE">
								<option>선택</option>
								<c:forEach items="${r}" var="r">
									<option value="${r.RCODE}">${r.RNAME}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">사업자여부</label>
						</div>
						<div class="sel">
						<br>
							<input style="width: 10%;" type="radio" name="HOWNCODE" id="HOWNCODE" value="1" />예
							<input style="width: 10%;" type="radio" name="HOWNCODE" id="HOWNCODE" value="2" />아니오
						</div>
					</div>
					<br>
					<div class="row">
						<div class="se">
							<label for="num1">숙소위치</label>
						</div>
						<div class="sel">
							<br>
							<div>
								시도선택<br> 
								<select name="CITYCODE" id="CITYCODE" onChange="select('CITYCODE', 'ACODE')">
									<option>선택</option>
									<c:forEach items="${city}" var="city">
										<option value="${city.CITYCODE}">${city.CITYNAME}</option>
									</c:forEach>
								</select>
							</div>
							<br>
							<div>
								군구선택<br> 
								<select name="ACODE" id="ACODE">
									<option>선택</option>
								</select>
							</div>
							<br>
							<div>
								상세주소<br>
								<input type='text' 	style=" height:50px;" required="required"
								name="HADETAIL"	id="HADETAIL" placeholder="상세주소입력"/>
								<!-- <input type="button" onclick="chkDupId()" 
								value="호스팅 가능여부" 
								style="width: 50%; background-color: beige;"> -->
							</div>
							<br>
							<div>
								우편번호 <br>
								<input type="text" name="HAZIPCODE" required="required">
							</div>
						</div>
					</div>
					
					
					
<!-- <script type="text/javascript">
		function chkDupId(){
	  			
			$.ajax({	
				url: "/simapp/hinsert2hadetail",
				type: "GET",
				data: {
					'HADETAIL': ${HADETAIL}
					},
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                dataType: "text",
				
				success: function(data){
					alert(data);
					if(data == 0){
						alert('호스팅 가능한 숙소입니다.');
						$('#HADETAIL').focus();
					}else{
						alert('입력하신 상세주소가 이미 존재합니다. 다시 입력해 주세요.');
					}
				}, 
				error: function(){
					alert("에러");
				}
			});
		}
</script> -->
<br>
					<script type="text/javascript">
						function select(city, a) {
							var city = document.getElementById(city);
							var a = document.getElementById(a);
							a.innerHTML = "";
							if (city.value == 1) {
								var optionArray = [ "|", "1|구로구", "2|서초구",
										"3|영등포구" ];
							} else if (city.value == 2) {
								var optionArray = [ "|", "1|고양시", "2|과천시",
										"3|부천시" ];
							} else if (city.value == 3) {
								var optionArray = [ "|", "1|남동구", "2|부평구",
										"3|연수구" ];
							}
							for ( var option in optionArray) {
								var pair = optionArray[option].split("|");
								var newOption = document
										.createElement("option");
								newOption.value = pair[0];
								newOption.innerHTML = pair[1];
								a.options.add(newOption);
							}
						}
					</script>
					<br>
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