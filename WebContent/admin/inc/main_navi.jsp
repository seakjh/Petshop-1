<%@page import="com.pet.domain.Admin"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Admin admin=(Admin)session.getAttribute("admin");
%>
<div class="topnav">
  <a class="active" href="#home">Home</a>
  <a href="/admin/category/index.jsp">카테고리 관리</a>
  <a href="/admin/product/list">상품관리</a>
  <a href="/admin/member/list">회원정보</a>
  <a href="/admin/order/list">주문정보</a>
  <a href="/admin/cs/main">고객센터</a>
  <a><%//=admin.getName() %>님 로그인 중</a>
</div>
