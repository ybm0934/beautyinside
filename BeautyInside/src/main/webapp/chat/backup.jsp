<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$('#listDiv').on('scroll', function(){
	var top = $("#listDiv").scrollTop();
	var inner = $('#listDiv').innerHeight();
	var height = $("#listDiv")[0].scrollHeight;
	
	
	console.log('top : ' + Math.ceil(top));
	console.log('inner : ' + inner);
	console.log('height : ' + height);
	console.log('/ inner : ' + (top + inner) / inner);
	console.log('isStop : ' + isStop);
	
	if(Math.ceil(top) + inner >= height) {
		console.log('if 실행1');
		isStop = true;
	}else {
		console.log('if 실행2');
		isStop = false;
	}
});

var isStop = true;
setInterval(function() {
	if(isStop == true) {
		chatList();
	}
}, 1000);
</script>