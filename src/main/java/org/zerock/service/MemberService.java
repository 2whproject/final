package org.zerock.service;

import org.zerock.domain.MemberVO;

public interface MemberService {
	public void regist(MemberVO vo) throws Exception;
	public MemberVO delete(MemberVO mem) throws Exception;
	public MemberVO find(String email) throws Exception;
	public MemberVO select(MemberVO mem) throws Exception;
	public MemberVO leave(MemberVO mem) throws Exception;
	public void registleave(MemberVO member) throws Exception;
}
