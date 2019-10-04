<!-- Servlet01.javaからforwardされる -->
<%@page import="kaiho_tomcat_test.HelloWorldBean"%>
<%@ page language="java" contentType="text/html; charset=Shift-JIS"
	pageEncoding="Shift-JIS"%>
<%--<jsp:useBean id="HelloWorldBean" class="kaiho_tomcat_test.HelloWorldBean" scope="request"/> --%>

<%
	java.util.List<HelloWorldBean> list = (java.util.List<HelloWorldBean>) request.getAttribute("list");
%>

<!-- 	kaiho_tomcat_test.HelloWorldBean bean = (kaiho_tomcat_test.HelloWorldBean) request.getAttribute("helloWorldBean");
	java.util.List<HelloWorldBean> list = //(java.util.List<HelloWorldBean>) request.getAttribute("list");
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="Shift-JIS">
<title>DB接続・表示</title>
</head>
<body>
	<h3>DB接続・表示</h3>


	<h4>登録結果</h4>

	<table>
		<%
			for (HelloWorldBean bean : list) {
		%>
		<tr>
			<td>----------</td>
		</tr>

		<tr>
			<td><a href="">編集</a></td>
		</tr>

		<tr>
			<td>ID：<%=bean.getId()%></td>
		</tr>
		<tr>
			<td>名前：<%=bean.getSname()%></td>
		</tr>
		<%
			}
		%>
	</table>



</body>
</html>