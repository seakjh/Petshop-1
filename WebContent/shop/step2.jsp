<%@page import="com.pet.domain.Member"%>
<%@page import="com.pet.domain.OrderSummary"%>
<%@page import="com.pet.domain.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.pet.domain.Product"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<Cart> cartList=(List)session.getAttribute("cartList");

	if(session.getAttribute("cartOne")!=null){
		cartList = (List)session.getAttribute("cartOne");
	}
	
	Member obj=(Member)session.getAttribute("member");
	OrderSummary orderSummary=(OrderSummary)request.getAttribute("orderSummary");
	//out.print(orderSummary.getSame());
%>
<!DOCTYPE html>
<html>
<head>
<title>Pet Shop</title>
<meta charset="utf-8">
<link href="/css/style.css" rel="stylesheet" type="text/css">
<%@ include file="/include/head.jsp" %>
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
#buyer{
	width:95%;
	border:5px solid red;
	display:inline-block;
}

input[type='text']{
	border:0px;
	background:yellow;
}

</style>
<script>
//결제 3단계 요청하기 (결제 완료 짓기!!)
function pay(){
	if(!confirm("입력하신 정보로 결제할까요?")){
		return;
	}
	$("form").attr({
		"action":"/shop/step3", 
		"method":"post"
	});
	$("form").submit();
}
</script>
</head>
<body>
	<%@ include file="/include/main_navi.jsp" %>
<div id="body">
  <div id="content">
		<!-- 장바구니 표 -->
		<h2>결제정보 확인</h2>
		
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
		
		
	  <form>
	  	<div id="buyer">
		    <input type="text" readonly name="cname" value="<%=obj.getName()%>">
		    <input type="text" readonly name="cphone" value="<%=obj.getPhone()%>">
		    <input type="text" readonly name="email" value="<%=obj.getEmail()%>">
		    <input type="text" readonly name="pay_method" value="<%=orderSummary.getPay_method()%>">
		    
		    <input type="text" readonly name="receiver.rname" value="<%=orderSummary.getReceiver().getRname()%>">
		    <input type="text" readonly name="receiver.rphone" value="<%=orderSummary.getReceiver().getRphone()%>">
		    <input type="text" readonly name="receiver.raddr" value="<%=orderSummary.getReceiver().getRaddr()%>">
	    </div>
	    
	  </form>
	  
	  <input type="button" value="결제하기" onClick="pay()"/>
	  <input type="button" value="이전단계" onClick="history.back();"/>
	  
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




