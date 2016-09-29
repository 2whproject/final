package org.zerock.domain;

import java.util.Date;

public class AniVO {
	
	private Integer bno;
	private String author; 
	private String author_t; 
	private String isbn;
	private String cover_l_url;
	private String title;
	private String title2;
	private String content;
	private String writer;
	private Date regdate;
	private int viewcnt;
	private int replycnt;
	private String pub_nm;
	private String list_price;
	private String link;
	
	
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getList_price() {
		return list_price;
	}
	public void setList_price(String list_price) {
		this.list_price = list_price;
	}
	public String getPub_nm() {
		return pub_nm;
	}
	public void setPub_nm(String pub_nm) {
		this.pub_nm = pub_nm;
	}
	public String getAuthor_t() {
		return author_t;
	}
	public void setAuthor_t(String author_t) {
		this.author_t = author_t;
	}
	public String getCover_l_url() {
		return cover_l_url;
	}
	public void setCover_l_url(String cover_l_url) {
		this.cover_l_url = cover_l_url;
	}
	public String getTitle2() {
		return title2;
	}
	public void setTitle2(String title2) {
		this.title2 = title2;
	}
	
	public int getReplycnt() {
		return replycnt;
	}
	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	
	public String getComicname() {
		return title2;
	}
	public void setComicname(String title2) {
		this.title2 = title2;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
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
		return "AniVO [bno=" + bno + ", title=" + title
				+ ", author=" + author + ", isbn=" + isbn
				+ ", title2=" + title2 + ", content="
				+ content + ", writer=" + writer + ", regdate=" + regdate
				+ ", viewcnt=" + viewcnt + ", replycnt=" + replycnt
				+ "]";
	}

}
