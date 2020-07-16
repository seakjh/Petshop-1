<%@page import="com.pet.domain.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.pet.domain.Product"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<Cart> cartList=null;//결정 짓지 말자

	//session cart 이름의 List 가 존재한다면 바로구매한것이다!
	if(session.getAttribute("cartOne")!=null){
		cartList=(List)session.getAttribute("cartOne");
		out.print("바로구매 존재함");
	}else{
		cartList=(List)session.getAttribute("cartList");
	}
	Member obj=(Member)session.getAttribute("member");
	
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
#buyer, #receiver{
	width:48%;
	border:2px solid red;
	display:inline-block;
}
</style>
<script>
$(function(){
	$("input[type='checkbox']").click(function(){
		copy();
		$("input[name='raddr']").focus();
	});
});

//주문자 정보를 받을 사람 정보로 옮기기
function copy(){
	var cname=$("input[name='cname']").val();
	var cphone=$("input[name='cphone']").val();
	
	$("input[name='receiver.rname']").val(cname);		
	$("input[name='receiver.rphone']").val(cphone);		
}

//결제하기 단계 요청
function pay(){
	$("form").attr({
		"action":"/shop/step2",
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
		<h2>결제정보 입력</h2>
		
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
	  	<input type="hidden" name="total_pay" value="<%=totalBuy %>"/>
	  	<div id="buyer">
		    <input type="text" name="cname" value="<%=obj.getName()%>">
		    <input type="text" name="cphone" value="<%=obj.getPhone()%>">
		    <input type="text" name="email" value="<%=obj.getEmail()%>">
		    <input type="text" name="addr" value="<%=obj.getAddr()%>">
		    <select id="country" name="pay_method">
		      <option value="0">결제방법</option>
		      <option value="card">신용카드</option>
		      <option value="online">온라인 입금</option>
		      <option value="phone">핸드폰 결제</option>
		    </select>
	    </div>
	    <div id="receiver">
	    	<input type="checkbox" name="same" value="yes"/>주문자 정보와 동일
		    <input type="text" name="receiver.rname" 	placeholder="받는분 이름">
		    <input type="text" name="receiver.rphone" placeholder="받는 분 연락처">
		    <input type="text" name="receiver.raddr" 	placeholder="받는 분 주소">
	    </div>
	  </form>
	  
	  <input type="button" value="결제하기" onClick="pay()"/>
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




