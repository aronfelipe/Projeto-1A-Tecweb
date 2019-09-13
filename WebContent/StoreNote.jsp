<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,br.edu.insper.felipeant.*" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Adicionar nota</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href= "css/Login.css" rel="stylesheet">

</head>
<%

String email = session.getAttribute("email").toString(); 
String password = session.getAttribute("password").toString();
String userId = session.getAttribute("user_id").toString();%>

<body>
	<form action ="StoreNote.jsp" method='post'>
	Notes: <input value='Insert here your new note'type="text" name='notes' /><br>
	<input type="submit" value='Submit'/>
	</form>
	
<%if (request.getParameter("notes")!=null){
	DAO dao = new DAO();
	int id = Integer.parseInt(userId);			
	dao.storeNote(id, request.getParameter("notes"));
	dao.close();
	}

	session.setAttribute("password", password);
	session.setAttribute("email", email);%>

Click <a href="Dashboard.jsp">here</a> to go back to your notes.
</body>
</html>