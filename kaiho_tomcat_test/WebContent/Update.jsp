<%@page import="kaiho_tomcat_test.HelloWorldBean"%>
<%@ page language="java" contentType="text/html; charset=Shift-JIS"
    pageEncoding="Shift-JIS"%>
<%
	java.util.List<HelloWorldBean> list = (java.util.List<HelloWorldBean>) request.getAttribute("list");
%>
<jsp:useBean id="bean" class="kaiho_tomcat_test.HelloWorldBean" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="Shift-JIS">
<title>DB接続・表示</title>
</head>
<body>
	<h3>DB接続・表示</h3>

	<h4>編集フォーム</h4>

	<p>IDと名前を編集してください</p>

	<form method="POST"
		action="<%=request.getContextPath()%>/UpServlet">

		<p>
			ID：<%=bean.getId()%><input type="text" name="id">
		</p>
		<p>
			名前：<%=bean.getSname()%><input type="text" name="sname">
		</p>
		<input type="submit" value="編集">
	</form>

</body>
</html>