<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,br.edu.insper.felipeant.*" %>
<!DOCTYPE html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<html>
<head>
<meta charset="UTF-8">
<title>Remover nota</title>
</head>
<body>

<% int noteId=  Integer.valueOf(request.getParameter("note_id"));
String email = session.getAttribute("email").toString();
String senha = session.getAttribute("password").toString();
DAO dao = new DAO();
dao.removeNote(noteId);%>
Note removed <br>
<a href= "Dashboard.jsp">Back to your notes</a>
<% session.setAttribute("email", email);
session.setAttribute("password", senha);%>
</body>
</html>