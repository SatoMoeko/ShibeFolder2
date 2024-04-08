<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>いぬクイズ</title>
			<link rel="stylesheet" href="http://yui.yahooapis.com/3.18.1/build/cssreset/cssreset-min.css">
			<link rel=“stylesheet” type=“text/css”
				href=“http://mplus-fonts.sourceforge.jp/webfonts/general-j/mplus_webfonts.css”>
			<link rel=“stylesheet” type=“text/css”
				href=“http://mplus-fonts.sourceforge.jp/webfonts/basic_latin/mplus_webfonts.css”>
			<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
				integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
				crossorigin="anonymous">
			<link rel="stylesheet" href="css/quiz.css" />
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
				<h2 class="subtitle">いぬクイズ</h2>
					<div id="container">
						<p id="ja">quiz</p>
						<img id="img" src="images/shibe01.jpg">
						<input type="text" id="entry">
						<button id="btn">回答する</button>
						<p id="result">answer</p>
					</div>
			</div>
			<footer id="footer">
				<p>© All rights reserved by moecosato.</p>
			</footer>
				<script src="js/quiz.js"></script>
		</body>

		</html>