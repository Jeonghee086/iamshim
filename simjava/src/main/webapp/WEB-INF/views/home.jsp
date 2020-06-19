<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0,">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>숙소는 모두 이곳에서!</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/footer.css">

<!-- ex) 날짜  -->
<link rel="stylesheet"	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"	type="text/css" />
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- datepicker 한국어로 -->
<script	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>

<script>
  $(function () {
    $("#Date1").datepicker({
      minDate: new Date(),
      onClose: function (selectedDate) {
        // 시작일(fromDate) datepicker가 닫힐때
        // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
        if (selectedDate != "") {
          var curDate = $("#Date1").datepicker("getDate");  // Date return
          curDate.setDate(curDate.getDate() + 1);
          $("#Date2").datepicker("option", "minDate", curDate);
        }
      }
    });
    $("#Date2").datepicker({
      onClose: function (selectedDate) {  // 날짜를 설정 후 달력이 닫힐 때 실행
        if (selectedDate != "") {   
          $("#Date1").datepicker("option", "maxDate", selectedDate);
        }
      }
    });
  });
  function date() {
		if (!$("#Date1").val()) {
			alert("시작날짜를 선택하세요");
			return false;
		}
		if (!$("#Date2").val()) {
			alert("끝날짜를 선택하세요");
			return false;
		}
		var date1 = new Date($("#Date1").datepicker("getDate"));
		var date2 = new Date($("#Date2").datepicker("getDate"));
		var c = date2.getTime() - date1.getTime();
		var result = c / (1000 * 60 * 60 * 24);
		document.getElementById("res").value = result;
	}

</script>
<style>
.sch_input2 {
	height: 45px;
	width: 50%;
	color: rgb(100, 98, 98);
	font-size: 15px;
	border: 1px solid rgb(230, 227, 227);
	float: left;
}

.a {
    height: 190px;
    width: 100%;
    border-radius: 6px;
}
.b {
    height: 250px;
    width: 100%;
    border-radius: 6px;
}
</style>
</head>
<body>
	<header class="parallax">
		<section>
			<form name="a" action="select_house" id="select_house" method="get">
				<input type="hidden"  id="HOID" name="HOID" value="${login.MID}">
				<input type="hidden" id="res" name="res" value="res">
				<div class="sch">
					<div class="sch_ttl">당신이 찾던 바로 그 숙소 !   지금 예약하세요 .</div>
					<br>
					<div class="inp" >
						목적지 <br> <input class="sch_input" type="text" name="CITYNAME"
							placeholder="지역 입력 ex) 서울, 경기, 인천" required="required">
					</div>
					<div class="inp">
						여행기간<br> 
						<input class="sch_input2" type="text" id="Date1" placeholder="가는날" required="required"> 
						<input class="sch_input2" type="text" id="Date2" placeholder="오는날" required="required">
					</div>
					<div class="inp">
						게스트 <br> <input class="sch_input" type="text" name="HPPLNUM"	placeholder="숫자 입력" required="required">
					</div>
					<div class="sch_button">
						<button id="BtnDateSearch" onclick="date();">검색</button>
					</div>
				</div>
			</form>
		</section>
	</header>

	<main>
		<section>
			<div class="sec_ttl">전국 여행을 꿈꿔보세요!</div>
			<div class="choo__box">
				<div ><img class="b" src="imgs/junj.jpg" ></div>
				<div ><img class="b" src="imgs/jej.jpg" ></div>
				<div ><img class="b" src="imgs/jh.jpg" ></div>
				<div ><img class="b" src="imgs/gs.jpg" ></div>
				<div class="choo_img5"><img class="b" src="imgs/gj.jpg" ></div>
			</div>
		</section>
		<br><br>
		<section>
			<div class="sec_ttl">깨끗하고 편안한 숙소를 만나보세요!</div>
			<div style="font-size: 20px; font-weight: 500;">퀄리티와 인테리어 디자인이 검증된 숙소 셀렉션</div>
			<div class="ad2"></div>
		</section>
