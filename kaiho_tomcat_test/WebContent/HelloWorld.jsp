<%@ page language="java" contentType="text/html; charset=Shift_JIS"
	pageEncoding="Shift_JIS"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="Shift_JIS">
<title>DB�ڑ��E�\��</title>
</head>
<body>

	<h3>DB�ڑ��E�\��</h3>
	<h4>�o�^�E�����t�H�[��</h4>

	<p>�o�^������ID�Ɩ��O����͂��Ă�������</p>

	<form method="POST"
		action="<%=request.getContextPath()%>/HelloWorldServlet01">
		<p>
			ID�F<input type="text" name="id">
		</p>
		<p>
			���O�F<input type="text" name="sname">
		</p>
		<input type="submit" value="�o�^">
	</form>

	<p>����������ID�▼�O����͂��Ă�������</p>

	<form method="POST"
		action="<%=request.getContextPath()%>/HelloWorldServlet02">
		<p>
			ID�F<input type="text" name="id">
		</p>
		<p>
			���O�F<input type="text" name="sname">
		</p>
		<input type="submit" value="����">
	</form>
</body>
</html>