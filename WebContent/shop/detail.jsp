<%@page import="com.pet.domain.Product"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Product product=(Product)request.getAttribute("product");
%>
<!DOCTYPE html>
<html>
<head>
<title>Pet Shop</title>
<meta charset="utf-8">
<link href="/css/style.css" rel="stylesheet" type="text/css">
<style>
.pic{
	width:50%;
	height:250px;
	float:left;
	margin-top:50px;
}
.spec{
	width:50%;
	height:250px;
	float:left;
	margin-top:50px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
	//장바구니 담기 
	$($("button")[0]).click(function(){
		goCart();
	});
	
	//바로 구매하기
	$($("button")[1]).click(function(){
		buy();
	});
	
});

//장바구니에 상품 1개 담기!
function goCart(){
	//장바구니 담기 요청 
	$("form").attr({
		"action":"/shop/cart/regist",
		"method":"post"
	});
	$("form").submit();	
}

function buy(){
	//장바구니 담기 요청 
	$("form").attr({
		"action":"/shop/buy",
		"method":"post"
	});
	$("form").submit();	
}
</script>
</head>
<body>
<div id="header"> 
	<%@ include file="/include/main_navi.jsp" %>
</div>
<div id="body">
  <div id="content">
		<!-- 상세보기 -->
	  <div class="pic">
	  	<img src="/data/<%=product.getFilename()%>" width="50%"/>
	  </div> 
	  <div class="spec">
	  	<form>
	  		<input type="hidden" name="product_id" 					value="<%=product.getProduct_id()%>"/>
	  		<input type="hidden" name="category.category_id" 		value="<%=product.getCategory().getCategory_id()%>"/>
	  		<input type="hidden" name="category.category_name" value="<%=product.getCategory().getCategory_name()%>"/>
	  		<input type="hidden" name="product_name" 				value="<%=product.getProduct_name()%>"/>
	  		<input type="hidden" name="price" 								value="<%=product.getPrice()%>"/>
	  		<input type="hidden" name="brand" 							value="<%=product.getBrand()%>"/>
	  		<input type="hidden" name="filename" 						value="<%=product.getFilename()%>"/>
		  	<ul>
			  	<li>카테고리:<%=product.getCategory().getCategory_name() %></li>
			  	<li>상품명:<%=product.getProduct_name() %></li>
			  	<li>가격:<%=product.getPrice() %></li>
			  	<li>브랜드:<%=product.getBrand() %></li>
		  	</ul>
	  	</form> 
	  	<button onClick="goCart()">장바구니</button>
	  	<button onClick="buy()">바로구매</button>
	  </div> 
  </div>
  <div class="featured">
    <ul>
      <li><a href="#"><img src="/images/organic-and-chemical-free.jpg" width="300" height="90" alt=""></a></li>
      <li><a href="#"><img src="/images/good-food.jpg" width="300" height="90" alt=""></a></li>
      <li class="last"><a href="#"><img src="/images/pet-grooming.jpg" width="300" height="90" alt=""></a></li>
    </ul>
  </div>
</div>
<div id="footer">
  <%@ include file="/include/footer.jsp" %>
</div>
</body>
</html>
