<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
.form-signin {
	max-width: 350px;
	padding: 19px 29px 29px;
	margin: 0 auto 20px;
	background-color: #fff;
	border: 1px solid #e5e5e5;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	text-align: center;
}

.form-signin .form-signin-heading{
	margin-bottom: 10px;
	text-align: center;
}

input{
	width: 300px;
}

.form-signin input[type="text"], .form-signin input[type="password"] {
	font-size: 12px;
	height: auto;
	margin-bottom: 15px;
	padding: 7px 9px;
}

#err{
	color: #DF4D4D;
	text-align: center;
}

</style>

<div class="container">
	<form class="form-signin" action="<c:url value='/check'/>" method="post">
		<h3 class="form-signin-heading">크기가 전부는 아니잖아요.</h3>
		<input type="text" class="input-block-level" name="id" placeholder="이메일을 입력하세요.">
		<input type="password" class="input-block-level" name="pw" placeholder="비밀번호를 입력하세요.">
		<h6><a href="help" class="text-primary">로그인에 어려움이 있으신가요?</a></h6><br><br>
		<button class="btn btn-block btn-success" type="submit" >로그인</button>
		<h6><a href="joinform" class="text-primary">아직 회원이 아니시라면 지금 가입하세요.</a></h6>
	</form>
	<c:if test="${param.error==true }">
    	<p id="err"><strong>사용자 계정이 잘못되었습니다.</strong></p>
	</c:if>
</div>