<br><br>
		<section>
			<div class="sec_ttl">한국에 머무르는 다양한 방법</div>
			<div class="home__box">
				<div class="home">
					<div >
					<img class="a" src="imgs/4_5.jpg" >
					</div>
					<div class="home__info">
						<div class="info1">펜션 · 남해군 경남 · 한국</div>
						<div class="info2">하이클래스 남해</div>
						<div class="info3">
							<span class="star">★★★★★</span> 
							<span class="count">185</span> 
							<span class="type">슈퍼호스트</span>
						</div>
					</div>
				</div>

				<div class="home">
					<div >
					<img class="a" src="imgs/inch.jpg" >
					</div>
					<div class="home__info">
						<div class="info1">펜션 · 옹진군 인천 · 한국</div>
						<div class="info2">퀸스비치글램핑펜션</div>
						<div class="info3">
							<span class="star">★★★★★</span> 
							<span class="count">188</span> 
							<span class="type">슈퍼호스트</span>
						</div>
					</div>
				</div>

				<div class="home">
					<div >
					<img class="a" src="imgs/inche.jpg" >
					</div>
					<div class="home__info">
						<div class="info1">호텔 · 연수구 인천 · 한국</div>
						<div class="info2">경원재 앰베서더</div>
						<div class="info3">
							<span class="star">★★★★★</span> 
							<span class="count">367</span> 
							<span class="type">슈퍼호스트</span>
						</div>
					</div>
				</div>

				<div class="home">
					<div >
					<img class="a" src="imgs/seoulmapo.jpg" >
					</div>
					<div class="home__info">
						<div class="info1">게스트하우스 · 마포구 서울 · 한국</div>
						<div class="info2">ZIBRO Y 게스트하우스 </div>
						<div class="info3">
							<span class="star">★★★★★</span> 
							<span class="count">177</span> 
							<span class="type">슈퍼호스트</span>
						</div>
					</div>
				</div>

				<div class="home">
					<div >
					<img class="a" src="imgs/1_5.jpg" >
					</div>
					<div class="home__info">
						<div class="info1">펜션 · 여수시 전남 · 한국</div>
						<div class="info2">진남펜션</div>
						<div class="info3">
							<span class="star">★★★★★</span> 
							<span class="count">459</span> 
							<span class="type">슈퍼호스트</span>
						</div>
					</div>
				</div>

				<div class="home">
					<div >
					<img class="a" src="imgs/po.jpg" >
					</div>
					<div class="home__info">
						<div class="info1">풀빌라 · 포항시 경북 · 한국</div>
						<div class="info2">이스케이프 풀빌라</div>
						<div class="info3">
							<span class="star">★★★★★</span> 
							<span class="count">119</span> 
							<span class="type">슈퍼호스트</span>
						</div>
					</div>
				</div>

				<div class="home">
					<div >
					<img class="a" src="imgs/seoulgj.jpg" >
					</div>
					<div class="home__info">
						<div class="info1">호텔 · 광진구 서울 · 한국</div>
						<div class="info2">비스타 워커힐 서울</div>
						<div class="info3">
							<span class="star">★★★★★</span> 
							<span class="count">559</span> 
							<span class="type">슈퍼호스트</span>
						</div>
					</div>
				</div>

				<div class="home">
					<div class="home__img8">
					<img class="a" src="imgs/sokch.jpg" >
					</div>
					<div class="home__info">
						<div class="info1">빌라 · 속초 경기 · 한국</div>
						<div class="info2">무어든 스튜디오</div>
						<div class="info3">
							<span class="star">★★★★★</span> 
							<span class="count">170</span> 
							<span class="type">슈퍼호스트</span>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- footer-->
	<footer>
		<div class="footer-wrapper">
			<div class="single-footer">
				<h4>소개</h4>
				<br>
				<p style="font-size: 14px;">우리회사는
				<br> 게스트가 호스트와 협의하여 
				<br> 직접 계약을 체결할 수 있도록
				<br> 숙박 공유 플랫폼을 제공합니다.</p>
				<br> <a href=""><i class="fa fa-facebook"></i></a> <a href=""><i
					class="fa fa-instagram"></i></a> <a href=""><i
					class="fa fa-twitter"></i></a> <a href=""><i class="fa fa-linkedin"></i></a>
				<a href=""><i class="fa fa-youtube"></i></a> <br> <br> <br>
				<br>

			</div>
			<div class="single-footer">
				<h4>메뉴</h4>
				<br>
				<ul style="font-size: 14px;">
					<li><a href="#">숙소 호스팅하기</a></li>
					<br>
					<li><a href="#">숙소 조회하기</a></li>
					<br>
					<li><a href="#">로그인</a></li>
					<br>
					<li><a href="#">회원가입</a></li>
				</ul>
			</div>
			<div class="single-footer">
				<h4>연락처</h4>
				<br>
				<ul style="font-size: 14px;">
					<li><i class="fa fa-phone"></i> 010-7228-9862</li>
					<br>
					<li><i class="fa fa-envelope-o"></i> jhee086@gmail.com</li>
					<br>
					<br>
					<hr>
					<li style="color: gray;">&copy; ALL RIGHTS RESERVED BY JH</li>
				</ul>
				<br>
			</div>
		</div>
	</footer>
</body>

</html>