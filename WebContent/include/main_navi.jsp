<%@page import="com.pet.domain.Member"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Member member = (Member)session.getAttribute("member");
%>
<div id="header">
	<a href="/" id="logo">
		<img src="/images/logo.gif" width="200" height="90" alt="">
	</a>
  <ul class="navigation">  
    <li><a href="/product/list">상품목록</a></li>
    <li><a href="/event/list">기획상품</a></li>
    
    <%if(member==null){%>
    	<li><a href="javascript:alert('로그인이 필요한 서비스입니다.');">장바구니</a></li>
	<%}else{%>    	
    	<li><a href="/shop/cart/list">장바구니</a></li>
    <%}%>
    
    <li><a href="/mypage/list">MyPage</a></li>
	<%if(member==null){%>    
    	<li><a href="/member/login.jsp">로그인</a></li>
    <%}else{%>
    	<li><a href="/member/logout">로그아웃</a></li>
    <%}%>
    <li><a href="/cs/main">1:1상담</a></li>
  </ul>
</div>  






