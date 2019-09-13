<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<%@ page import="java.util.*,br.edu.insper.felipeant.*" %>	
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>Editar nota</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href= "css/Login.css" rel="stylesheet">

	</head>
	
	<% String edit = request.getParameter("content"); 
	if (edit == null) {
		edit = "Digite aqui";
	}
	%>
	
	<div class="input-group input-group-lg">
  		<div class="input-group-prepend">
  		<form action ="EditNote.jsp" method='post'>
  			<input type="text" class="form-control" aria-label="Large" aria-describedby="inputGroup-sizing-sm" size="35" value= <%= edit %> name="editNote">
  			<input type="submit" value='Submit'/>
  		</form>
  		</div>
	</div>
	
	<%
	
	String noteId;
	
	if (request.getParameter("note_id") == null) {
		noteId = session.getAttribute("note_id").toString();
	} else {
		noteId = request.getParameter("note_id");
		session.setAttribute("note_id", noteId);
	}
	
	String userId = session.getAttribute("user_id").toString();

	String email = session.getAttribute("email").toString(); 
	String password = session.getAttribute("password").toString();
	
	System.out.println(noteId);
	
	DAO dao = new DAO(); 
	
	if ( request.getParameter("editNote") != null){
		dao.editNote(request.getParameter("editNote"), Integer.valueOf(noteId));
	}
	
	dao.close();

	
	%>

	Click <a href="Dashboard.jsp">here</a> to go back to your notes.
	</body>
	</html>