package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.QnaVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;

public interface QnaDAO {

  public void create(QnaVO vo) throws Exception;

  public QnaVO read(Integer bno) throws Exception;
  public QnaVO pass(QnaVO pass) throws Exception;

  public void update(QnaVO vo) throws Exception;

  public void delete(Integer bno) throws Exception;

  public List<QnaVO> listAll() throws Exception;

  public List<QnaVO> listPage(int page) throws Exception;

  public List<QnaVO> listCriteria(Criteria cri) throws Exception;

  public int countPaging(Criteria cri) throws Exception;
  //use for dynamic sql
  public List<QnaVO> listSearch(SearchCriteria cri)throws Exception;
  public int listSearchCount(SearchCriteria cri)throws Exception;
  public void updateReplyCnt(Integer bno, int amount)throws Exception;
  public void updateViewCnt(Integer bno)throws Exception;
  
}
