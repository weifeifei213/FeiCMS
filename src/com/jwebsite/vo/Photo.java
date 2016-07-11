package com.jwebsite.vo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Photo {
	@Id
	@GeneratedValue
	private int ID;
	private String Tid;
	private String KeyWords;
	private String Title;
	private String PhotoUrl;
	private String PicUrls;
	private String PictureContent;
	private String Author;
	private String Origin;
	private String Rank;
	private String LastHitsTime;
	private int Hits;
	private int HitsByDay;
	private int HitsByWeek;
	private int HitsByMonth;
	private String AddDate;
	private String ModifyDate;
	private String JSID;
	private String TemplateID;
	private String Fname;
	private int RefreshTF;
	private int Recommend;
	private int Rolls;
	private int Strip;
	private int Popular;
	private int Verific;
	private int Comment;
	private int IsTop;
	private int Score;
	private int Slide;
	private int DelTF;
	private int InfoPurview;
	private String ArrGroupID;
	private int ReadPoint;
	private int ChargeType;
	private int PitchTime;
	private int ReadTimes;
	private int DividePercent;
	private String Inputer;
	private String WapTemplateID;
	private int ShowStyle;
	private int PageNum;
	private String MapMarker;
	private String SEOTitle;
	private String SEOKeyWord;
	private String SEODescript;
	private int Status ;
    private int SpecialID;
	
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getTid() {
		return Tid;
	}
	public void setTid(String tid) {
		Tid = tid;
	}
	public String getKeyWords() {
		return KeyWords;
	}
	public void setKeyWords(String keyWords) {
		KeyWords = keyWords;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getPhotoUrl() {
		return PhotoUrl;
	}
	public void setPhotoUrl(String photoUrl) {
		PhotoUrl = photoUrl;
	}
	public String getPicUrls() {
		return PicUrls;
	}
	public void setPicUrls(String picUrls) {
		PicUrls = picUrls;
	}
	public String getPictureContent() {
		return PictureContent;
	}
	public void setPictureContent(String pictureContent) {
		PictureContent = pictureContent;
	}
	public String getAuthor() {
		return Author;
	}
	public void setAuthor(String author) {
		Author = author;
	}
	public String getOrigin() {
		return Origin;
	}
	public void setOrigin(String origin) {
		Origin = origin;
	}
	public String getRank() {
		return Rank;
	}
	public void setRank(String rank) {
		Rank = rank;
	}
	public String getLastHitsTime() {
		return LastHitsTime;
	}
	public void setLastHitsTime(String lastHitsTime) {
		LastHitsTime = lastHitsTime;
	}
	public int getHits() {
		return Hits;
	}
	public void setHits(int hits) {
		Hits = hits;
	}
	public int getHitsByDay() {
		return HitsByDay;
	}
	public void setHitsByDay(int hitsByDay) {
		HitsByDay = hitsByDay;
	}
	public int getHitsByWeek() {
		return HitsByWeek;
	}
	public void setHitsByWeek(int hitsByWeek) {
		HitsByWeek = hitsByWeek;
	}
	public int getHitsByMonth() {
		return HitsByMonth;
	}
	public void setHitsByMonth(int hitsByMonth) {
		HitsByMonth = hitsByMonth;
	}
	public String getAddDate() {
		return AddDate;
	}
	public void setAddDate(String addDate) {
		AddDate = addDate;
	}
	public String getModifyDate() {
		return ModifyDate;
	}
	public void setModifyDate(String modifyDate) {
		ModifyDate = modifyDate;
	}
	public String getJSID() {
		return JSID;
	}
	public void setJSID(String jSID) {
		JSID = jSID;
	}
	public String getTemplateID() {
		return TemplateID;
	}
	public void setTemplateID(String templateID) {
		TemplateID = templateID;
	}
	public String getFname() {
		return Fname;
	}
	public void setFname(String fname) {
		Fname = fname;
	}
	public int getRefreshTF() {
		return RefreshTF;
	}
	public void setRefreshTF(int refreshTF) {
		RefreshTF = refreshTF;
	}
	public int getRecommend() {
		return Recommend;
	}
	public void setRecommend(int recommend) {
		Recommend = recommend;
	}
	public int getRolls() {
		return Rolls;
	}
	public void setRolls(int rolls) {
		Rolls = rolls;
	}
	public int getStrip() {
		return Strip;
	}
	public void setStrip(int strip) {
		Strip = strip;
	}
	public int getPopular() {
		return Popular;
	}
	public void setPopular(int popular) {
		Popular = popular;
	}
	public int getVerific() {
		return Verific;
	}
	public void setVerific(int verific) {
		Verific = verific;
	}
	public int getComment() {
		return Comment;
	}
	public void setComment(int comment) {
		Comment = comment;
	}
	public int getIsTop() {
		return IsTop;
	}
	public void setIsTop(int isTop) {
		IsTop = isTop;
	}
	public int getScore() {
		return Score;
	}
	public void setScore(int score) {
		Score = score;
	}
	public int getSlide() {
		return Slide;
	}
	public void setSlide(int slide) {
		Slide = slide;
	}
	public int getDelTF() {
		return DelTF;
	}
	public void setDelTF(int delTF) {
		DelTF = delTF;
	}
	public int getInfoPurview() {
		return InfoPurview;
	}
	public void setInfoPurview(int infoPurview) {
		InfoPurview = infoPurview;
	}
	public String getArrGroupID() {
		return ArrGroupID;
	}
	public void setArrGroupID(String arrGroupID) {
		ArrGroupID = arrGroupID;
	}
	public int getReadPoint() {
		return ReadPoint;
	}
	public void setReadPoint(int readPoint) {
		ReadPoint = readPoint;
	}
	public int getChargeType() {
		return ChargeType;
	}
	public void setChargeType(int chargeType) {
		ChargeType = chargeType;
	}
	public int getPitchTime() {
		return PitchTime;
	}
	public void setPitchTime(int pitchTime) {
		PitchTime = pitchTime;
	}
	public int getReadTimes() {
		return ReadTimes;
	}
	public void setReadTimes(int readTimes) {
		ReadTimes = readTimes;
	}
	public int getDividePercent() {
		return DividePercent;
	}
	public void setDividePercent(int dividePercent) {
		DividePercent = dividePercent;
	}
	public String getInputer() {
		return Inputer;
	}
	public void setInputer(String inputer) {
		Inputer = inputer;
	}
	public String getWapTemplateID() {
		return WapTemplateID;
	}
	public void setWapTemplateID(String wapTemplateID) {
		WapTemplateID = wapTemplateID;
	}	
	public int getShowStyle() {
		return ShowStyle;
	}
	public void setShowStyle(int showStyle) {
		ShowStyle = showStyle;
	}
	public int getPageNum() {
		return PageNum;
	}
	public void setPageNum(int pageNum) {
		PageNum = pageNum;
	}
	public String getMapMarker() {
		return MapMarker;
	}
	public void setMapMarker(String mapMarker) {
		MapMarker = mapMarker;
	}
	public String getSEOTitle() {
		return SEOTitle;
	}
	public void setSEOTitle(String sEOTitle) {
		SEOTitle = sEOTitle;
	}
	public String getSEOKeyWord() {
		return SEOKeyWord;
	}
	public void setSEOKeyWord(String sEOKeyWord) {
		SEOKeyWord = sEOKeyWord;
	}
	public String getSEODescript() {
		return SEODescript;
	}
	public void setSEODescript(String sEODescript) {
		SEODescript = sEODescript;
	}
	public int getStatus() {
		return Status;
	}
	public void setStatus(int status) {
		Status = status;
	}
	public int getSpecialID() {
		return SpecialID;
	}
	public void setSpecialID(int specialID) {
		SpecialID = specialID;
	}

	
	
	
	
}
