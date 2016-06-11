<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
function formcheck() {
	$.ajax({
		type : "post",
		url : "searchpw",
		data : {'id':$('input[name=id]').val()},
		dataType : "json",
		success : function(obj) {
			if(!obj){
				$('#result_box').text('입력 정보가 잘못되었습니다.');
			}else{
				$('#result_box').text('E-Mail이 전송되었습니다.');
			}
		},
		complete : function(data) {
		},
		error : function(xhr, status, error) {
		}
	});
}

</script>
    
<form>
	<input type="text" name="id" placeholder="이메일(아이디)을 입력하세요."/>
	<button type="button" onclick="formcheck()">검색</button>
</form>
<div id="result_box">

</div>