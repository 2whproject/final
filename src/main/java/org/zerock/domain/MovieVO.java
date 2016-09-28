package org.zerock.domain;

import java.util.Date;

public class MovieVO {
	private Integer bno;
	private String title;
	private String content;
	private String writer;
	private String title_link;
	private Date regdate;
	private int viewcnt;
	private int replycnt;
	
	public Integer getBno() {
	    return bno;
	  }

	  public void setBno(Integer bno) {
	    this.bno = bno;
	  }
	
	public String getTitle_link() {
		return title_link;
	}
	public void setTitle_link(String title_link) {
		this.title_link = title_link;
	}
	
	public int getReplycnt() {
		return replycnt;
	}
	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	@Override
	public String toString() {
		return "MovieVO [title=" + title +", bno=" + bno + ", content="
				+ content + ", writer=" + writer + ", regdate=" + regdate
				+ ", viewcnt=" + viewcnt + ", replycnt=" + replycnt
				+ ", title_link=" + title_link;
	}

}
