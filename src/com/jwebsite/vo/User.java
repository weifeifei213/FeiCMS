package com.jwebsite.vo;

public class User {
	private Integer UserID;// 主键
	private Integer GroupID;// 用户组ID
	private Integer UserType;// 用户类型
	private String UserName;// 用户名
	private String Password;// 密码
	private String Question;// 密保问题
	private String Answer;// 答案
	private String Email;// 邮箱
	private String UserFace;// 头像
	private String Sign;	//
	private String RegTime;// 注册时间
	private Integer IsLocked;// 是否锁定 0未锁定 1锁定
	private Integer SpecialPermission;// 专题
	private String arrClass_Browse;// 浏览权限
	private String arrClass_View;
	private String arrClass_Input;// 输入权限
	private String UserSetting; //
	private String UserNote;
	
	public Integer getUserID() {
		return UserID;
	}
	public void setUserID(Integer userID) {
		UserID = userID;
	}
	public Integer getGroupID() {
		return GroupID;
	}
	public void setGroupID(Integer groupID) {
		GroupID = groupID;
	}
	public Integer getUserType() {
		return UserType;
	}
	public void setUserType(Integer userType) {
		UserType = userType;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getQuestion() {
		return Question;
	}
	public void setQuestion(String question) {
		Question = question;
	}
	public String getAnswer() {
		return Answer;
	}
	public void setAnswer(String answer) {
		Answer = answer;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getUserFace() {
		return UserFace;
	}
	public void setUserFace(String userFace) {
		UserFace = userFace;
	}
	public String getSign() {
		return Sign;
	}
	public void setSign(String sign) {
		Sign = sign;
	}
	public String getRegTime() {
		return RegTime;
	}
	public void setRegTime(String regTime) {
		RegTime = regTime;
	}
	public Integer getIsLocked() {
		return IsLocked;
	}
	public void setIsLocked(Integer isLocked) {
		IsLocked = isLocked;
	}
	public Integer getSpecialPermission() {
		return SpecialPermission;
	}
	public void setSpecialPermission(Integer specialPermission) {
		SpecialPermission = specialPermission;
	}
	public String getArrClass_Browse() {
		return arrClass_Browse;
	}
	public void setArrClass_Browse(String arrClassBrowse) {
		arrClass_Browse = arrClassBrowse;
	}
	public String getArrClass_View() {
		return arrClass_View;
	}
	public void setArrClass_View(String arrClassView) {
		arrClass_View = arrClassView;
	}
	public String getArrClass_Input() {
		return arrClass_Input;
	}
	public void setArrClass_Input(String arrClassInput) {
		arrClass_Input = arrClassInput;
	}
	public String getUserSetting() {
		return UserSetting;
	}
	public void setUserSetting(String userSetting) {
		UserSetting = userSetting;
	}

}
