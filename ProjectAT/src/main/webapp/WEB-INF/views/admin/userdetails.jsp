<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
			lang: 'ko',	// ��� ����
			header: {left:"title", right:"today prev,next"},
			defaultDate: currDate, 	// �⺻ ���� ��¥
			eventLimit: true,
			dayClick: function(date, jsEvent, view) {	// ��¥ Ŭ��
				
		        alert('Clicked on: ' + date.format());
				
		    },	     
			events: [
			<c:forEach var="items" items="${requestScope.attList}" varStatus="status">
				{
					title: '${items.statue}',
					start: '${items.adate}'
					<c:choose>
						<c:when test="${items.statue=='�Ἦ'}">,color : '#FB5175'</c:when>
						<c:when test="${items.statue=='����'||items.statue=='����'||items.statue=='����'}">,color : '#dddddd'</c:when>
						<c:otherwise>,color : '#337AB7' </c:otherwise>
					</c:choose>
				},
			</c:forEach>
			]   
		});
		var totalDate = ${requestScope.subjectInfo.totalDate};
		var attendDate = ${requestScope.attendDate};
		var absenceDate = ${requestScope.absenceDate};
		graph(attendDate,absenceDate,totalDate); // �⼮�ϼ�, �Ἦ�ϼ�, ���ϼ�
		
	});
	
	function graph(g1,g2,g3){
		var arry =  [(parseInt(g1/g3*10000))/100, (parseInt(g2/g3*10000))/100, (parseInt((g3-(g1+g2))/g3*10000))/100];
		//parseInt
		
		var width = $("#graph").width(); // ��ü ���ΰ� (��, 100%�� ����)
		//var size = $(".graph").size(); // ���� �׷��� ����
		
		$(".graph").each(function(i){
			var ttt = width * (arry[i]/100);
			var lineheight = $(this).height();
			$(this).animate({"width": ttt+"px"},1500);
			//$(this).css("width",ttt);
			$(this).find("em").text(arry[i]+"%").css("line-height", lineheight + "px"); 
		})
	}
</script>

<style>

	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}

</style>

<style>
	#graph {width: 100%;height:100px;margin: 0px auto;border-bottom: gray 1px solid;}
	#graph > p {position:relative;display:inline-block;float:left;font-weight:bold;color:#fff;font-size:15px;text-align: center;margin-top: 10px}
	#graph > p strong {position:absolute;bottom:-20px;display:block;width:100%;text-align:center;color:#777;}
	#graph > p em {vertical-align:middle;font-size:20px;}
	#graph > p:nth-child(2) {height:30px;background:#337AB7;}
	#graph > p:nth-child(3) {height:30px;background:#FB5175;}
	#graph > p:nth-child(4) {height:30px;background:#dddddd;}
	#graph > div {font-size: 20px;}
	
	.calendar {width: 100%;}
	
	#content {width: 52%; margin: 0px auto;}
	#line {border-bottom: gray 1px solid;padding-bottom: 5px;} 
	th{background-color: #eee;}
	
	
</style>

<div class="table-responsive">
	<h4>�л� ����</h4>
	<table class="table table-bordered" style="font-size: 15px">
		<tr>
			<th id="training_organ">�̸�</th><td headers="training_organ">${memberVo.username}</</td>
			<th id="training_term">�������</th><td headers="training_term"><fmt:formatDate value='${memberVo.birthday}' pattern='yyyy-MM-dd'/></td>
		</tr>
		<tr>
			<th id="training_title">����ó</th><td headers="training_title">${memberVo.phone}</td>
			<th id="attendance_term">�̸���</th><td headers="attendance_term">${memberVo.userid}</td>
		</tr>
	</table>
</div>	
<div id="line"></div>
<div class="table-responsive">
	<h4>���� ����</h4>
	<table class="table table-bordered" style="font-size: 15px">
		<tr>
			<th id="training_organ">���¸�</th><td headers="training_organ">${requestScope.subjectInfo.classname}</</td>
			<th id="training_term">���� �Ⱓ</th><td headers="training_term"><fmt:formatDate value='${requestScope.subjectInfo.startdate}' pattern='yyyy-MM-dd'/>~<fmt:formatDate value='${requestScope.subjectInfo.enddate}' pattern='yyyy-MM-dd'/></td>
		</tr>
		<tr>
			<th id="training_title">�ο�</th><td headers="training_title">${requestScope.subjectInfo.total}</td>
			<th id="attendance_term">� �ð�</th><td headers="attendance_term">${requestScope.subjectInfo.starttime}~${requestScope.subjectInfo.endtime}</td>
		</tr>
	</table>
</div>	
<div id="line"></div>
<h4>��� ��Ȳ</h4>
<div id="graph" >
	<div>[<strong>${requestScope.subjectInfo.totalDate}</strong>�� �� <strong>${requestScope.attendDate}</strong>�� �⼮, <strong>${requestScope.absenceDate}</strong>�� �Ἦ]</div>
	<p class="graph01 graph"><em></em><strong>�⼮</strong></p>
	<p class="graph02 graph"><em></em><strong>�Ἦ</strong></p>
	<p class="graph03 graph"><em></em><strong></strong></p>
</div>
	
<h4>��� ��Ȳ �޷�</h4><br>
<div id='calendar' ></div>