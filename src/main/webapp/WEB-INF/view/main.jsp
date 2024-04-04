<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*,model.*"%>
<%
	List<Shibe> list=(List<Shibe>)request.getAttribute("list");
%>

<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Favorite Shibes</title>
  <link rel="stylesheet" href="http://yui.yahooapis.com/3.18.1/build/cssreset/cssreset-min.css">
<link rel=“stylesheet” type=“text/css” href=“http://mplus-fonts.sourceforge.jp/webfonts/general-j/mplus_webfonts.css”>
<link rel=“stylesheet” type=“text/css” href=“http://mplus-fonts.sourceforge.jp/webfonts/basic_latin/mplus_webfonts.css”>
  <link rel="stylesheet" href="css/main.css"/>
</head>
<body>
   <header id="header">
    <h1><a href="Main" class="maintitle">Favorite Shibes</a></h1>
     <nav class="nav">
      <ul class="menu-group">
        <li class="menu-item"><a href="Main">おきにいり</a></li>
        <li class="menu-item"><a href="MainResearch">さがす</a></li>
         <li class="menu-item"><a href="Admin">登録する</a></li>
         <li class="menu-item"><a href="Quiz">クイズ</a></li>
      </ul>
    </nav>
  </header>
  <div id="wrapper">
    <div id="menu">
     <%for(Shibe s:list){ %>
      <div>
      <p><%=s.getId()%></p>
      
      <% String str=s.getImgname();%>
      <% if(str.contains("https")){ %>
      <img src="<%=s.getImgname() %>">
      <%}else{ %>
      <img src="upload/<%=s.getImgname() %>">
      <%} %>
      
        <p>title<br><%=s.getTitle() %></p>
        <p>memo<br><%=s.getMemo() %></p>
      </div>
     <%} %>
    </div>
  </div>
    <footer id="footer">
  	<p>© All rights reserved by moecosato.</p>
  </footer>
</body>
</html>