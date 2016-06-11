<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="org.json.simple.*"%>

<%	
	String data = (String)request.getAttribute("dataForAndroid");
	out.println(data);
%>