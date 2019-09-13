package br.edu.insper.felipeant;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.insper.felipeant.User;


/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response ) 
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
			
		out.println("<html><body>");
		out.println("<form  method='post'>");
		out.println("Email: <input type='text' name='email'><br>");
		out.println("Senha: <input type='password' name='password'><br>");
		out.println("Confirme sua senha: <input type='password' name='confirm_password'><br>");
		out.println("<input type='submit' value='Submit'>");
		out.println("</form>");
		out.println("<a href='index.html'><--Voltar</a>");
		
		out.println("<body><html>");
		
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response ) 
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		DAO dao = new DAO();
		
		User user = new User();
		user.setEmail(request.getParameter("email"));
		if (request.getParameter("password").equals(request.getParameter("confirm_password"))) {
			user.setPassword(request.getParameter("password"));
			dao.storeUser(user);
			
			out.println("<html><body>");
			out.print("User adicionado com sucesso. <br>");
			out.print("Clique <a href='index.html'>aqui</a> para voltar à tela de login.");
			out.println("</body></html>");
			
			
		}
		else {
			out.println("<html><body>");
			out.println("As senhas não batem, por favor, tente novamente. Clique <a href='register'>aqui</a> para voltar.");
			
			
		}
		dao.close();

	}

}
