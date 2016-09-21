package org.zerock.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.QnaVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;

@Repository
public class QnaDAOImpl implements QnaDAO {

  @Inject
  private SqlSession session;

  private static String namespace = "org.zerock.mapper.QnaMapper";

  @Override
  public void create(QnaVO vo) throws Exception {
    session.insert(namespace + ".create", vo);
  }

  @Override
  public QnaVO read(Integer bno) throws Exception {
    return session.selectOne(namespace + ".read", bno);
  }

  @Override
  public void update(QnaVO vo) throws Exception {
    session.update(namespace + ".update", vo);
  }

  @Override
  public void delete(Integer bno) throws Exception {
    session.delete(namespace + ".delete", bno);
  }

  @Override
  public List<QnaVO> listAll() throws Exception {
    return session.selectList(namespace + ".listAll");
  }

  @Override
  public List<QnaVO> listPage(int page) throws Exception {

    if (page <= 0) {
      page = 1;
    }

    page = (page - 1) * 10;

    return session.selectList(namespace + ".listPage", page);
  }

  @Override
  public List<QnaVO> listCriteria(Criteria cri) throws Exception {

    return session.selectList(namespace + ".listCriteria", cri);
  }

  @Override
  public int countPaging(Criteria cri) throws Exception {

    return session.selectOne(namespace + ".countPaging", cri);
  }

  @Override
  public List<QnaVO> listSearch(SearchCriteria cri) throws Exception {

    return session.selectList(namespace + ".listSearch", cri);
  }

  @Override
  public int listSearchCount(SearchCriteria cri) throws Exception {

    return session.selectOne(namespace + ".listSearchCount", cri);
  }

  @Override
  public void updateReplyCnt(Integer bno, int amount) throws Exception {

    Map<String, Object> paramMap = new HashMap<String, Object>();

    paramMap.put("bno", bno);
    paramMap.put("amount", amount);

    session.update(namespace + ".updateReplyCnt", paramMap);
  }

  @Override
  public void updateViewCnt(Integer bno) throws Exception {
    
    session.update(namespace+".updateViewCnt", bno);
    
  }
@Override
public QnaVO pass(QnaVO pass) throws Exception {
	return session.selectOne(namespace + ".pass", pass);
}

}
