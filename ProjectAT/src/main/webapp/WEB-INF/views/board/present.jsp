<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src='<c:url value="/resources/fullcalendar/lang/ko.js"></c:url>'></script>
<script src='<c:url value="/resources/fullcalendar/lib/moment.min.js"></c:url>'></script>
<script src='<c:url value="/resources/fullcalendar/fullcalendar.min.js"></c:url>'></script>
<script src='<c:url value="/resources/fullcalendar/lang/ko.js"></c:url>'></script>
<script>

	$(function() {
		var currDate = $('#calendar').fullCalendar('getDate');
		$('#calendar').fullCalendar({
			lang: 'ko',	// 언어 선택
			header: {left:"title", right:"today prev,next"},
			defaultDate: currDate, 	// 기본 선택 날짜
			eventLimit: true,
			businessHours: true,
			eventClick: function(calEvent, jsEvent, view) {
		        var cdate = calEvent.id;
				var checkDay = new Date(cdate);
			    if (checkDay.getDay() == 6 || checkDay.getDay() == 0) {
			    	bootbox.alert("주말은 출석일이 아닙니다.", function() {});
			    }
			    else{
					$.ajax({
		                type:"post",
		                url:"../attendance/selectDay",
		                data: {date:cdate},
		                dataType:"json",
		                success:function(obj){
		                	var userin = obj.userin;
		                	var userout = obj.userout;
		                	bootbox.dialog({
		                        title: cdate+" 출결 정보",
		                        message: "<div style=\"text-align:center;\"><strong>입실시간</strong><p>"+userin+"</p>"+
		                        "<strong>퇴실시간</strong><p>"+userout+"</p>"+
		                        "</div>" ,
		                        buttons: {
		                            success: {
		                                label: "확인",
		                                className: "btn-success",
		                            }
		                        }
		                    }
		                );
		                },
		                error:function(xhr,status,error){
		                    console.log('실패: '+error);
		                },
		                complete:function(data){
		                    
		                }
		                
		            }); 
				}

		    },
		    events: [
		             <c:forEach var="items" items="${requestScope.attList}" varStatus="status">
		                {
		                   id : '${items.adate}',
		                   start: '${items.adate}'
		                   <c:choose>
		                      <c:when test="${items.statue=='공결'}">, title:'${items.statue}★'</c:when>
		                      <c:otherwise>,title: '${items.statue}' </c:otherwise>
		                   </c:choose>
		                   <c:choose>
		                      <c:when test="${items.statue=='결석'}">,color : '#FB5175'</c:when>
		                      <c:when test="${items.statue=='지각'||items.statue=='조퇴'||items.statue=='외출'}">,color : '#dddddd'</c:when>
		                      <c:otherwise>,color : '#337AB7' </c:otherwise>
		                   </c:choose>
		                },
		             </c:forEach>
		             ]
        });
		var totalDate = ${requestScope.subjectInfo.totalDate};
		var attendDate = ${requestScope.attendDate};
		var absenceDate = ${requestScope.absenceDate};
		graph(attendDate,absenceDate,totalDate); // 출석일수, 결석일수, 총일수
		
	});
	
	function graph(g1,g2,g3){
		var arry =  [(parseInt(g1/g3*10000))/100, (parseInt(g2/g3*10000))/100, (parseInt((g3-(g1+g2))/g3*10000))/100];
		//parseInt
		
		var width = $("#graph").width(); // 전체 가로값 (즉, 100%의 길이)
		//var size = $(".graph").size(); // 막대 그래프 갯수
		
		$(".graph").each(function(i){
			var ttt = width * (arry[i]/100);
			var lineheight = $(this).height();
			$(this).animate({"width": (ttt-1)+"px"},1500);
			//$(this).css("width",ttt);
			$(this).find("em").text(arry[i]+"%").css("line-height", lineheight + "px"); 
		})
	}

</script>

<style>
	/* body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	} */
	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}

	#graph {width: 100%;height:100px;margin: 0px auto;border-bottom: gray 1px solid;}
	#graph > p {position:relative;display:inline-block;float:left;font-weight:bold;color:#fff;font-size:15px;text-align: center;margin-top: 10px}
	#graph > p strong {position:absolute;bottom:-20px;display:block;width:100%;text-align:center;color:#777;}
	#graph > p em {vertical-align:middle;font-size:20px;}
	#graph > p:nth-child(1) {height:30px;background:#337AB7;}
	#graph > p:nth-child(2) {height:30px;background:#FB5175;}
	#graph > p:nth-child(3) {height:30px;background:#dddddd;}
	#graph > div {font-size: 20px;}
	
	.calendar {width: 100%;}
	#content {width: 60%; margin: 0px auto;}
	#line {border-bottom: gray 1px solid;padding-bottom: 5px;} 
	th{background-color: #eee;text-align: center;font-size: 17px}
	.fc-widget-header {background-color: #fff;}
</style>
<img width="100%" src="<c:url value="/resources/images/image/att.png"/>" alt="출결현황 대표">
<div class="table-responsive">
	<h4>수강 정보</h4>
	<table class="table table-bordered" style="font-size: 15px">
		<tr>
			<th id="training_organ">수강 기관명</th><td headers="training_organ">한국디지털기업협회</td>
			<th id="training_term">수강 기간</th><td headers="training_term"><fmt:formatDate value='${requestScope.subjectInfo.startdate}' pattern='yyyy-MM-dd'/>~<fmt:formatDate value='${requestScope.subjectInfo.enddate}' pattern='yyyy-MM-dd'/></td>
		</tr>
		<tr>
			<th id="training_title">수강 과정명</th><td headers="training_title">${requestScope.subjectInfo.classname}</td>
			<th id="attendance_term">출석 기간</th><td headers="attendance_term"><fmt:formatDate value='${requestScope.subjectInfo.startdate}' pattern='yyyy-MM-dd'/>~<fmt:formatDate value='${requestScope.subjectInfo.enddate}' pattern='yyyy-MM-dd'/></td>
		</tr>
	</table>
</div>	
<div id="line"></div>
<h4>출결 현황</h4>
<div id="today">
	<table class="table table-bordered text-center" style="width:80%;margin: 0px auto">
		<thead>
		<tr><th colspan="2">오늘의 출결 현황</th></tr>
		<tr><th>입실</th><th>퇴실</th></tr></thead>
		<tbody><tr><td>${requestScope.todayuserin}</td><td>${requestScope.todayuserout}</td></tr>
				<tr><td colspan="2"><strong>${requestScope.subjectInfo.totalDate}</strong>일 중 <strong>${requestScope.attendDate}</strong>일 출석, <strong>${requestScope.absenceDate}</strong>일 결석</td></tr>
		</tbody>
	</table>
</div>
<br>
<div id="graph" >
	<p class="graph01 graph"><em></em><strong>출석</strong></p>
	<p class="graph02 graph"><em></em><strong>결석</strong></p>
	<p class="graph03 graph"><em></em><strong></strong></p>
</div>
	
<h4>출결 현황 달력</h4><br>
<div id='calendar' ><p>날짜를 클릭하면 해당 날짜의 입,퇴실 시간을 알 수 있습니다.</p></div>
