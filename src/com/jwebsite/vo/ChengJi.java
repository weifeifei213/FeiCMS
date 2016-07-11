package com.jwebsite.vo;
/**
 * 学校成绩查询
 * @author Byg
 *
 */
public class ChengJi {
	private int ID;  //成绩表id
	private int stuID;    //学号	
	private int kaoID;  //准考证号	

	private int state;  //科目id	
	private String cj01; //专题ID
	private String cj02;   //文章标题
	private String cj03; //录入者
	private String cj04; //专题ID
	private String cj05;   //文章标题
	private String cj06; //录入者
	
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getID() {
		return ID;
	}
	public void setID(int id) {
		ID = id;
	}
	public int getStuID() {
		return stuID;
	}
	public void setStuID(int stuID) {
		this.stuID = stuID;
	}
	
	public int getKaoID() {
		return kaoID;
	}
	public void setKaoID(int kaoID) {
		this.kaoID = kaoID;
	}
	public String getCj01() {
		return cj01;
	}
	public void setCj01(String cj01) {
		this.cj01 = cj01;
	}
	public String getCj02() {
		return cj02;
	}
	public void setCj02(String cj02) {
		this.cj02 = cj02;
	}
	public String getCj03() {
		return cj03;
	}
	public void setCj03(String cj03) {
		this.cj03 = cj03;
	}
	public String getCj04() {
		return cj04;
	}
	public void setCj04(String cj04) {
		this.cj04 = cj04;
	}
	public String getCj05() {
		return cj05;
	}
	public void setCj05(String cj05) {
		this.cj05 = cj05;
	}
	public String getCj06() {
		return cj06;
	}
	public void setCj06(String cj06) {
		this.cj06 = cj06;
	}
	
	
}
