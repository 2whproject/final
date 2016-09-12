package org.zerock.service;
import javax.inject.Inject;
 
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.MemberVO;
import org.zerock.persistence.MemberDAO;
@Service
public class MemberServiceImpl implements MemberService{
	@Inject
	private MemberDAO dao;
	
	@Transactional
	@Override
	public void regist(MemberVO member) throws Exception {
		dao.regist(member);
	}
}