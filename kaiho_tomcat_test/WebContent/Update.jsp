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
<title>DB�ڑ��E�\��</title>
</head>
<body>
	<h3>DB�ڑ��E�\��</h3>

	<h4>�ҏW�t�H�[��</h4>

	<p>ID�Ɩ��O��ҏW���Ă�������</p>

	<form method="POST"
		action="<%=request.getContextPath()%>/UpServlet">

		<p>
			ID�F<%=bean.getId()%><input type="text" name="id">
		</p>
		<p>
			���O�F<%=bean.getSname()%><input type="text" name="sname">
		</p>
		<input type="submit" value="�ҏW">
	</form>

</body>
</html>