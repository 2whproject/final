package org.zerock.domain;

public class MemberVO {
	
	private String uid;
	private String uname;
	private String upw;
	
	
	public String getUid() {
		return uid;
	}


	public void setUid(String uid) {
		this.uid = uid;
	}


	public String getUname() {
		return uname;
	}


	public void setUname(String uname) {
		this.uname = uname;
	}


	public String getUpw() {
		return upw;
	}


	public void setUpw(String upw) {
		this.upw = upw;
	}


	@Override
	public String toString() {
		return "MemberVO [uid=" + uid + ", uname=" + uname + ", upw="+ upw + "]";
	}

}
