<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,model.*" %>
<%
	List<Shibe> list=(List<Shibe>)request.getAttribute("list");
	String msg=(String)request.getAttribute("msg");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>いぬ管理画面</title>
<link rel=“stylesheet” type=“text/css” href=“http://mplus-fonts.sourceforge.jp/webfonts/general-j/mplus_webfonts.css”>
<link rel=“stylesheet” type=“text/css” href=“http://mplus-fonts.sourceforge.jp/webfonts/basic_latin/mplus_webfonts.css”>
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
	<h2 class="subtitle">いぬを登録する</h2>
		<% if(msg != null){ %>
			<div class="alert alert-success" role="alert">
				<%=msg %>
			</div>
		<%} %>
		
		<form class="mt-3" action="/ShibeFolder2/Admin" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="color">title</label>
				<input type="text" name="title" class="form-control" placeholder="タイトルを入力" required>
			</div>
			<div class="form-group">
				<label for="imgname">shibe</label>
				<input type="file" name="imgname" class="form-control" id="imgname">
			</div>
			<div class="form-group">
				<label for="memo">memo</label>
				<input type="text" name="memo" class="form-control" placeholder="メモを入力" required>
			</div>
			<button type="submit" class="btn btn-primary">登録</button>
		</form>

		<% if(list != null && list.size()>0){ %>
			<table class="table table-bordered mt-5">
				<%for(Shibe s:list){ %>
					<tr>
						<td><%=s.getId() %></td>
						
						 <% String str=s.getImgname();%>
      					<% if(str.contains("https")){ %>
      						<td><img src="<%=s.getImgname() %>"></td>
      					<%}else{ %>
      						<td><img src="/ShibeFolder2/upload/<%=s.getImgname() %>"></td>
      					<%} %>
						
						<td><%=s.getTitle() %></td>
						<td><%=s.getMemo() %></td>
						<td><a href="/ShibeFolder2/Admin/Update?id=<%=s.getId() %>">更新</a></td>
						<td><a href="/ShibeFolder2/Admin/Delete?id=<%=s.getId() %>" onclick="return confirm('削除しますか？')">削除</a></td>
					</tr>
				<%} %>
			</table>
		<%} %>
</div>
</div>
<footer id="footer">
  	<p>© All rights reserved by moecosato.</p>
 </footer>
</body>
</html>