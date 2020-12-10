package com.kh.natta.qna.domain;

import java.sql.Date;

public class QnaComment {
	
	private int qcCode;
	private String qcTitle;
	private String qcContents;
	private String qcWriter;
	private Date qcCreateDate;
	private Date qcModifyDate;
	private int onOff;
	private int qnaCode;
	
	public QnaComment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QnaComment(int qcCode, String qcTitle, String qcContents, String qcWriter, Date qcCreateDate,
			Date qcModifyDate, int onOff, int qnaCode) {
		super();
		this.qcCode = qcCode;
		this.qcTitle = qcTitle;
		this.qcContents = qcContents;
		this.qcWriter = qcWriter;
		this.qcCreateDate = qcCreateDate;
		this.qcModifyDate = qcModifyDate;
		this.onOff = onOff;
		this.qnaCode = qnaCode;
	}
	@Override
	public String toString() {
		return "QnaComment [qcCode=" + qcCode + ", qcTitle=" + qcTitle + ", qcContents=" + qcContents + ", qcWriter="
				+ qcWriter + ", qcCreateDate=" + qcCreateDate + ", qcModifyDate=" + qcModifyDate + ", onOff=" + onOff
				+ ", qnaCode=" + qnaCode + "]";
	}
	public int getQcCode() {
		return qcCode;
	}
	public void setQcCode(int qcCode) {
		this.qcCode = qcCode;
	}
	public String getQcTitle() {
		return qcTitle;
	}
	public void setQcTitle(String qcTitle) {
		this.qcTitle = qcTitle;
	}
	public String getQcContents() {
		return qcContents;
	}
	public void setQcContents(String qcContents) {
		this.qcContents = qcContents;
	}
	public String getQcWriter() {
		return qcWriter;
	}
	public void setQcWriter(String qcWriter) {
		this.qcWriter = qcWriter;
	}
	public Date getQcCreateDate() {
		return qcCreateDate;
	}
	public void setQcCreateDate(Date qcCreateDate) {
		this.qcCreateDate = qcCreateDate;
	}
	public Date getQcModifyDate() {
		return qcModifyDate;
	}
	public void setQcModifyDate(Date qcModifyDate) {
		this.qcModifyDate = qcModifyDate;
	}
	public int getOnOff() {
		return onOff;
	}
	public void setOnOff(int onOff) {
		this.onOff = onOff;
	}
	public int getQnaCode() {
		return qnaCode;
	}
	public void setQnaCode(int qnaCode) {
		this.qnaCode = qnaCode;
	}
	
	
	
	
}
