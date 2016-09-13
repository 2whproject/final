package org.zerock.service;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.MemberVO;
import org.zerock.persistence.MemberDAO;
@Service
public class MemberServiceImpl implements MemberService {

  @Inject
  private MemberDAO dao;

  
  @Transactional
  @Override
  public void regist(MemberVO member) throws Exception {
    dao.regist(member);
  }
  @Override
  public MemberVO find(String email) throws Exception {
	return dao.find(email);
}
  @Override
  public MemberVO delete(MemberVO mem) throws Exception {
	return dao.delete(mem);
}
  @Override
  public MemberVO select(MemberVO mem) throws Exception {
	return dao.select(mem);
}
  @Override
  public MemberVO leave(MemberVO mem) throws Exception {
	return dao.leave(mem);
}
  @Override
  public void registleave(MemberVO member) throws Exception {
	dao.leaveregist(member);
	
}
  
}
