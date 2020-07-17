<%@page import="com.pet.domain.Receiver"%>
<%@page import="com.pet.domain.OrderDetail"%>
<%@page import="com.pet.domain.OrderSummary"%>
<%@page import="com.pet.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<OrderDetail> detailList=(List)request.getAttribute("detailList");

	OrderSummary orderSummary=(OrderSummary)request.getAttribute("orderSummary");
	Receiver receiver = orderSummary.getReceiver();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/admin.css"/>
<style>
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
}

th, td {
  text-align: left;
  padding: 16px;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

#btnArea{
	margin-top:20px;
	text-align:center;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function getDetail(order_summary_id){
	//상세보기 요청 
	location.href="/admin/order/detail?order_summary_id="+order_summary_id;
}
</script>
</head>
<body>
<%@include file="/admin/inc/main_navi.jsp"%>

<div id="productList">
	<h3>구매 상품 정보</h3>
	<table>
	  <tr>
	    <th>상품코드</th>
	    <th>이미지</th>
	    <th>카테고리</th>
	    <th>상품명</th>
	    <th>가격</th>
	    <th>브랜드</th>
	  </tr>
	  <%for(int i=0;i<detailList.size();i++){%>
	  <%
	  		OrderDetail orderDetail = detailList.get(i);
	  		Product product=orderDetail.getProduct();
	  %>
	  <tr>
	    <td><%=product.getProduct_id()%></td>
		<td><img src="/data/<%=product.getFilename()%>" width="45px"/></td>
		<td><%=product.getCategory().getCategory_name()%></td>
		<td><%=product.getProduct_name()%></td>
		<td><%=product.getPrice()%></td>
		<td><%=product.getBrand()%></td>
	  </tr>
	  <%} %>
	  <tr>
	  	<td colspan="7" align="center">
	  		<button onClick="location.href='/admin/product/registForm.jsp';">상품등록</button>
	  	</td>
	  </tr>
	  <tr>
	  	<td colspan="7" style="text-align:center">
	  	합계 
	  	</td>
	  </tr>
	  
	</table>
</div>
<div id="payInfo">
	<h3>결제 내역</h3>
	<table>
	  <tr>
	    <th>주문자</th>
	    <th>연락처</th>
	    <th>이메일</th>
	    <th>주소</th>
	    <th>결제금액</th>
	    <th>주문일시</th>
	    <th>결제방법</th>
	  </tr>
	  <tr>
	    <td><%=orderSummary.getMember().getName()%></td>
		<td><%=orderSummary.getMember().getPhone()%></td>
		<td><%=orderSummary.getMember().getEmail()%></td>
		<td><%=orderSummary.getMember().getAddr()%></td>
		<td><%=orderSummary.getTotal_pay()%></td>
		<td><%=orderSummary.getOrder_date()%></td>
		<td><%=orderSummary.getPay_method()%></td>
	  </tr>
	  <tr>
	  	<td colspan="7" align="center">
	  		<button onClick="location.href='/admin/product/registForm.jsp';">상품등록</button>
	  	</td>
	  </tr>
	  <tr>
	  	<td colspan="7" style="text-align:center">
	  	합계 
	  	</td>
	  </tr>
	  
	</table>
</div>
<div id="receiveInfo">
	<h3>배송정보</h3>
	<table>
	  <tr>
	    <th>배송자 코드</th>
	    <th>받는사람</th>
	    <th>연락처</th>
	    <th>주소</th>
	  </tr>
	  <tr>
		<td><%=receiver.getReceiver_id()%></td>
	    <td><%=receiver.getRname()%></td>
		<td><%=receiver.getRphone()%></td>
		<td><%=receiver.getRaddr()%></td>
	  </tr>
	  <tr>
	  	<td colspan="7" align="center">
	  		<button onClick="location.href='/admin/product/registForm.jsp';">상품등록</button>
	  	</td>
	  </tr>
	  <tr>
	  	<td colspan="7" style="text-align:center">
	  	합계 
	  	</td>
	  </tr>
	</table>
</div>
<div id="btnArea">
	<button>주문목록</button>
	<button>주문수정</button>
	<button>주문삭제</button>
</div>
</body>
</html>

















