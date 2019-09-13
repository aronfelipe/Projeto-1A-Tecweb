package br.edu.insper.felipeant;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.edu.insper.felipeant.User;
import br.edu.insper.felipeant.Note;


public class DAO {
	private Connection connection  = null;
	
	public DAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			connection = DriverManager.getConnection(
					"jdbc:mysql://localhost/proj", "root", "3412");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public List<User> listUsers(){
	
		
		List<User> users = new ArrayList<User>();
		
		PreparedStatement stmt;
		
		try {
			stmt = connection.prepareStatement("SELECT * FROM Users;");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				users.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return users;
	}
	
	public List<Note> listNotes(String email){
	
		List<Note> notes = new ArrayList<Note>();
		
		PreparedStatement stmt;
		
		try {
			stmt = connection.prepareStatement("SELECT Users.id AS user_id, Notes.id AS note_id, Notes.content FROM Users JOIN Notes ON Notes.user_id = Users.id WHERE Users.email = '" + email + "' ORDER BY Notes.content ASC");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Note note = new Note();
				note.setUser(rs.getInt("user_id"));
				note.setId(rs.getInt("note_id"));
				note.setContent(rs.getString("content"));
				notes.add(note);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return notes;
	}
	
	public void storeUser(User user) {
		String sql = "INSERT INTO Users (email, password) VALUES (?,?)";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, user.getEmail());
			stmt.setString(2, user.getPassword());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void storeNote(Integer userId, String content) {
		String sql = "INSERT INTO Notes (user_id, content) VALUES (?, ?)";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setInt(1, userId);
			stmt.setString(2, content);
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void editNote(String content, int noteId) {
		String sql = "UPDATE Notes  SET content = ? WHERE id = " + noteId + ";";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, content);
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void removeNote(int noteId) {
		String sql = "DELETE FROM Notes WHERE id =?;";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setInt(1, noteId);
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
	}
	
	public void close() {
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
