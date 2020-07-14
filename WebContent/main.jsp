<%@page import="com.pet.model.product.Product"%>
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
<!--[if IE 6]><link href="css/ie6.css" rel="stylesheet" type="text/css"><![endif]-->
<!--[if IE 7]><link href="css/ie7.css" rel="stylesheet" type="text/css"><![endif]-->
</head>
<body>
<div id="header"> 
	<%@ include file="/include/main_navi.jsp" %>
</div>
<div id="body">
  <div class="banner">&nbsp;</div>
  <div id="content">
    <div class="content">
      <ul>
      	<%for(int i=0;i<productList.size();i++){%>
      	<%Product product =(Product)productList.get(i); %>
        <li> <a href="/shop/detail?product_id=<%=product.getProduct_id()%>"><img src="/data/<%=product.getFilename() %>" width="114" height="160" alt=""></a>
          <h2><%=product.getProduct_name() %></h2>
          <p><%=product.getBrand() %><a class="more" href="#">View all</a></p>
        </li>
        <%}%>
      </ul>
    </div>
    <div id="sidebar">
      <div class="search">
        <input type="text" name="s" value="Find">
        <button>&nbsp;</button>
        <label for="articles">
          <input type="radio" id="articles">
          Articles</label>
        <label for="products">
          <input type="radio" id="products" checked>
          PetMart Products</label>
      </div>
      <div class="section">
        <ul class="navigation">
          <li class="active"><a href="#">Shopping Guides</a></li>
          <li><a href="#">Discounted Items</a></li>
        </ul>
        <div class="aside">
          <div>
            <div>
              <ul>
                <li><a href="#">Pet Accesories </a> <a class="more" href="#">see all</a></li>
                <li><a href="#">Bath Essentials</a> <a class="more" href="#">see all</a></li>
                <li><a href="#">Pet Food</a> <a class="more" href="#">see all</a></li>
                <li><a href="#">Pet Vitamins</a> <a class="more" href="#">see all</a></li>
                <li><a href="#">Pet Needs</a> <a class="more" href="#">see all</a></li>
                <li><a href="#">Pet Toy and Treats</a> <a class="more" href="#">see all</a></li>
                <li><a href="#">Pet Supplies</a> <a class="more" href="#">see all</a></li>
                <li><a href="#">Pet Emergency Kit</a> <a class="more" href="#">see all</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="featured">
    <ul>
      <li><a href="#"><img src="images/organic-and-chemical-free.jpg" width="300" height="90" alt=""></a></li>
      <li><a href="#"><img src="images/good-food.jpg" width="300" height="90" alt=""></a></li>
      <li class="last"><a href="#"><img src="images/pet-grooming.jpg" width="300" height="90" alt=""></a></li>
    </ul>
  </div>
</div>
<div id="footer">
  <%@ include file="/include/footer.jsp" %>
</div>
</body>
</html>
