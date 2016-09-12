package org.zerock.persistence;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

  @Inject
  private SqlSession session;
  private static String namespace = "org.zerock.mapper.MemberMapper";

  @Override
  public void regist(MemberVO member) throws Exception {
    session.insert(namespace + ".regist", member);
  }


}
