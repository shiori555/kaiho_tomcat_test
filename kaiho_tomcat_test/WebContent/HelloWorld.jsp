<%@ page language="java" contentType="text/html; charset=Shift_JIS"
	pageEncoding="Shift_JIS"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="Shift_JIS">
<title>DB接続・表示</title>
</head>
<body>

	<h3>DB接続・表示</h3>
	<h4>登録・検索フォーム</h4>

	<p>登録したいIDと名前を入力してください</p>

	<form method="POST"
		action="<%=request.getContextPath()%>/HelloWorldServlet01">
		<p>
			ID：<input type="text" name="id">
		</p>
		<p>
			名前：<input type="text" name="sname">
		</p>
		<input type="submit" value="登録">
	</form>

	<p>検索したいIDや名前を入力してください</p>

	<form method="POST"
		action="<%=request.getContextPath()%>/HelloWorldServlet02">
		<p>
			ID：<input type="text" name="id">
		</p>
		<p>
			名前：<input type="text" name="sname">
		</p>
		<input type="submit" value="検索">
	</form>
</body>
</html>