package com.kh.natta.customDesign.domain;

import java.sql.Date;

public class CustomDesign {

	private int customCode;
	private int onOff;
	private String customTitle;
	private String contents;
	private String tattooType;
	private Date cCreateDate;
	private Date cModifyDate;
	private int customHits;
	private String customerId;
	
	
	public CustomDesign() {}


	public int getCustomCode() {
		return customCode;
	}


	public void setCustomCode(int customCode) {
		this.customCode = customCode;
	}


	public int getOnOff() {
		return onOff;
	}


	public void setOnOff(int onOff) {
		this.onOff = onOff;
	}


	public String getCustomTitle() {
		return customTitle;
	}


	public void setCustomTitle(String customTitle) {
		this.customTitle = customTitle;
	}


	public String getContents() {
		return contents;
	}


	public void setContents(String contents) {
		this.contents = contents;
	}


	public String getTattooType() {
		return tattooType;
	}


	public void setTattooType(String tattooType) {
		this.tattooType = tattooType;
	}


	public Date getcCreateDate() {
		return cCreateDate;
	}


	public void setcCreateDate(Date cCreateDate) {
		this.cCreateDate = cCreateDate;
	}


	public Date getcModifyDate() {
		return cModifyDate;
	}


	public void setcModifyDate(Date cModifyDate) {
		this.cModifyDate = cModifyDate;
	}


	public int getCustomHits() {
		return customHits;
	}


	public void setCustomHits(int customHits) {
		this.customHits = customHits;
	}


	public String getCustomerId() {
		return customerId;
	}


	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}


	@Override
	public String toString() {
		return "CustomDesign [customCode=" + customCode + ", onOff=" + onOff + ", customTitle=" + customTitle
				+ ", contents=" + contents + ", tattooType=" + tattooType + ", cCreateDate=" + cCreateDate
				+ ", cModifyDate=" + cModifyDate + ", customHits=" + customHits + ", customerId=" + customerId + "]";
	}


	public CustomDesign(int customCode, int onOff, String customTitle, String contents, String tattooType,
			Date cCreateDate, Date cModifyDate, int customHits, String customerId) {
		super();
		this.customCode = customCode;
		this.onOff = onOff;
		this.customTitle = customTitle;
		this.contents = contents;
		this.tattooType = tattooType;
		this.cCreateDate = cCreateDate;
		this.cModifyDate = cModifyDate;
		this.customHits = customHits;
		this.customerId = customerId;
	}
}
