<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
    <meta charset="UTF-8">
    <script src="http://code.jquery.com/jquery-2.2.2.min.js"></script>
    <style type="text/css">
    	* {margin: 0}
		html, body {height: 100%;}
		.wrapper {min-height: 100%;height: auto !important;height: 100%;margin: 0 auto -3em;}
		#header{padding-bottom: 100px;}
		#content{vertical-align: middle}
		.footer, .push {height: 3em;}
		.footer{background-color: #D5D5D5;}
		.tableArea, .writeFormArea{width: 60%;margin: 0px auto;}
    	.btnArea, .currPageTotalPage{margin: 10px auto;text-align: right;}
      	.navArea{margin: 0px auto;text-align: center;}
    </style>
    <link rel="stylesheet" href='<c:url value="/resources/fullcalendar/fullcalendar.css"></c:url>' rel='stylesheet' />
    <link rel="stylesheet" href='<c:url value="/resources/fullcalendar/fullcalendar.min.css"></c:url>' rel='stylesheet' />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
	<link href='https://fonts.googleapis.com/css?family=Roboto:400,500,300,700' rel='stylesheet' type='text/css'>
	<title><tiles:insertAttribute name="title"></tiles:insertAttribute> </title>
	</head>
<body>
	<div class="wrapper">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="content">
			<tiles:insertAttribute name="body" />
			<div id="push"></div>
		</div>
		<div class="push"></div>
	</div>
	<footer class="footer">
		<tiles:insertAttribute name="footer" />
	</footer>
	
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
			integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
			crossorigin="anonymous"></script>
	<script src="<c:url value="/resources/bootstrap/bootbox/bootbox.js"/>"></script>
	<script src="<c:url value="/resources/bootstrap/bootbox/bootbox.min.js"/>"></script>
</body>
</html>