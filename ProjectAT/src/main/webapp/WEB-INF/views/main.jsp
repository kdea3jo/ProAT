<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 100%;
      margin: 0;
  }
  #myCarousel {
  	width: 1328px;
  	margin: 0px auto;
  }
</style>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
	</ol>

	<!-- Wrapper for slides -->
	<div class="carousel-inner" role="listbox">
		<div class="item active">
			<img src='<c:url value="/resources/images/slider/slider1.jpg"/>' alt="slide1">
		</div>

		<div class="item">
			<img src='<c:url value="/resources/images/slider/slider2.jpg"/>' alt="slide2">
		</div>
	</div>

	<!-- Left and right controls -->
	<a class="left carousel-control" href="#myCarousel" role="button"
		data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
		aria-hidden="true"></span> <span class="sr-only">Previous</span>
	</a> <a class="right carousel-control" href="#myCarousel" role="button"
		data-slide="next"> <span class="glyphicon glyphicon-chevron-right"
		aria-hidden="true"></span> <span class="sr-only">Next</span>
	</a>
</div>
<style>
	#boardListArea {width:70%; margin: 0px auto;}
	#boardListArea > div > table th {background-color: #eee;}
	#boardListArea > div {width:40%;display: inline-block; margin: 20px 50px;}
	#boardListArea > div > table { margin: 0px auto;}
	#boardListArea > div > table th, td { font-size: 12px;}
	#boardListArea > div > div {text-align: right;}
	#boardListArea > div > h4 {text-align: center;}
</style>
<div id="boardListArea" >
	<div id="noticeList">
	<h4>공지사항</h4>	
	<div><a href="board/notice/list" >공지사항 더보기</a></div>
		<table class="table table-hover table-condensed">
			<thead>
				<tr><th class="num col-xs-1 text-center">NO</th><th class="title col-xs-4 text-center">제목</th><th class="wDate col-xs-2 text-center">날짜</th></tr>
			</thead>
			<tbody>
			<c:forEach var="items" items="${requestScope.noticeList}" varStatus="status">
				<tr>
					<td class="num col-xs-1 text-center">${items.num}</td>
					<td class="title col-xs-4"><a
					href="board/notice/read?num=${items.num}">${items.title}</a></td>
					<td class="wDate col-xs-2 text-center">${items.wDate}</td>
				</tr>			
			</c:forEach>
			</tbody>
		</table>
	</div>
	<div id="qnaList">
	<h4>Q&A</h4>	
	<div><a href="board/qna/list" >Q&A 더보기</a></div>
		<table class="table table-hover table-condensed">
			<thead>
				<tr><th class="num col-xs-1 text-center">NO</th><th class="title col-xs-4 text-center">제목</th><th class="wDate col-xs-2 text-center">날짜</th></tr>
			</thead>
			<tbody>
			<c:forEach var="items" items="${requestScope.qnaList}" varStatus="status">
				<tr>
					<td class="num col-xs-1 text-center">${items.num}</td>
					<td class="title col-xs-4"><a
					href="board/qna/read?num=${items.num}">${items.title}</a></td>
					<td class="wDate col-xs-2 text-center">${items.wDate}</td>
				</tr>			
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>