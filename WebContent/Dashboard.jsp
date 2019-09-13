<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*,br.edu.insper.felipeant.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<meta charset="UTF-8">
<title>Suas notas</title>
</head>
<body>

	<% 
	
	String email = request.getParameter("email"); 
	String password = request.getParameter("password");
	
	System.out.println(email);
	System.out.println(password);

	
	if (email == null) {
		email = session.getAttribute("email").toString(); 
		password = session.getAttribute("password").toString();
	}
	
	DAO dao = new DAO(); 
	List<User> users = dao.listUsers();

	Boolean passwordMatch = false;
	Boolean foundEmail = false;

	List<Note> notes = null;

	for (User user: users){

		
		if (user.getEmail().equals(email)){
			foundEmail = true;
			if (user.getPassword().equals(password)){
				email = user.getEmail();
				session.setAttribute("user_id", user.getId());
				session.setAttribute("email", email);
				session.setAttribute("password", password);
				notes = dao.listNotes(email);
				passwordMatch = true;
				}
			}

	}
		
	if (passwordMatch) {
		if (!notes.isEmpty()){ %>		
		
		<div class="jumbotron">
		  <h1 class="display-4">Hello, <%= email %> this are your notes!</h1>
		  <p class="lead">This is where you can save your ideas and reminders interacting like they were in your head</p>
		  <hr class="my-4">
		  <a href="StoreNote.jsp" class="btn btn-dark" role="button">Add Note</a>
		  <a href='index.html' class="btn btn-danger" role="button">Logout</a>
		</div>
		
		
		<h1>Your notes<span class="badge badge-secondary">HeadNote</span></h1>
		
		<form class="container" action="Dashboard.jsp">
		</form>
		
		<% 
		for (Note note : notes){ %>	
		
		<div class="card" style="width: 18rem;">
		  <div class="card-body">
		    <p class="card-text"><%= note.getContent() %></p>
		    <a href="RemoveNote.jsp?note_id=<%=note.getId() %>"class="card-link">Remover Nota</a>
		    <a href="EditNote.jsp?note_id=<%=note.getId() %>&content=<%=note.getContent()%>" class="card-link">Editar Nota</a>
		  </div>
		</div>

	<%}
		session.setAttribute("email", email);
		session.setAttribute("password", password);
		}
		else{ %>
		<div class="jumbotron">
		  <h1 class="display-4">Hello, <%= email %> this are your notes!</h1>
		  <p class="lead">This is where you can save your ideas and reminders interacting like they were in your head</p>
		  <hr class="my-4">
		  <a href="StoreNote.jsp" class="btn btn-dark" role="button">Add Note</a>
		  <a href='index.html' class="btn btn-danger" role="button">Logout</a>
		</div>
		
		
		<h1>Your notes<span class="badge badge-secondary">HeadNote</span></h1>
		
		<form class="container" action="Dashboard.jsp">
		</form>
		
		<% 
		for (Note note : notes){ %>	
		
		<div class="card" style="width: 18rem;">
		  <div class="card-body">
		    <p class="card-text"><%= note.getContent() %></p>
		    <a href="RemoveNote.jsp?note_id=<%=note.getId() %>"class="card-link">Remover Nota</a>
		    <a href="EditNote.jsp?note_id=<%=note.getId() %>&content=<%=note.getContent()%>" class="card-link">Editar Nota</a>
		  </div>
		</div>

	<%}
 } %>

	
	<%	
	
	} else {
		if (!foundEmail) {
			 %>
				Email not registered. Register here <a href="Register"></a>. 
			<%	
		} else {
			 %>
				Wrong answer. Click <a href='index.html'>here</a> to go back. 
			<%	
		}
	}
	
	%>	
<br>	    
</body>
</html>