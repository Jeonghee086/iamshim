$(function() {
	$("#Date1").datepicker({
		minDate : new Date(),

		onClose : function(selectedDate) {
			// 시작일(fromDate) datepicker가 닫힐때
			// 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
			if (selectedDate != "") {
				var curDate = $("#Date1").datepicker("getDate"); // Date
				curDate.setDate(curDate.getDate() + 1);
				$("#Date2").datepicker("option", "minDate", curDate);
			}
		}
	});

	$("#Date2").datepicker({

		onClose : function(selectedDate) { // 날짜를 설정 후 달력이 닫힐 때 실행
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
