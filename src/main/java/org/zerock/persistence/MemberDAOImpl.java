package org.zerock.persistence;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.BoardVO;
import org.zerock.domain.MemberVO;
@Repository
public class MemberDAOImpl implements MemberDAO {

  @Inject
  private SqlSession session;

  private static String namespace = "org.zerock.mapper.MemberMapper";

  @Override
  public void regist(MemberVO vo) throws Exception {
    session.insert(namespace + ".regist", vo);
  }
  @Override
  public MemberVO find(String email) throws Exception {
	return session.selectOne(namespace + ".find", email);
}
  @Override
  public MemberVO delete(MemberVO mem) throws Exception {
	return session.selectOne(namespace + ".delete", mem);
}
  @Override
 public MemberVO select(MemberVO mem) throws Exception {
	return session.selectOne(namespace + ".select", mem);
}
 @Override
 public MemberVO leave(MemberVO mem) throws Exception {
	return session.selectOne(namespace + ".leave", mem);
}
 @Override
 public void leaveregist(MemberVO member) throws Exception {
	 session.insert(namespace+ ".registleave", member);
}
}
