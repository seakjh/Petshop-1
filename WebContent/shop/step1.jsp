<%@page import="com.pet.model.product.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.pet.model.product.Product"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<Cart> cartList=(List)session.getAttribute("cartList");
%>
<!DOCTYPE html>
<html>
<head>
<title>Pet Shop</title>
<meta charset="utf-8">
<link href="/css/style.css" rel="stylesheet" type="text/css">
<style>

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
.pic{
	width:50%;
	height:250px;
	background:yellow;
	float:left;
	margin-top:50px;
}
.spec{
	width:50%;
	height:250px;
	background:green;
	float:left;
	margin-top:50px;
}
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
  margin-top:50px;
}

th, td {
  text-align: left;
  padding: 16px;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}
#buyer, #receiver{
	width:48%;
	border:2px solid red;
	display:inline-block;
}
</style>
</head>
<body>
	<%@ include file="/include/main_navi.jsp" %>
<div id="body">
  <div id="content">
		<!-- 장바구니 표 -->
		<h2>결제하기</h2>
		
		<table width="100%">
		  <tr>
		    <th>이미지</th>
		    <th>카테고리</th>
		    <th>상품명</th>
		    <th>브랜드</th>
		    <th>가격</th>
		    <th>수량</th>
		  </tr>
		  <%int totalBuy=0; %>
		<%for(int i=0;i<cartList.size();i++){%>
		<%Cart cart = cartList.get(i); %>
		<%totalBuy+=(cart.getPrice()*cart.getEa()); %>		  
		  <tr>
		    <td><img src="/data/<%=cart.getFilename() %>" width="45px"/></td>
		    <td><%=cart.getCategory().getCategory_name() %></td>
		    <td><%=cart.getProduct_name() %></td>
		    <td><%=cart.getBrand() %></td>
		    <td><%=cart.getPrice() %></td>
		    <td><%=cart.getEa() %> 개</td>
		  </tr>
		  <%}%>
		  <tr>
		  	<td colspan="6" style="text-align:right">구매 총액 : <%=totalBuy %>원</td>
		  </tr>
		</table>		
		
		
	  <form action="/action_page.php">
	  	
	  	<div id="buyer">
		    <input type="text" id="fname" name="firstname" placeholder="주문자명">
		    <input type="text" id="lname" name="lastname" placeholder="주문자 연락처">
		    <input type="text" id="lname" name="lastname" placeholder="이메일">
		    <select id="country" name="country">
		      <option value="0">결제방법</option>
		      <option value="card">신용카드</option>
		      <option value="online">온라인 입금</option>
		      <option value="phone">핸드폰 결제</option>
		    </select>
	    </div>
	    <div id="receiver">
	    	<input type="checkbox" />주문자 정보와 동일
		    <input type="text" id="fname" name="firstname" placeholder="받는분 이름">
		    <input type="text" id="lname" name="lastname" placeholder="받는 분 연락처">
		    <input type="text" id="lname" name="lastname" placeholder="받는 분 주소">
	    </div>
	  </form>
	  
	  <input type="button" value="결제하기"/>
	  <input type="button" value="쇼핑계속"/>
	  
  </div>
  <div class="featured">
    <ul>
      <li><a href="#"><img src="/images/organic-and-chemical-free.jpg" width="300" height="90" alt=""></a></li>
      <li><a href="#"><img src="/images/good-food.jpg" width="300" height="90" alt=""></a></li>
      <li class="last"><a href="#"><img src="/images/pet-grooming.jpg" width="300" height="90" alt=""></a></li>
    </ul>
  </div>
</div>
  <%@ include file="/include/footer.jsp" %>
</body>
</html>




