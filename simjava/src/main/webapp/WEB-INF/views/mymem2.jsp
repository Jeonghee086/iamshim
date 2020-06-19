<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>주소로 장소 표시 & 특정날짜 비활성화</title>

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

<!-- 지도 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3d0e376145cc063811cd7d8082a4e506&libraries=services"></script>

<!-- 중복검사 -->
<script  src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>


</head>
<body>

	<input type='text' style="height: 50px;" required="required"
		name="HADETAIL" id="HADETAIL" placeholder="상세주소입력" />
	<input type="button" onclick="chkDupId()" value="호스팅 가능여부"
		style="width: 50%; background-color: beige;">


	<script type="text/javascript">
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
</script>


	<div id="map" style="width: 50%; height: 350px;"></div>
	<br>

	<br>
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
		geocoder.addressSearch(	'서울시 영등포구 국제금융로109',
						function(result, status) {
							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {
								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);
								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});
								// 인포윈도우로 장소에 대한 설명을 표시합니다
								var infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:6px 0;">서울시 영등포구 B동 1205호</div>'
										});
								infowindow.open(map, marker);
								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});
	</script>
	<c:choose>
		<c:when test="${!empty rdate}">
			<c:forEach items="${rdate}" var="rdate">
				<input class="sch_input2" type="text" id="Date1" placeholder="가는날"
					required="required">
				<input class="sch_input2" type="text" id="Date2" placeholder="오는날"
					required="required">
				<button id="BtnDateSearch" onclick="date();">검색</button>
				<div>
					<fmt:formatDate value="${rdate.RCHECKIN}" pattern="YYYY-M-dd" />
				</div>
				<div>
					<fmt:formatDate value="${rdate.RCHECKOUT}" pattern="YYYY-M-dd" />
				</div>
				<script>
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

		    alert(result);
		    document.getElementById("res").value = result;

		  }
		// 반복문으로 돌릴 것
		  var disabledDays = getDates("<fmt:formatDate value="${rdate.RCHECKIN}" pattern="YYYY-M-dd" />", "<fmt:formatDate value="${rdate.RCHECKOUT}" pattern="YYYY-M-dd" />") ;

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
		      var final = currentDate.getFullYear() + '-' + (currentDate.getMonth() + 1) + '-' + currentDate.getDate();
		      dates.push(final);
		      currentDate.setDate(currentDate.getDate() + 1);
		    }
		    return dates;
		  }
	</script>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<input class="sch_input2" type="text" id="Date1" placeholder="가는날"
				required="required">
			<input class="sch_input2" type="text" id="Date2" placeholder="오는날"
				required="required">
			<button id="BtnDateSearch" onclick="date();">검색</button>
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

				    alert(result);
				    document.getElementById("res").value = result;

				  }
		 		 </script>
		</c:otherwise>
	</c:choose>

</body>
</html>