package com.jwebsite.vo;

public class Question {
	private int id;
	private int testID;
	private String title;
	private int type;
	private int answer;
	private int status;
	private int score;
	private String selects;
	private String selA;
	private String selB;
	private String selC;
	private String selD;
	private String dSelA;
	private String dSelB;
	private String dSelC;
	private String dSelD;
	
	
	public int getAnswer() {
		return answer;
	}
	public void setAnswer(int answer) {
		this.answer = answer;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getTestID() {
		return testID;
	}
	public void setTestID(int testID) {
		this.testID = testID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getSelects() {
		return selects;
	}
	public void setSelects(String selects) {
		this.selects = selects;
	}
	public String getDSelA() {
		return dSelA;
	}
	public void setDSelA(String selA) {
		dSelA = selA;
	}
	public String getDSelB() {
		return dSelB;
	}
	public void setDSelB(String selB) {
		dSelB = selB;
	}
	public String getDSelC() {
		return dSelC;
	}
	public void setDSelC(String selC) {
		dSelC = selC;
	}
	public String getDSelD() {
		return dSelD;
	}
	public void setDSelD(String selD) {
		dSelD = selD;
	}
	public String getSelA() {
		return selA;
	}
	public void setSelA(String selA) {
		this.selA = selA;
	}
	public String getSelB() {
		return selB;
	}
	public void setSelB(String selB) {
		this.selB = selB;
	}
	public String getSelC() {
		return selC;
	}
	public void setSelC(String selC) {
		this.selC = selC;
	}
	public String getSelD() {
		return selD;
	}
	public void setSelD(String selD) {
		this.selD = selD;
	}

}
