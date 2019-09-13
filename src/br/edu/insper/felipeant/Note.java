package br.edu.insper.felipeant;

public class Note {
	
	private Integer user_id;
	private String content;
	private Integer id;
	
	public Integer getId() {return id;}
	public void setId(Integer id) {this.id = id;}
	
	public Integer getUser() {return user_id;}
	public void setUser(Integer user_id) {this.user_id = user_id;}
	
	public String getContent() {return content;}
	public void setContent(String content) {this.content= content;}

}
