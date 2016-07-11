package com.jwebsite.vo;

public class Email {
	private String Title;
	private String Value;
	private String EmailAddress;
	
	public Email(String title,String value,String email) {
	this.Title=title;
	this.Value=value;
	this.EmailAddress=email;	
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getValue() {
		return Value;
	}

	public void setValue(String value) {
		Value = value;
	}

	public String getEmailAddress() {
		return EmailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		EmailAddress = emailAddress;
	}

	
	
	
	
}
