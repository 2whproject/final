package org.zerock.domain;

import java.util.Date;

public class MovieReplyVO {

  private Integer rno;
  private String replytext;
  private String replyer;
  private String title_link;
  private String movieId;



private Date regdate;
  private Date updatedate;

  public String getMovieId() {
	  return movieId;
  }
  
  public void setMovieId(String movieId) {
	  this.movieId = movieId;
  }
  public Integer getRno() {
    return rno;
  }

  public void setRno(Integer rno) {
    this.rno = rno;
  }

  public String getReplytext() {
    return replytext;
  }

  public void setReplytext(String replytext) {
    this.replytext = replytext;
  }

  public String getReplyer() {
    return replyer;
  }

  public void setReplyer(String replyer) {
    this.replyer = replyer;
  }

  public Date getRegdate() {
    return regdate;
  }

  public void setRegdate(Date regdate) {
    this.regdate = regdate;
  }

  public Date getUpdatedate() {
    return updatedate;
  }

  public void setUpdatedate(Date updatedate) {
    this.updatedate = updatedate;
  }

	public String getTitle_link() {
		return title_link;
	}

	public void setTitle_link(String title_link) {
		this.title_link = title_link;
	}
  @Override
  public String toString() {
    return "MovieReplyVO [rno=" + rno + ", replytext=" + replytext + ", replyer=" + replyer + ", regdate="
        + regdate + ", updatedate=" + updatedate + ", title_link=" + title_link +", movieId"+ movieId +"]";
  }
}
