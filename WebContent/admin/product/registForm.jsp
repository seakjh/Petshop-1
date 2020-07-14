<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록 폼</title>
<link rel="stylesheet" href="/css/admin.css"/>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type=button] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=button]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
	getList();//카테고리 목록 가져오기!	
	
	//등록
	$($("button")[0]).click(function(){
		regist();
	});
	
	//목록
	$($("button")[1]).click(function(){
		location.href="/admin/product/list";
	});
	
	
});

function getList(){
	$.ajax({
		"url":"/category/list",
		"type":"get",
		success:function(result){
			var json=JSON.parse(result);
			
			$("select").empty(); //비우기!

			$("select").append("<option value='0'>카테고리 선택</option>");
			for(var i=0;i<json.categoryList.length;i++){
				var obj=json.categoryList[i];
				$("select").append("<option value='"+obj.category_id+"'>"+obj.category_name+"</option>");
			}
		}
	});	
}

//파일 업로드 요청!! (동기방식)
function regist(){
	alert();
	$("form").attr({
		"action":"/admin/product/regist",
		"enctype":"multipart/form-data",
		"method":"post"
	});
	$("form").submit();
}
</script>
</head>
<body>
<%@include file="/admin/inc/main_navi.jsp"%>

<div class="container">
  <form>
  	<select name="category.category_id">
  		<option value="0">카테고리 선택</option>
  	</select>
    <input type="text" name="product_name" placeholder="상품명">
    <input type="text" name="price" placeholder="가격(숫자로 입력)">
    <input type="text" name="brand" placeholder="브랜드">
    <input type="file" 	name="myFile" placeholder="상품명">
    <p>
    <button>상품등록</button>
    <button>상품목록</button>
  </form>
</div>

</body>
</html>






