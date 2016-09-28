package org.zerock.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.AniReVO;
import org.zerock.domain.Criteria;

@Repository
public class AniReDAOImpl implements AniReDAO {

  @Inject
  private SqlSession session;

  private static String namespace = "org.zerock.mapper.AniReMapper";

  @Override
  public List<AniReVO> list(Integer bno) throws Exception {

    return session.selectList(namespace + ".list", bno);
  }

  @Override
  public void create(AniReVO vo) throws Exception {

    session.insert(namespace + ".create", vo);
  }

  @Override
  public void update(AniReVO vo) throws Exception {

    session.update(namespace + ".update", vo);
  }

  @Override
  public void delete(Integer rno) throws Exception {

    session.update(namespace + ".delete", rno);
  }

  @Override
  public List<AniReVO> listPage(Integer bno, Criteria cri) throws Exception {

    Map<String, Object> paramMap = new HashMap<>();

    paramMap.put("bno", bno);
    paramMap.put("cri", cri);

    return session.selectList(namespace + ".listPage", paramMap);
  }

  @Override
  public int count(Integer bno) throws Exception {

    return session.selectOne(namespace + ".count", bno);

  }

  @Override
  public int getBno(Integer rno) throws Exception {

    return session.selectOne(namespace + ".getBno", rno);
  }
  
  
}
