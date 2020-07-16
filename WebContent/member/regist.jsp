<%@page import="com.pet.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<Product> productList=(List)request.getAttribute("productList");
%>
<!DOCTYPE html>
<html>
<head>
<title>Pet Shop</title>
<meta charset="utf-8">
<link href="/css/style.css" rel="stylesheet" type="text/css">

<!--[if IE 6]><link href="/css/ie6.css" rel="stylesheet" type="text/css"><![endif]-->
<!--[if IE 7]><link href="/css/ie7.css" rel="stylesheet" type="text/css"><![endif]-->
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
	border:2px solid red;
	display:inline-block;
	margin-top:20px;
}
</style>
<script>
function regist(){
	form1.method="post";
	form1.action="/member/regist";
	form1.submit();
}
function login(){
	location.href="/member/login.jsp";
}
</script>
</head>
<body>
<div id="header"> 
	<%@ include file="/include/main_navi.jsp" %>
</div>
<div id="body">

  <div id="content">
  	<div id="buyer">
  		<form name="form1">
		    <input type="text" name="id" placeholder="아이디 입력">
		    <input type="text" name="password" placeholder="비밀번호 입력">
		    <input type="text" name="name" placeholder="이름 입력">
		    <input type="text" name="phone" placeholder="연락처">
		    <select id="country" name="email">
		      <option value="0">메일선택</option>
		      <option value="naver.com">naver</option>
		      <option value="gmail.com">google</option>
		      <option value="daum.net">daum</option>
		    </select>
	    </form>
	    <input type="button" value="회원등록" onClick="regist()"/>
	    <input type="button" value="로그인" onClick="login()"/>
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

  <%@ include file="/include/footer.jsp" %>

</body>
</html>
