<%@page import="com.pet.controller.common.Pager"%>
<%@page import="com.pet.model.product.Product"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<Product> productList=(List)request.getAttribute("productList");
	Pager pager=(Pager)request.getAttribute("pager");
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
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function getDetail(product_id){
	//상세보기 요청 
	location.href="/admin/product/detail?product_id="+product_id;
}
</script>
</head>
<body>
<%@include file="/admin/inc/main_navi.jsp"%>

<table>
  <tr>
    <th>No</th>
    <th>이미지</th>
    <th>카테고리</th>
    <th>상품명</th>
    <th>가격</th>
    <th>브랜드</th>
  </tr>
  
 <%int curPos=pager.getCurPos(); %>	
 <%int num=pager.getNum(); %>	
  <%for(int i=1;i<pager.getPageSize();i++){%>
 <%if(num<1)break;%>	
  <%Product product=productList.get(curPos++); %>
  <tr onClick="getDetail(<%=product.getProduct_id()%>)">
    <td><%=num-- %></td>
    <td><img src="/data/<%=product.getFilename()%>" width="35px"/></td>
    <td><%=product.getCategory().getCategory_name()%></td>
    <td><%=product.getProduct_name() %></td>
    <td><%=product.getPrice() %></td>
    <td><%=product.getBrand() %></td>
  </tr>
  <%} %>
  <tr>
  	<td colspan="6" align="center">
  		<button onClick="location.href='/admin/product/registForm.jsp';">상품등록</button>
  	</td>
  </tr>
  <tr>
  	<td colspan="6" style="text-align:center">
  		<%for(int i=pager.getFirstPage();i<=pager.getLastPage();i++){%>
  		<%if(i>pager.getTotalPage())break; %>
		<a href="/admin/product/list?currentPage=<%=i%>">[<%=i%>]</a>  		
		<%}%>
  	</td>
  </tr>
  
</table>

</body>
</html>




