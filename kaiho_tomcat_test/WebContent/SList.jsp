<!-- �������� -->
<%@page import="kaiho_tomcat_test.HelloWorldBean"%>
<%@ page language="java" contentType="text/html; charset=Shift-JIS"
    pageEncoding="Shift-JIS"%>
<%
	java.util.List<HelloWorldBean> list = (java.util.List<HelloWorldBean>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="Shift-JIS">
<title>DB�ڑ��E�\��</title>
</head>
<body>
	<h3>DB�ڑ��E�\��</h3>

	<h4>��������</h4>

	<table>


		<%
			for (HelloWorldBean bean : list) {
		%>
		<tr>
			<td>----------</td>
		</tr>

		<tr>
			<td><a href="Update.jsp">�ҏW</a></td>
		</tr>

		<tr>
			<td>ID�F<%=bean.getId()%></td>
		</tr>
		<tr>
			<td>���O�F<%=bean.getSname()%></td>
		</tr>
		<%
			}
		%>
	</table>

</body>
</html>