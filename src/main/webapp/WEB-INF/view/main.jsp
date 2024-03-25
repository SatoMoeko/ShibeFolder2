<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <h1><a href="Main">Favorite Shibes</a></h1>
     <nav class="nav">
      <ul class="menu-group">
        <li class="menu-item"><a href="Main">おきにいり</a></li>
        <li class="menu-item"><a href="#">さがす</a></li>
         <li class="menu-item"><a href="Admin">登録する</a></li>
      </ul>
    </nav>
  </header>
  <div id="wrapper">
    <div id="menu">
    <c:forEach var="s" items="${list }">
      <div>
      <p>${s.id}</p>
        <img src="upload/${s.imgname}">
        <p>title<br>${s.title}</p>
        <p>memo<br>${s.memo}</p>
      </div>
     </c:forEach>
    </div>
  </div>
    <footer id="footer">
  	<p>© All rights reserved by moecosato.</p>
  </footer>
</body>
</html>