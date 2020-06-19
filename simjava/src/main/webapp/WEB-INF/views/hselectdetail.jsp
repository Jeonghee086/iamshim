<%@page import="simcom.House"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/uphinsert.css">
<link rel="stylesheet" href="css/footer.css">

<!-- ex) 날짜  -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- datepicker 한국어로 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>

</head>
<style>
.na2 {
	background-color: rgba(222, 184, 135, 0.5);
	padding: 3px 3px;
}

img {
	padding: 5px;
	border-radius: 8px;
}

table {
	width: 100%
}

td button {
	background-color: burlywood;
	padding: 10px 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	text-align: right;
	color: white;
}

td button:hover {
	background-color: rgba(165, 42, 42, 0.705);
}

.d {
	text-align: right;
}
</style>
<header class="parallax"> </header>
<body>
	<div class="na2"></div>
	<!--컨텐츠-->
	<main>
		<form action="start_rsv" id="start_rsv" method="POST">
			<c:forEach items="${hss}" var="hss">
				<input type="hidden" id="SHCODE" name="SHCODE" value="${hss.SHCODE}">
				<input type="hidden" id="MID" name="MID" value="${login.MID}">
				<input type="hidden" id="HOID" name="HOID" value="${hss.HOID}">
				<input type="hidden" id="HPPLNUM" name="HPPLNUM" value="${HPPLNUM}">
				<table>
					<tr>
						<td><h3 style="font-size: 30px;">${hss.HNAME}</h3></td>
					</tr>
					<tr>
						<td>
							<h3 style="font-size: 22px;">${hss.CITYNAME} ${hss.ANAME}</h3>
						</td>
					</tr>
				</table>
				<br>
				<img src="img/${hss.HPICNAME}"
					style="width: 50%; height: 400; float: left;">
				<img src="imgs/hd1.jpg"
					style="width: 25%; height: 200; float: left;">
				<img src="imgs/hd2.jpg" style="width: 25%; height: 200;">
				<img src="imgs/hd4.jpg"
					style="width: 25%; height: 200; float: left;">
				<img src="imgs/hd3.jpg" style="width: 25%; height: 200;">
				<br>
				<br>
				<br>
				<h5 style="font-size: 26px;">"${hss.HOID}(${hss.HONAME})"님이
					호스팅하는 ${hss.TNAME}전체</h5>
				<br>
				<h5 style="font-size: 18px;">인원${hss.HPPLNUM}명 ·
					침실${hss.HBEDRMNUM}개 · 침대${hss.HBEDNUM}개 · 욕실${hss.HBATHRMNUM}개</h5>
				<br>
				<hr>
				<br>
				<h5 style="font-size: 22px;">"${MID}"님은 ${hss.RNAME}를 사용하실 수
					있습니다.</h5>
				<br>
				<h5 style="font-size: 18px;">훌륭한 숙소 위치</h5>
				<h5 style="font-size: 16px;">최근 숙박한 게스트 중 95%가 위치에 별점 5점을 준
					숙소입니다.</h5>
				<br>
				<h5 style="font-size: 18px;">환불 정책</h5>
				<h5 style="font-size: 16px;">체크인 30일 전까지 취소하시면 전액이 환불됩니다.</h5>
				<br>
				<hr>
				<br>
				<h5 style="font-size: 22px;">숙소 매뉴얼</h5>
				<br>
				<h5 style="font-size: 18px;">${hss.HMANUAL}</h5>
				<br>
				<hr>
				<br>
				<h5 style="font-size: 22px;">편의시설</h5>
				<br>
				<h5 style="font-size: 18px;">${hss.CVNAME}</h5>
				<br>
				<h5 style="font-size: 18px;">욕실공용여부 : ${hss.HBSNAME}</h5>
				<br>
				<hr>
				<br>
				<br>
				<h5 style="font-size: 22px;">숙박일자 선택</h5>
				<br>
				<input class="sch_input2" type="text" id="Date1" placeholder="가는날"
					required="required" style="width: 20%;" name="RCHECKIN">
				<input class="sch_input2" type="text" id="Date2" placeholder="오는날"
					required="required" style="width: 20%;" name="RCHECKOUT">
				<button id="BtnDateSearch" type="button" onclick="date();">요금조회</button>

