package com.kh.natta.qna.domain;

import java.sql.Date;

public class Qna {
	
	private int qnaCode;
	private String qnaTitle;
	private String qnaContents;
	private String qnaWriter;
	private Date qnaCreateDate;
	private Date qnaModifyDate;
	private int qnaHits;
	private int onOff;
	
	public Qna() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Qna(int qnaCode, String qnaTitle, String qnaContents, String qnaWriter, Date qnaCreateDate,
			Date qnaModifyDate, int qnaHits, int onOff) {
		super();
		this.qnaCode = qnaCode;
		this.qnaTitle = qnaTitle;
		this.qnaContents = qnaContents;
		this.qnaWriter = qnaWriter;
		this.qnaCreateDate = qnaCreateDate;
		this.qnaModifyDate = qnaModifyDate;
		this.qnaHits = qnaHits;
		this.onOff = onOff;
	}
	@Override
	public String toString() {
		return "Qna [qnaCode=" + qnaCode + ", qnaTitle=" + qnaTitle + ", qnaContents=" + qnaContents + ", qnaWriter="
				+ qnaWriter + ", qnaCreateDate=" + qnaCreateDate + ", qnaModifyDate=" + qnaModifyDate + ", qnaHits="
				+ qnaHits + ", onOff=" + onOff + "]";
	}
	public int getQnaCode() {
		return qnaCode;
	}
	public void setQnaCode(int qnaCode) {
		this.qnaCode = qnaCode;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContents() {
		return qnaContents;
	}
	public void setQnaContents(String qnaContents) {
		this.qnaContents = qnaContents;
	}
	public String getQnaWriter() {
		return qnaWriter;
	}
	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
	}
	public Date getQnaCreateDate() {
		return qnaCreateDate;
	}
	public void setQnaCreateDate(Date qnaCreateDate) {
		this.qnaCreateDate = qnaCreateDate;
	}
	public Date getQnaModifyDate() {
		return qnaModifyDate;
	}
	public void setQnaModifyDate(Date qnaModifyDate) {
		this.qnaModifyDate = qnaModifyDate;
	}
	public int getQnaHits() {
		return qnaHits;
	}
	public void setQnaHits(int qnaHits) {
		this.qnaHits = qnaHits;
	}
	public int getOnOff() {
		return onOff;
	}
	public void setOnOff(int onOff) {
		this.onOff = onOff;
	}
	
	
}
