package org.zerock.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.BookVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;

@Repository
public class BookDAOImpl implements BookDAO {

  @Inject
  private SqlSession session;

  private static String namespace = "org.zerock.mapper.BookMapper";

  @Override
  public void create(BookVO vo) throws Exception {
    session.insert(namespace + ".create", vo);
  }

  @Override
  public BookVO read(Integer bno) throws Exception {
    return session.selectOne(namespace + ".read", bno);
  }

  @Override
  public void update(BookVO vo) throws Exception {
    session.update(namespace + ".update", vo);
  }

  @Override
  public void delete(Integer bno) throws Exception {
    session.delete(namespace + ".delete", bno);
  }

  @Override
  public List<BookVO> listAll() throws Exception {
    return session.selectList(namespace + ".listAll");
  }

  @Override
  public List<BookVO> listPage(int page) throws Exception {

    if (page <= 0) {
      page = 1;
    }

    page = (page - 1) * 10;

    return session.selectList(namespace + ".listPage", page);
  }

  @Override
  public List<BookVO> listCriteria(Criteria cri) throws Exception {

    return session.selectList(namespace + ".listCriteria", cri);
  }

  @Override
  public int countPaging(Criteria cri) throws Exception {

    return session.selectOne(namespace + ".countPaging", cri);
  }

  @Override
  public List<BookVO> listSearch(SearchCriteria cri) throws Exception {

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
  public void addAttach(String fullName) throws Exception {
    
    session.insert(namespace+".addAttach", fullName);
    
  }
  
  @Override
  public List<String> getAttach(Integer bno) throws Exception {
    
    return session.selectList(namespace +".getAttach", bno);
  }
 

  @Override
  public void deleteAttach(Integer bno) throws Exception {

    session.delete(namespace+".deleteAttach", bno);
    
  }

  @Override
  public void replaceAttach(String fullName, Integer bno) throws Exception {
    
    Map<String, Object> paramMap = new HashMap<String, Object>();
    
    paramMap.put("bno", bno);
    paramMap.put("fullName", fullName);
    
    session.insert(namespace+".replaceAttach", paramMap);
    
  }

@Override
public List<BookVO> newList() throws Exception {
	
	return session.selectList(namespace + ".newList");
}

}