<script>
<c:choose>
		<c:when test="${!empty rdate}">
		<c:forEach items="${rdate}" var="rdate">
		$(function () {
		    $("#Date1").datepicker({
		      minDate: new Date(),
		      beforeShowDay: nationalDays,
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
		      beforeShowDay: nationalDays,
		      onClose: function (selectedDate) {  // 날짜를 설정 후 달력이 닫힐 때 실행
		        if (selectedDate != "") {   
		          $("#Date1").datepicker("option", "maxDate", selectedDate);
		        }
		      }
		    });
		  });
		  function date() {
		    if (!$("#Date1").val()) {
		      alert("가는날을 선택하세요");
		      return false;
		    }
		    if (!$("#Date2").val()) {
		      alert("오는날을 선택하세요");
		      return false;
		    }
		    var date1 = new Date($("#Date1").datepicker("getDate"));
		    var date2 = new Date($("#Date2").datepicker("getDate"));
		    var c = date2.getTime() - date1.getTime();
		    var result = c / (1000 * 60 * 60 * 24);
		    document.getElementById("ress").value = result*${hss.HPRICE};
		    document.getElementById("res").value = result;
		  }

		  
		  var disabledDays = 
			  getDates("<fmt:formatDate value="${rdate.RCHECKIN}" pattern="YYYY-M-dd" />", 
					  "<fmt:formatDate value="${rdate.RCHECKOUT}" pattern="YYYY-M-dd" />") ;
	  
		  function nationalDays(date) {
			    var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
			    for (i = 0; i < disabledDays.length; i++) {
			      if ($.inArray(y + '-' + (m + 1) + '-' + d, disabledDays) != -1
			        || new Date() > date) {
			        console.log(y + '-' + (m + 1) + '-' + d, disabledDays);
			        return [false];
			      }
			    }
			    console.log(y + '-' + (m + 1) + '-' + d, disabledDays);
			    return [true];
			  }
			  
			  function parseDate(input) {
			    var parts = input.split('-');
			    return new Date(parts[0], parts[1] - 1, parts[2]);
			  }
			  function getDates(startDate, endDate) {
			    var dates = [];
			    var currentDate = parseDate(startDate);
			    endDate = parseDate(endDate);
			    while (currentDate <= endDate) {
			      var final = currentDate.getFullYear() + '-' + (currentDate.getMonth() + 1)
			       + '-' + currentDate.getDate();
	          dates.push(final);
			      currentDate.setDate(currentDate.getDate() + 1);
			    } 
			    return dates;
			  }
		  </c:forEach>
		  </c:when>
		  <c:otherwise>
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
				      alert("가는날을 선택하세요");
				      return false;
				    }
				    if (!$("#Date2").val()) {
				      alert("오는날을 선택하세요");
				      return false;
				    }
				    var date1 = new Date($("#Date1").datepicker("getDate"));
				    var date2 = new Date($("#Date2").datepicker("getDate"));
				    var c = date2.getTime() - date1.getTime();
				    var result = c / (1000 * 60 * 60 * 24);
				    
				    document.getElementById("ress").value = result*${hss.HPRICE};
				    document.getElementById("res").value = result;
				  }
		  </c:otherwise>
</c:choose>
</script>
				<br>
				<br>
				<h5 style="font-size: 22px;">요금</h5>
				<br>
				<h5 style="font-size: 18px;">
					<fmt:formatNumber value="${hss.HPRICE}" type="currency" />
					/1박
				</h5>
				<br>
				<h5 style="font-size: 20px;">
					총 요금 : <input type="text" id="ress" name="RPRICE" value=""
						required="required" placeholder="요금조회를 클릭하세요"
						style="width: 20%; text-align: right;">원 <input
						type="hidden" id="res" name="res" value="res">
				</h5>
				<br>
				<hr>
				<br>
				<table>
					<tr>
						<td>
							<h3 style="font-size: 22px;">주소</h3>
						</td>
						<td class="d" colspan="2" style="text-align: right;">
							<button>숙소예약요청</button>
						</td>
					</tr>
				</table>
				<br>
				<h5 style="font-size: 18px;">${hss.CITYNAME}${hss.ANAME}
					${hss.HADETAIL} (${hss.HAZIPCODE})</h5>
				<br>
				<div id="map" style="width: 100%; height: 450px;"></div>

				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3d0e376145cc063811cd7d8082a4e506&libraries=services"></script>
				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						level : 3
					// 지도의 확대 레벨
					};
					// 지도를 생성합니다    
					var map = new kakao.maps.Map(mapContainer, mapOption);
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();
					// 주소로 좌표를 검색합니다
					geocoder
							.addressSearch(
									'${hss.CITYNAME} ${hss.ANAME} ${hss.HADETAIL}',
									function(result, status) {
										// 정상적으로 검색이 완료됐으면 
										if (status === kakao.maps.services.Status.OK) {

											var coords = new kakao.maps.LatLng(
													result[0].y, result[0].x);
											// 결과값으로 받은 위치를 마커로 표시합니다
											var marker = new kakao.maps.Marker(
													{
														map : map,
														position : coords
													});
											// 인포윈도우로 장소에 대한 설명을 표시합니다
											var infowindow = new kakao.maps.InfoWindow(
													{
														content : '<div style="width:150px;text-align:center;padding:6px 0;">${hss.CITYNAME} ${hss.ANAME} ${hss.HADETAIL}</div>'
													});
											infowindow.open(map, marker);
											// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
											map.setCenter(coords);
										}
									});
				</script>
				<br>
				<br>
				<hr>
				<h5 style="font-size: 22px;">호스트 소개</h5>
				<br>
				<h5 style="font-size: 18px;">호스트 ${hss.HOID}(${hss.HONAME})님</h5>
				<h5 style="font-size: 18px;">호스트 이메일 : ${hss.HOEMAIL}</h5>
				<br>
				<hr>
			</c:forEach>
		</form>
	</main>

</body>


<!-- footer-->
<footer>
	<div class="footer-wrapper">
		<div class="single-footer">
			<h4>소개</h4>
			<br>
			<p style="font-size: 14px;">
				우리회사는 <br> 게스트가 호스트와 협의하여 <br> 직접 계약을 체결할 수 있도록 <br>
				숙박 공유 플랫폼을 제공합니다.
			</p>
			<br> <a href=""><i class="fa fa-facebook"></i></a> <a href=""><i
				class="fa fa-instagram"></i></a> <a href=""><i class="fa fa-twitter"></i></a>
			<a href=""><i class="fa fa-linkedin"></i></a> <a href=""><i
				class="fa fa-youtube"></i></a> <br> <br> <br> <br>

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