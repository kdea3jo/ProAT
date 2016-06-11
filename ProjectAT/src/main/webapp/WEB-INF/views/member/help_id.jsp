<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">

function formcheck() {

	$.ajax({
		type : "post",
		url : "searchid",
		data : $('form').serialize(),
		dataType : "json",
		success : function(obj) {
			if(obj.userid==null){
				$('#result_box').text('입력 정보가 잘못되었습니다.');
			}else{
				var id=$('</p>').text(obj.userid);
				$('#result_box').append(id);
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
	<input type="text" name="username" placeholder="이름 입력"/>
	<input type="text" name="phone" placeholder="연락처 입력"/>
	<button type="button" onclick="formcheck()">검색</button>
</form>
<div id="result_box">

</div>