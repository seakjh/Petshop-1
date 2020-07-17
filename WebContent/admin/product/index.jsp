<%@page import="com.pet.domain.EventProduct"%>
<%@page import="com.pet.domain.Event"%>
<%@page import="com.pet.controller.common.Pager"%>
<%@page import="com.pet.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//List<Product> productList=(List)request.getAttribute("productList");
	List<EventProduct> productList=(List)request.getAttribute("productList");
	
	List<Event> eventList=(List)request.getAttribute("eventList");
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
function sendToEvent(){
	//체크박스에 체크한게 있는지 유효성 검사부터 하자!!
	//체크박스에 체크한 경우 카운트를 1씩 증가시켜서, 만일
	//증가된게 없다면..체크안한 것이다!!
	var ch=document.getElementsByName("product_id");
	var count=0;
	
	for(var i=0;i<ch.length;i++){
		if(ch[i].checked){
			count++;
		}
	}
	if(document.querySelector("select").value=="0"){
		alert("등록하실 이벤트의 종류를 선택하세요");
		return;
	}else if(count<1){
		alert("선택된 상품이 없습니다");
		return;
	}
	
	if(confirm("선택한 상품을 이벤트 상품으로 등록할래요?")){
		//이벤트의 종류는 select 박스값이 결정하고 event_id
		//등록될 상품은 checkbox 가 결정한다
		var form=document.querySelector("form");
		form.action="/admin/eventproduct/regist";
		form.method="post";
		form.submit();
	}
}
</script>
</head>
<body>

<%@include file="/admin/inc/main_navi.jsp"%>
<div class="container">
<form>
<table>
  <tr>
	<td colspan="7">
		<select name="event.event_id">
			<option value="0">이벤트 상품 선택</option>
			<%for(int i=0;i<eventList.size();i++){%>
			<%Event event=eventList.get(i); %>
			<option value="<%=event.getEvent_id()%>"><%=event.getTitle() %></option>
			<%}%>
		</select>
	</td>	  	
  </tr>
  <tr>
    <th><input type="checkbox"/></th>
    <th>No</th>
    <th>이미지</th>
    <th>카테고리</th>
    <th>상품명</th>
    <th>가격</th>
    <th>브랜드</th>
    <th>이벤트상품 구분</th>
  </tr>
  
 <%int curPos=pager.getCurPos(); %>	
 <%int num=pager.getNum(); %>	
  <%for(int i=1;i<pager.getPageSize();i++){%>
 <%if(num<1)break;%>	
  <%
  	EventProduct eventProduct=productList.get(curPos++);
  	Product product = eventProduct.getProduct();
  %>
  <tr>
    <td>
    	<input type="checkbox" name="product_id" value="<%=product.getProduct_id()%>"/>
    </td>
    <td><%=num-- %></td>
    <td><img src="/data/<%=product.getFilename()%>" width="35px"/></td>
    <td><%=product.getCategory().getCategory_name()%></td>
    <td onClick="getDetail(<%=product.getProduct_id()%>)"><%=product.getProduct_name() %></td>
    <td><%=product.getPrice() %></td>
    <td><%=product.getBrand() %></td>
    <td>
    	<%if(eventProduct.getEvent()!=null){%>
    	<%=eventProduct.getEvent().getTitle()%>
    	<%}else{%>
    		없음
    	<%}%>
    	
    </td>
  </tr>
  <%} %>
  <tr>
  	<td colspan="8" align="center">
  		<button onClick="location.href='/admin/product/registForm.jsp';">상품등록</button>
  		<button onClick="sendToEvent()">이벤트 상품으로 등록</button>
  	</td>
  </tr>
  <tr>
  	<td colspan="8" style="text-align:center">
  		<%for(int i=pager.getFirstPage();i<=pager.getLastPage();i++){%>
  		<%if(i>pager.getTotalPage())break; %>
		<a href="/admin/product/list?currentPage=<%=i%>">[<%=i%>]</a>  		
		<%}%>
  	</td>
  </tr>
  
</table>
<form>
</body>
</html>




