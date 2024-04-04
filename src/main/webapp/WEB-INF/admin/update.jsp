<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/ShibeFolder2/css/admin.css">
</head>
<body>
<header id="header">
    <h1><a href="/ShibeFolder2/Main" class="maintitle">Favorite Shibes</a></h1>
     <nav class="nav">
      <ul class="menu-group">
        <li class="menu-item"><a href="/ShibeFolder2/Main">おきにいり</a></li>
        <li class="menu-item"><a href="/ShibeFolder2/MainResearch">さがす</a></li>
         <li class="menu-item"><a href="/ShibeFolder2/Admin">登録する</a></li>
         <li class="menu-item"><a href="/ShibeFolder2/Quiz">クイズ</a></li>
      </ul>
    </nav>
</header>
<div id="wrapper">
		<div class="container">
			<h2 class="subtitle">いぬ情報編集ページ</h2>
			<form action="/ShibeFolder2/Admin/Update" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="title">title</label>
					<input type="text" name="title" id="title" class="form-control" value="${shibe.title}" required>
				</div>
				<div class="form-group">
					<label for ="memo">memo</label>
					<input type="text" name="memo" id="memo" class="form-control" value="${shibe.memo}" required>
				</div>
					<img class="sampleImg" src="/ShibeFolder2/upload/${shibe.imgname}"><br>
				<div class="form-group">
					<label for="imgname">shibe image</label>
					<input type="file" name="imgname" class="form-control" id="imgname">
				</div>
					<input type="hidden" name="id" value="${shibe.id}">
					<input type="hidden" name="orgname" value="${shibe.imgname}">
				<div class="form-group">
					<button type="submit" class="byn btn-primary">更新</button>
			</form>
					<script>
					window.onload=()=>{
						const inputFile=document.getElementById("imgname");
						const previewImg=document.getElementById("preview");
						const reader=new FileReader();
						reader.addEventListener("load",()=>{
							previewImg.src=reader.result;
						});
						inputFile.addEventListener("change",()=>{
							reader.readAsDataURL(inputFile.files[0]);
						});
					};
					</script>
				</div>
		</div>
</div>
<footer id="footer">
  	<p>© All rights reserved by moecosato.</p>
</footer>
</body>
</html>