<!-- Servlet01.java����forward����� -->
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
<title>DB�ڑ��E�\��</title>
</head>
<body>
	<h3>DB�ڑ��E�\��</h3>


	<h4>�o�^����</h4>

	<table>
		<%
			for (HelloWorldBean bean : list) {
		%>
		<tr>
			<td>----------</td>
		</tr>

		<tr>
			<td><a href="">�ҏW</a></td>
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