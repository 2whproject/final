package org.zerock.domain;
public class LogVO {
	private int no;
	private String time;
	private String uid;
	private String locale;
	public String getUid() {
		return uid;
	}
	public String getLocale() {
		return locale;
	}
	public void setLocale(String locale) {
		this.locale = locale;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	private boolean result;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public boolean isResult() {
		return result;
	}
	public void setResult(boolean result) {
		this.result = result;
	}
	  @Override
	  public String toString() {
	    return "LogVO [uid=" + uid + ", time= " + time + ", result =" + result + ", locale = " + locale + "]";
	  }
}
