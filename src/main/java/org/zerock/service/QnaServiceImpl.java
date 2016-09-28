package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.QnaVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;
import org.zerock.persistence.QnaDAO;

@Service
public class QnaServiceImpl implements QnaService {

  @Inject
  private QnaDAO dao;

  
  @Transactional
  @Override
  public void regist(QnaVO board) throws Exception {
    dao.create(board);
  }
  @Transactional(isolation=Isolation.READ_COMMITTED)
  @Override
  public QnaVO read(Integer bno) throws Exception {
    dao.updateViewCnt(bno);
    return dao.read(bno);
  }
  @Transactional
  @Override
  public void modify(QnaVO board) throws Exception {
    dao.update(board);
    Integer bno = board.getBno();
  }
  
  @Transactional
  @Override
  public void remove(Integer bno) throws Exception {
    dao.delete(bno);
  } 

  @Override
  public List<QnaVO> listAll() throws Exception {
    return dao.listAll();
  }

  @Override
  public List<QnaVO> listCriteria(Criteria cri) throws Exception {

    return dao.listCriteria(cri);
  }

  @Override
  public int listCountCriteria(Criteria cri) throws Exception {

    return dao.countPaging(cri);
  }

  @Override
  public List<QnaVO> listSearchCriteria(SearchCriteria cri) throws Exception {

    return dao.listSearch(cri);
  }

  @Override
  public int listSearchCount(SearchCriteria cri) throws Exception {

    return dao.listSearchCount(cri);
  }

@Transactional
@Override
public QnaVO pass(QnaVO pass) throws Exception {
	return dao.pass(pass);
}
@Override
public List<QnaVO> listNew() throws Exception {
	return dao.listNew();
}   
}
