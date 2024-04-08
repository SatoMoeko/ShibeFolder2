<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>いぬをさがす</title>
<link rel="stylesheet" href="http://yui.yahooapis.com/3.18.1/build/cssreset/cssreset-min.css">
<link rel=“stylesheet” type=“text/css” href=“http://mplus-fonts.sourceforge.jp/webfonts/general-j/mplus_webfonts.css”>
<link rel=“stylesheet” type=“text/css” href=“http://mplus-fonts.sourceforge.jp/webfonts/basic_latin/mplus_webfonts.css”>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 <link rel="stylesheet" href="css/research.css"/>
</head>
<body>
 <header id="header">
    <h1><a href="/ShibeFolder2/Main" class="maintitle">Favorite Shibes</a></h1>
     <nav class="nav">
      <ul class="menu-group">
        <li class="menu-item"><a href="/ShibeFolder2/Main">おきにいり</a></li>
        <li class="menu-item"><a href="MainResearch">さがす</a></li>
         <li class="menu-item"><a href="/ShibeFolder2/Admin">登録する</a></li>
         <li class="menu-item"><a href="/ShibeFolder2/Quiz">クイズ</a></li>
      </ul>
    </nav>
  </header>
  <div id="wrapper">
  <div class="container">
	  <h2 class="subtitle">いぬをさがす</h2>
	  <p>ボタンを押すと柴犬の画像をランダム表示します。</p>
  		<button id="click" class="button">shibe join!</button>
  	<!-- APIから取得した犬種と画像を表示する -->
  		<div><img id="image"></div>
  		
  	<!-- 追加をおすとフォームがでてくる -->
  	<button id="favbtn" class="button">おきにいりに追加</button>
  	<div id="toggle">
  		<c:if test="${not empty msg }">
			<div class="alert alert-success" role="alert">
				${msg }
			</div>
		</c:if>
		<form class="mt-3" action="/ShibeFolder2/MainResearch" method="post">
			<div class="form-group">
				<label for="color">title</label>
				<input type="text" name="title" class="form-control" placeholder="タイトルを入力" required>
			</div>
			<div class="form-group">
				<label for="imgname">shibe</label>
				<input type="text" name="researchUrl" class="form-control" id='researchUrl'>
			</div>
			<div class="form-group">
				<label for="memo">memo</label>
				<input type="text" name="memo" class="form-control" placeholder="メモを入力" required>
			</div>
			<button type="submit" class="btn btn-primary">登録する</button>
		</form>
	</div>
</div>	
</div>
  <footer id="footer">
  	<p>© All rights reserved by moecosato.</p>
  </footer>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
  <script src="js/main.js"></script>
</body>
</html>