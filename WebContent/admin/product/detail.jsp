<%@page import="com.pet.domain.Product"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Product product = (Product)request.getAttribute("product");
%>
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
var category_id=<%=product.getCategory().getCategory_id()%>;

$(function(){
	getList();//카테고리 목록 가져오기!	
	
	//수정
	$($("button")[0]).click(function(){
		edit();
	});
	
	//삭제
	$($("button")[1]).click(function(){
		del();
	});
	
	//목록
	$($("button")[2]).click(function(){
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
				//전역변수로 선언된 카테고리의 id와  obj의  id가 같은 경우
				//selected 처리..
				if(obj.category_id==category_id){
					$("select").append("<option selected value='"+obj.category_id+"'>"+obj.category_name+"</option>");
				}else{
					$("select").append("<option value='"+obj.category_id+"'>"+obj.category_name+"</option>");
				}
			}
		}
	});	
}

function edit(){
	$("form").attr({
		"action":"/admin/product/edit",
		"enctype":"multipart/form-data",
		"method":"post"
	});
	$("form").submit();
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

//삭제 요청 product_id를 전송해야 한다!!
function del(){
	if(confirm("삭제하시겠습니까?")){
		$("form").attr({
			"action":"/admin/product/delete",
			"method":"post"
		});
		$("form").submit();
	}
}
</script>
</head>
<body>
<%@include file="/admin/inc/main_navi.jsp"%>

<div class="container">
  <form>
  	<input type="hidden" name="product_id" value="<%=product.getProduct_id()%>"/>
  	<input type="hidden" name="filename" value="<%=product.getFilename()%>"/>
  	
  	<select name="category.category_id">
  		<option value="0">카테고리 선택</option>
  	</select>
    <input type="text" name="product_name" value="<%=product.getProduct_name()%>">
    <input type="text" name="price" value="<%=product.getPrice()%>">
    <input type="text" name="brand" value="<%=product.getBrand()%>">
    <img src="/data/<%=product.getFilename()%>" width="200px"/>
    <input type="file" 	name="myFile" value="상품명">
    <p>
  </form>
   <button>상품수정</button>
   <button>상품삭제</button>
   <button>상품목록</button>
</div>

</body>
</html>






