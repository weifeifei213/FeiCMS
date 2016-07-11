package com.jwebsite.vo;

public class UserGroup {

	private Integer GroupID;//用户组ID
	private String  GroupName;//用户组名字
	private String  GroupIntro;//
	private Integer GroupType;//用户组类型
	private String  arrClass_Browse;//
	private String  arrClass_View;//       
	private String  arrClass_Input;//     
	private String  GroupSetting;//      
	private Integer DayInputMax;//
	public Integer getGroupID() {
		return GroupID;
	}
	public void setGroupID(Integer groupID) {
		GroupID = groupID;
	}
	public String getGroupName() {
		return GroupName;
	}
	public void setGroupName(String groupName) {
		GroupName = groupName;
	}
	public String getGroupIntro() {
		return GroupIntro;
	}
	public void setGroupIntro(String groupIntro) {
		GroupIntro = groupIntro;
	}
	public Integer getGroupType() {
		return GroupType;
	}
	public void setGroupType(Integer groupType) {
		GroupType = groupType;
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
	public String getGroupSetting() {
		return GroupSetting;
	}
	public void setGroupSetting(String groupSetting) {
		GroupSetting = groupSetting;
	}
	public Integer getDayInputMax() {
		return DayInputMax;
	}
	public void setDayInputMax(Integer dayInputMax) {
		DayInputMax = dayInputMax;
	}

}
