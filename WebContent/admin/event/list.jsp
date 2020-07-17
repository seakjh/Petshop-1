<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/admin.css"/>
<style>
select{
	width:200px;
	height:150px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
	
	$($("button")[0]).click(function(){//등록
		regist();
	});
	
	$($("button")[1]).click(function(){//수정
		edit();
	});
	
	$($("button")[2]).click(function(){//삭제
		del();
	});
	
	$($("button")[3]).click(function(){//삭제
		getList();
	});	
});

//jquery가ajax 도 지원한다!!
//기존의 순수 자바스크립트를 이용하는 것보다 코드량이 현저히 줄어든다
function regist(){
	$.ajax({
		"url":"/admin/event/regist",
		"type":"post",
		"data":{
			title:$("input[name='title']").val()
		},
		success:function(data){
			alert("서버에서 온 응답 데이터는 "+data);
			//리스트 보여주기!!
			getList();
		}
	});	
}

//비동기로 데이터 가져오기!
function getList(){
	$.ajax({
		"url":"/admin/event/selectall",
		"type":"get",
		success:function(result){
			console.log(result);	
			
			var json=JSON.parse(result);
			
			$("select").empty(); //비우기!
			
			for(var i=0;i<json.eventList.length;i++){
				var obj=json.eventList[i];
				$("select").append("<option value='"+obj.event_id+"'>"+obj.title+"</option>");
			}
		}
	});	
}

//비동기로 삭제하기!!
function del(){
	if(confirm($("select").val()+"를 삭제하실래요?")){
		$.ajax({
			"url":"/category/del?category_id="+$("select").val(),
			"type":"get",
			success:function(result){
				if(result==1){
					alert("삭제되었습니다.");
					getList();
				} else{
					alert("삭제에 실패하였습니다.\n관리자에 문의하세요");
				}
			}
		});	
	}
	
}
</script>
</head>
<body bgcolor="yellow">
<%@include file="/admin/inc/main_navi.jsp"%>
<div>
	<input type="text" name="title" placeholder="이벤트명 등록 "/>
	<button>등록</button>
	
	<p>
		<select name="event_id" multiple="multiple"></select>
	<p/>
	<button>수정</button>
	<button>삭제</button>
	<button>목록</button>
</div>
</body>
</html>




